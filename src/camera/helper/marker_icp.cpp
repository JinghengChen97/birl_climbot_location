/* @ file decription: ICP程序，用于解算mc(motion capture)坐标系下marker的姿态（T_world_aruco）。
    输入：marker的四个点在mc坐标系下的坐标，markerr的真实边长
    输出：marker在mc坐标系下的位姿矩阵
    过程：icp
 * @ parameter you may modify:
	ARUCO_POINT_ROTATION：贴好的marker的四个边角点（顺序：左上，右上，右下，左下，顺时针。）
	ARUCO_POINT_ORIGINAL：marker与mc坐标系重合时的四个边角点，顺序与上一致
* @ other: none
* @ author: 19硕陈劲恒
* @ email: 837515960@qq.com
* @ test method: 
将Motioncapture一个marker放到aruco中心，看解算数据与mc给出的数据相差大不大
 * */

/** 报错！！！求解出的结果不符合右手定则，有待debug！！！ **/
#include <iostream>
#include <vector>
using namespace std;

#include <Eigen/SVD>
#include <Eigen/Dense>
using namespace Eigen;

#include <opencv2/opencv.hpp>
#include <opencv2/core/eigen.hpp>
using namespace cv;

float ARUCO_POINT_ROTATION[4][3] = {{2547.6, 1326.0, 1389.5}, {2338.1, 1322.5, 1391.4}, {2336.4, 1118.2, 1392.4}, {2548.7, 1115.0, 1391.6}};
float ARUCO_POINT_ORIGINAL[4][3] = {{-100, 100, 0}, {100, 100, 0}, {100, -100, 0}, {-100, -100, 0}};

void pose_estimation_3d3d(const vector<Point3f>& pts1, const vector<Point3f>& pts2, Eigen::Matrix4d& T);

int main (int argc, char** argv) {
    //init
    vector<Point3f> points_goal, points_original;
    for (int i = 0; i < 3; i ++) {
        Point3f point_rotation(ARUCO_POINT_ROTATION[i][0], ARUCO_POINT_ROTATION[i][1], ARUCO_POINT_ROTATION[i][2]);
        points_goal.emplace_back(point_rotation);

        Point3f point_original(ARUCO_POINT_ORIGINAL[i][0], ARUCO_POINT_ORIGINAL[i][1], ARUCO_POINT_ORIGINAL[i][2]);
        points_original.emplace_back(point_original);
    }
    Matrix4d T_world_aruco = Matrix4d::Identity();

    pose_estimation_3d3d(points_goal, points_original, T_world_aruco);//T_world_aruco
    cout << "T_world_aruco: " << T_world_aruco << endl << endl;
    cout << "T_aurco_world: " << T_world_aruco.inverse() << endl << endl;
}

void pose_estimation_3d3d(
        const vector<Point3f>& pts1,
        const vector<Point3f>& pts2,
        Eigen::Matrix4d& T
)
{
    //1. 去质心坐标q1 q2
    Point3f p1, p2;//Point3f是一个3D点的坐标
    int N = pts1.size();
    for (int i = 0; i<N; i++)
    {
        p1 += pts1[i];
        p2 += pts2[i];
    }
    p1 = Point3f(Vec3f(p1) / N);//Vec3f指的是图像3通道
    p2 = Point3f(Vec3f(p2) / N);

    vector<Point3f> q1(N), q2(N); // vector<Point3f>向量，向量的每个分量都是3D点
    for (int i = 0; i<N; i++)
    {
        q1[i] = pts1[i] - p1;
        q2[i] = pts2[i] - p2;
    }

    // 2. W=sum(q1*q2^T)
    Eigen::Matrix3d W = Eigen::Matrix3d::Zero();//Matrix3d是3*3，Vector3d是3*1
    for (int i = 0; i<N; i++)
    {
        W += Eigen::Vector3d(q1[i].x, q1[i].y, q1[i].z) * Eigen::Vector3d(q2[i].x, q2[i].y, q2[i].z).transpose();
    }
//    cout << "W=" << W << endl;

    // 3. SVD on W
    Eigen::JacobiSVD<Eigen::Matrix3d> svd(W, Eigen::ComputeFullU | Eigen::ComputeFullV);
    Eigen::Matrix3d U = svd.matrixU();
    Eigen::Matrix3d V = svd.matrixV();
//    cout << "U=" << U << endl;
//    cout << "V=" << V << endl;
    // 4. R=U*V^T
    Eigen::Matrix3d R_ = U* (V.transpose());
    Eigen::Vector3d t_ = Eigen::Vector3d(p1.x, p1.y, p1.z) - R_ * Eigen::Vector3d(p2.x, p2.y, p2.z);

   //5.return matrix4d
    for (int i = 0; i < 3; i ++) {
        for (int j = 0; j < 3; j++) {
            T(i, j) = R_(i, j);
        }
    }
    for (int i = 0; i < 3; i ++) {
        T(i, 3) = t_(i, 0);
    }
}
