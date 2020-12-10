// License: Apache 2.0. See LICENSE file in root directory.
// Copyright(c) 2017 Intel Corporation. All Rights Reserved.

#include <librealsense2/rs.hpp> // Include RealSense Cross Platform API
#include <opencv2/opencv.hpp>   // Include OpenCV API
#include <string>
#include <ui/robot_feedback.h>
#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include "ClimberKinematics5D.h"
#include <thread>
using namespace std;
bool to_record = false;
vector<double> ENCODER_DATA(5, 0);

void control_thread() {
    while (true) {
        int flag = 0;
        cout << "Please input '1'\n";
        cin >> flag;
        if (flag == 1) {
            to_record = true;
            flag = 0;
        } else break;
    }
}
void GetEncoderData(const ui::robot_feedbackConstPtr& data) {
    ENCODER_DATA[0] = data->feedbackPosData[0];
    ENCODER_DATA[1] = data->feedbackPosData[1];
    ENCODER_DATA[2] = data->feedbackPosData[2];
    ENCODER_DATA[3] = data->feedbackPosData[3];
    ENCODER_DATA[4] = data->feedbackPosData[4];
}

void ros_thread() {
    //ros
    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("/low_level/joints_point_feedback", 100, GetEncoderData);
    ros::spin();
}

int main(int argc, char * argv[]) try
{
    ros::init(argc, argv, "camera_calibration");
    // Declare depth colorizer for pretty visualization of depth data
    rs2::colorizer color_map;

    // Declare RealSense pipeline, encapsulating the actual device and sensors
    rs2::pipeline pipe;
    // Start streaming with default recommended configuration
    pipe.start();

    using namespace cv;
    const auto window_name = "Display Image";
    namedWindow(window_name, WINDOW_AUTOSIZE);

    ClimbotKinematics *kinematics = new ClimberKinematics5D();//运动学
    std::thread control(control_thread);
    std::thread ros_t(ros_thread);
    int count = 0;
    while (waitKey(1) < 0 && getWindowProperty(window_name, WND_PROP_AUTOSIZE) >= 0)
    {
        rs2::frameset data = pipe.wait_for_frames(); // Wait for next set of frames from the camera
        rs2::frame depth = data.get_depth_frame().apply_filter(color_map);
        rs2::frame rgb = data.get_color_frame();

        // Query frame size (width and height)
//        const int w = depth.as<rs2::video_frame>().get_width();
//        const int h = depth.as<rs2::video_frame>().get_height();

        const int w = rgb.as<rs2::video_frame>().get_width();
        const int h = rgb.as<rs2::video_frame>().get_height();

        // Create OpenCV matrix of size (w,h) from the colorized depth data
//        Mat image(Size(w, h), CV_8UC3, (void*)depth.get_data(), Mat::AUTO_STEP);
        Mat image(Size(w, h), CV_8UC3, (void*)rgb.get_data(), Mat::AUTO_STEP);
        cvtColor(image, image, COLOR_BGR2RGB);

        //record
        if (to_record) {
            to_record = false;
            //encoder_data
            auto T = kinematics->GetTransformMatrix(ClimberKinematics5D::G6, ENCODER_DATA);
            Eigen::Matrix3d R = T.block(0, 0, 3, 3);
            Eigen::Vector3d euler_angles = R.eulerAngles(2, 1, 0);

            string num_string = to_string(count);
            if (num_string.size() == 1) num_string = "0" + num_string;
            ofstream halcon_format("./movingcam_robot_pose_" + num_string + ".dat", ofstream::out);
            halcon_format << "f 2" << endl;
            halcon_format << "r " << euler_angles[0] / PI * 180 << " " << euler_angles[1] / PI * 180 << " " << euler_angles[2] / PI * 180 << endl;
            halcon_format << "t " << T(0, 3) / 1000 << " "<< T(1, 3) / 1000 << " " << T(2, 3) / 1000 << endl;
            halcon_format.close();
            count++;

            //picture
            cv::imwrite("./pic_" + num_string + ".jpg" , image);
            cout << "Current index of pictures is : " << num_string << endl;
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
