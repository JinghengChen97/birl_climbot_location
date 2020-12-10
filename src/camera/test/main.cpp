/* file decription: 大模块攀爬机器人UWB定位框架的Camera part,主要功能：检查相机视野范围内有无aruco；如有：计算T_camera_aruco,然后发布至tf系统以及"camera_pose"话题；如无：不作任何处理
 * parameter you may modify:
	CAMERA_MATRIX：相机内参
	DISTORTION_COEFFICIENT：畸变系数
	ARUCO_SIZE：aruco实物的真实尺寸
	AXIS_SIZE：aruco在图像上显示时的坐标大小
	ARUCO_POSE_MAP：<aruco_id, T_world_aruco>哈希表
* other: 模块工作原理：ARUCO_POSE_MAP是一张<aruco_id, T_world_aruco>的哈希表，当检测到视野范围内有aruco时，计算T_camera_aruco,并从ARUCO_POSE_MAP中取出T_world_aruco，进而计算T_world_camera = T_world_aruco * T_aruco_camera
* author: 19硕陈劲恒
* email: 837515960@qq.com 
* test method: 由于aruco的位姿检测不是常值，难用gtest框架来帮助测试，因此只能手动测试：
1.用mc marker贴到相机上，相机放平且Z轴朝向与mc坐标系相同，并将相机坐标系与marker坐标系对齐
2.通过motion capture给出T_world_aruco(捕获aruco四个点位置，然后姿态与所在壁面相同)
2.对比motion capture给出的T_world_marker(通过vrpn_ros_client package)与此程序输出的T_world_camera(通过tf工具,rosrun tf tf_echo world camera),若两个tf是绕Z旋转180°的关系(因为相机坐标系y轴朝下，mc marker y轴朝上)、位置数值相差不大则证明程序无明显逻辑错误（精度仍需进一步确定）
*/

#include <librealsense2/rs.hpp> // Include RealSense Cross Platform API

#include <ui/robot_feedback.h>
#include <ros/ros.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <tf/transform_broadcaster.h>

#include <iostream>
#include <string>
#include <unordered_map>

//#include <Eigen/Core>
//#include <Eigen/Geometry>
//#include<Eigen/Dense>  //包括所有非Sparse模块
//#include<Eigen/Sparese>  //该模块主要关于与稀疏矩阵相关的内容
#include<Eigen/Eigen>  //包括Eigen库的所有模块

#include <opencv2/opencv.hpp>   // Include OpenCV API
#include <opencv2/aruco.hpp>
#include <opencv2/core/eigen.hpp>

#define DEBUG
using namespace std;
using namespace cv;

/** camera intrinsic parameters **/
float CAMERA_MATRIX[3][3] = {613.6661506320662, 0,                 327.8814485217687,
                             0,                 614.0654480623958, 241.6633884644043,
                             0,                 0,                 1};//畸变系数
float DISTORTION_COEFFICIENT[5] = {0.0772958576019445, 0.03531108499947964, 0.0001969326393878592, 0.0003117750293216238, 0};

/** ArUco parameters **/
const int ARUCO_SIZE = 200;//actual size of aruco(user should think about what the unit is)
const int AXIS_SIZE = 100;
unordered_map<int, Eigen::Matrix4d> ARUCO_POSE_MAP;

/** Related homogeneous matrix **/
const double TRANSITION_G0_CAMERA[3] = {245.69, -27.19, 166.566};//Z-Y-X
const double RPY_G0_CAMERA[3] = {1.52706 ,3.13598, 0.0179933};//Z-Y-X
const char X = 2;
const char Y = 1;
const char Z = 0;

/** helper functions **/
/* 
描述：将Pose消息包中的位姿发布到tf中
输入： pose消息包，子坐标系名
输出：发布一个tf，以pose中数据为转换矩阵数据
 */
void PublishPose2TF(const geometry_msgs::PoseWithCovarianceStamped& data, const string& child_frame_name);//send pose to tf system


/* 
描述：将齐次矩阵打包成pose消息
输入： 齐次矩阵，目的消息包，aruco的索引
输出：发布一个tf，以pose中数据为转换矩阵数据
 */
void HomogeneousMatrix2GeometryPoseMsg(const Eigen::Matrix4d& T, geometry_msgs::PoseWithCovarianceStamped& data, int aruco_index);

Mat R_T2HomogeneousMatrix(const Mat& R, const Mat& T);

int main(int argc, char * argv[]) try
{

#ifdef DEBUG
    ARUCO_POSE_MAP[23] = Eigen::Matrix4d::Identity();
//    ARUCO_POSE_MAP[23] <<-0.999958,  0.00190698,  0.00898834,     2440.64,
//                        0.00195036,    0.999986,  0.00481971,     1222.17,
//                        0.00897902, -0.00483703,  0.999948,       1390.96,
//                        0,           0,           0,                1;

    /**  ICP的结果的xy列叉乘得到z列，目前ICP程序有问题，求出的结果不符合右手坐标系，只能暂时这样搞了 **/
    ARUCO_POSE_MAP[23] <<  -0.999958000000000,   0.001950360000000,  -0.008979023072664, 2440.64,
                            0.001906980000000,   0.999986000000000,   0.004837038070982, 1222.17,
                            0.008988340000000,   0.004819710000000,  -0.999947719885513, 1390.96,
                            0, 0, 0, 1;
#endif
    //ros init
    ros::init(argc, argv, "camera_pose");
    ros::NodeHandle node;
    ros::Publisher camera_pose_publisher = node.advertise<geometry_msgs::PoseWithCovarianceStamped>("camera_pose", 10);
    ros::Publisher G0_pose_publisher = node.advertise<geometry_msgs::PoseWithCovarianceStamped>("/G0_pose", 10);

    //realsense initialization
    rs2::colorizer color_map;
    rs2::pipeline pipe;
    pipe.start();
    const auto window_name = "Display Image";
    namedWindow(window_name, WINDOW_AUTOSIZE);

    //aurco初始化
    std::vector<int> markerIds;
    std::vector<std::vector<cv::Point2f>> markerCorners, rejectedCandidates;
    cv::Ptr<cv::aruco::DetectorParameters> parameters = cv::aruco::DetectorParameters::create();
    cv::Ptr<cv::aruco::Dictionary> dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_6X6_250);
    cv::Mat cameraMatrix = cv::Mat(3,3,CV_32FC1,CAMERA_MATRIX);
    cv::Mat distCoeffs = cv::Mat(1,5,CV_32FC1,DISTORTION_COEFFICIENT);

    //T_G0_camera初始化
    Eigen::Matrix3d R_G0_camera;
    R_G0_camera = ( Eigen :: AngleAxisd ( RPY_G0_CAMERA[Z], Eigen :: Vector3d ::UnitZ())
                  * Eigen :: AngleAxisd (RPY_G0_CAMERA[Y] , Eigen :: Vector3d ::UnitY())
                  * Eigen :: AngleAxisd (RPY_G0_CAMERA[X] , Eigen :: Vector3d ::UnitX())) ;
    Eigen::Isometry3d isometry_G0_camera = Eigen::Isometry3d::Identity();
    isometry_G0_camera.rotate(R_G0_camera);
    isometry_G0_camera.pretranslate(Eigen::Vector3d(TRANSITION_G0_CAMERA[X], TRANSITION_G0_CAMERA[Y], TRANSITION_G0_CAMERA[Z]));
    Eigen::Matrix4d T_G0_camera =  isometry_G0_camera.matrix();
#ifdef DEBUG
    cout << "T_G0_camera is :" << endl << T_G0_camera << endl;
#endif

    while (waitKey(1) < 0 && getWindowProperty(window_name, WND_PROP_AUTOSIZE) >= 0)
    {
        /** get a picture **/
        rs2::frameset data = pipe.wait_for_frames(); // Wait for next set of frames from the camera
        rs2::frame depth = data.get_depth_frame().apply_filter(color_map);
        rs2::frame rgb = data.get_color_frame();
        const int w = rgb.as<rs2::video_frame>().get_width();
        const int h = rgb.as<rs2::video_frame>().get_height();
        Mat image(Size(w, h), CV_8UC3, (void*)rgb.get_data(), Mat::AUTO_STEP);
        cvtColor(image, image, COLOR_BGR2RGB);

        /** detect aruco **/
        std::vector<int> ids;
        std::vector<std::vector<cv::Point2f>> corners;
        cv::aruco::detectMarkers(image, dictionary, corners, ids);

        /** estimate pose of aruco **/
        if (ids.size() > 0) {        // if at least one marker detected
            cv::aruco::drawDetectedMarkers(image, corners, ids);
            std::vector<cv::Vec3d> rvecs, tvecs;
            cv::aruco::estimatePoseSingleMarkers(corners, ARUCO_SIZE, cameraMatrix, distCoeffs, rvecs, tvecs);//200是真实的marker边长，这里仅输入数值（这里有可能是200m或200mm），单位由用户自行辨识与管理

            // draw axis for each marker
            for(int i=0; i<ids.size(); i++){
#ifdef DEBUG
                cout << "Aruco position (camera frame)" << i <<": " << tvecs[i] << endl;
#endif
                cv::aruco::drawAxis(image, cameraMatrix, distCoeffs, rvecs[i], tvecs[i], AXIS_SIZE);

                ///ARUCO检测出哪一个码
                ///然后从pose_map中拿出这个码的世界坐标系下姿态
                auto aruco_pose = ARUCO_POSE_MAP[ids[i]];
                const auto& T_world_aruco = aruco_pose.matrix();
                ///T_world_camera = T_world_aruco * T_aruco_camera

                //T_aruco_camera
                Mat rotation_matrix;
                Rodrigues(rvecs[i], rotation_matrix);
                Eigen::Matrix4d T_camera_aruco = Eigen::Matrix4d::Identity();
                for (int row = 0; row < 3; row++) {
                    for (int col = 0; col < 3; col++) {
                        T_camera_aruco(row, col) = rotation_matrix.at<double>(row, col);
                    }
                }
                for (int row = 0; row < 3; row++) {
                    T_camera_aruco(row, 3) = tvecs[i][row];
                }


                //T_world_camera
                auto T_world_camera = T_world_aruco * T_camera_aruco.inverse();

                geometry_msgs::PoseWithCovarianceStamped camera_pose, G0_pose;
                /** T_world_camera **/
                HomogeneousMatrix2GeometryPoseMsg(T_world_camera, camera_pose, ids[i]);
                camera_pose_publisher.publish(camera_pose);//geometry_msgs
                PublishPose2TF(camera_pose, "camera");//tf

                /** T_world_G0 **/
                auto T_world_G0 = T_world_camera * T_G0_camera.inverse();
                HomogeneousMatrix2GeometryPoseMsg(T_world_G0, G0_pose, ids[i]);
                G0_pose_publisher.publish(G0_pose);
                PublishPose2TF(G0_pose, "G0");//tf
            }
        }
        // Update the window with new data
        imshow(window_name, image);
    }

    return EXIT_SUCCESS;
}

catch (const rs2::error & e)
{
    std::cerr << "RealSense error calling " << e.get_failed_function() << "(" << e.get_failed_args() << "):\n    " << e.what() << std::endl;
    return EXIT_FAILURE;
}
catch (const std::exception& e)
{
    std::cerr << e.what() << std::endl;
    return EXIT_FAILURE;
}

void PublishPose2TF(const geometry_msgs::PoseWithCovarianceStamped& data, const string& child_frame_name) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(tf::Quaternion(
            data.pose.pose.orientation.x,
            data.pose.pose.orientation.y,
            data.pose.pose.orientation.z,
            data.pose.pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data.pose.pose.position.x,
                    data.pose.pose.position.y,
                    data.pose.pose.position.z));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", child_frame_name));
}

void HomogeneousMatrix2GeometryPoseMsg(const Eigen::Matrix4d& T, geometry_msgs::PoseWithCovarianceStamped& data, int aruco_index) {
    data.header.seq = aruco_index;
    data.header.frame_id = "world";
    data.header.stamp = ros::Time::now();
    auto t = T.col(3);
    data.pose.pose.position.x = t.x() / 1000;
    data.pose.pose.position.y = t.y() / 1000;
    data.pose.pose.position.z = t.z() / 1000;

    Eigen::Quaterniond q(Eigen::Matrix3d(T.block<3, 3>(0, 0)));
    data.pose.pose.orientation.w = q.w();
    data.pose.pose.orientation.x = q.x();
    data.pose.pose.orientation.y = q.y();
    data.pose.pose.orientation.z = q.z();
    if (data.pose.pose.orientation.w < 0) {
        data.pose.pose.orientation.w *= -1;
        data.pose.pose.orientation.x *= -1;
        data.pose.pose.orientation.y *= -1;
        data.pose.pose.orientation.z *= -1;
    }
}

Mat R_T2HomogeneousMatrix(const Mat& R,const Mat& T)
{
    Mat HomoMtr;
    Mat_<double> R1 = (Mat_<double>(4, 3) <<
            R.at<double>(0, 0), R.at<double>(0, 1), R.at<double>(0, 2),
            R.at<double>(1, 0), R.at<double>(1, 1), R.at<double>(1, 2),
            R.at<double>(2, 0), R.at<double>(2, 1), R.at<double>(2, 2),
            0, 0, 0);
    Mat_<double> T1 = (Mat_<double>(4, 1) <<
                                          T.at<double>(0,0),
            T.at<double>(1,0),
            T.at<double>(2,0),
            1);
    cv::hconcat(R1, T1, HomoMtr);		//矩阵拼接
    return HomoMtr;
}
