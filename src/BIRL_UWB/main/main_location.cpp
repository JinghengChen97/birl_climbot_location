//
// Created by ch on 20-4-30.
//

#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <geometry_msgs/PointStamped.h>
#include <iostream>
#include <chrono>
#include "BIRL_UWB.h"
#include "uwb_msg/UWB.h"
#define DEBUG
//#define RVIZ
//#define LOCATION_EX

BIRL_UWB* uwb;
int main( int argc, char** argv ){
    ros::init(argc, argv, "BIRL_UWB");
    ros::NodeHandle n;
    ros::Publisher point_publisher = n.advertise<geometry_msgs::PointStamped>("UWB_tracking_rviz", 10);//显示在RVIZ上
    ros::Publisher uwb_msg_publisher = n.advertise<uwb_msg::UWB>("UWB_tracking_msg", 10);
#ifdef DEBUG
    char dev[] = "/dev/ttyACM0";
    uwb = new BIRL_UWB(dev);
    if (!uwb->IsAvailable()){
        std::cout << "Fail to open p440.\n";
        return -1;
    }
#else
#endif
    ///初始化模块
    uwb->setNumOfP440s(5);
    uwb->setOperationMode(BIRL_UWB::LOCATION);
    uwb->setLocationConfig(BIRL_UWB::ELL);
    uwb->setLocationMode(BIRL_UWB::TRACKING);


    ///等待1秒
    ROS_INFO_STREAM_ONCE("Waiting for initializing...\n");
    auto t1=std::chrono::steady_clock::now();
    while(true){
        auto t2=std::chrono::steady_clock::now();
        if(std::chrono::duration_cast<std::chrono::seconds>(t2 - t1).count() > 1)break;
    }

    ///开始发送数据
    ROS_INFO_STREAM_ONCE("Begin to publish data...\n");
    ros::Rate rate(90);

    geometry_msgs::PointStamped point;//显示在RVIZ
    point.header.frame_id = "UWB";

    uwb_msg::UWB UWB_tracking_msg;//具体的定位结果
    UWB_tracking_msg.header.frame_id = "UWB";
#ifndef LOCATION_EX
    LocationInfo location{};
#else
    LocationInfoEX location{};
#endif

    while(ros::ok()){
#ifndef LOCATION_EX
        if(uwb->getTrackingInfo(location)){
#else
        if(uwb->getTrackingInfoEX(location)){
#endif
            static bool is_init = true;
            static long last_x, last_y, last_z;

            point.point.x = location.x;
            point.point.y = location.y;
            point.point.z = location.z;
            point.header.stamp = ros::Time::now();

            UWB_tracking_msg.header.stamp = ros::Time::now();
            UWB_tracking_msg.position[0] = location.x;
            UWB_tracking_msg.position[1] = location.y;
            UWB_tracking_msg.position[2] = location.z;
            if(is_init){
                last_x = location.x;
                last_y = location.y;
                last_z = location.z;
                is_init = false;
            }else{
                if((last_x == location.x) && (last_y == location.y) && (last_z == location.z)){
                    UWB_tracking_msg.solver_error_code = 1;
                }
                else{
                    last_x = location.x;
                    last_y = location.y;
                    last_z = location.z;

                    UWB_tracking_msg.solver_error_code = 0;
                }

            }
//            UWB_tracking_msg.solver_error_code = location.solverErrorCode;
#ifdef RVIZ   //在Rviz下显示要将尺度缩小1000倍
            point.point.x /= 1000;
            point.point.y /= 1000;
            point.point.z /= 1000;
#endif
            uwb_msg_publisher.publish(UWB_tracking_msg);
            point_publisher.publish(point);
        }
    }
    rate.sleep();
}
