#include <ros/ros.h>
#include <iostream>
#include <vector>
#include "DeadReckoning.h"
#include <tf/transform_broadcaster.h>
#include <tf_conversions/tf_eigen.h>
#include <ui/robot_feedback.h>
#include <geometry_msgs/PoseStamped.h>

using namespace std;

double ENCODER_DATA[5];

const int G0 = 0;
const int G6 = 1;
bool IS_GRASPING[2] = {true, true};
DeadReckoning::GrasperStatus STATIC_END;
bool toCheck = false;
void EncoderCallback(const ui::robot_feedbackConstPtr& data) {
   if ((!IS_GRASPING[G0] && data->isGrasping[G0] != 0) || (IS_GRASPING[G6] && data->isGrasping[G6] == 0)) {
       STATIC_END = DeadReckoning::JustG0;
   }

   if ((!IS_GRASPING[G6] && data->isGrasping[G6] != 0) || (IS_GRASPING[G0] && data->isGrasping[G0] == 0)) {
       STATIC_END = DeadReckoning::JustG6;
   }

   if (data->isGrasping[G0] != 0 && data->isGrasping[G6] != 0) {
       STATIC_END = DeadReckoning::G0AndG6;
   } else if (data->isGrasping[G0] == 0 && data->isGrasping[G6] == 0) {
       STATIC_END = DeadReckoning::None;
   }

   IS_GRASPING[G0] = (bool)data->isGrasping[G0];
   IS_GRASPING[G6] = (bool)data->isGrasping[G6];

   ENCODER_DATA[0] = data->feedbackPosData[0];
   ENCODER_DATA[1] = data->feedbackPosData[1];
   ENCODER_DATA[2] = data->feedbackPosData[2];
   ENCODER_DATA[3] = data->feedbackPosData[3];
   ENCODER_DATA[4] = data->feedbackPosData[4];
   toCheck = true;

   ROS_INFO("GET DATA.\n");
}

int main(int argc, char** argv) {
   //初始化ROS节点
   ros::init(argc, argv, "DeadReckoning");
   ros::NodeHandle n;

   //订阅编码器数据
   ros::NodeHandle node;
   ros::Subscriber sub = node.subscribe("/low_level/joints_point_feedback", 100, EncoderCallback);

   //发布航迹推算的结果
   ros::Publisher pub_marker_0_dr = node.advertise<geometry_msgs::PoseStamped>("marker0_dr", 10);
   ros::Publisher pub_marker_6_dr = node.advertise<geometry_msgs::PoseStamped>("marker6_dr", 10);
   ros::Publisher pub_G0_dr = node.advertise<geometry_msgs::PoseStamped>("G0_dr", 10);
   ros::Publisher pub_G6_dr = node.advertise<geometry_msgs::PoseStamped>("G6_dr", 10);

   /// 初始化：人工记下MC的第一帧姿态，然后计算出G6或G0marker上的姿态矩阵，进一步推算出TCP的初始矩阵 ////
   //T_marker0_G0
   Eigen::Isometry3d T = Eigen::Isometry3d::Identity();                                           // 虽然称为3d，实质上是4＊4的矩阵
   T.rotate ( Eigen::Matrix3d::Identity());
   T.pretranslate ( Eigen::Vector3d ( 0, 0, -195) );                     // 设置平移向量
   Eigen::Matrix4d T_marker0_G0 = T.matrix();

   //T_marker6_G6
   Eigen::Isometry3d T_marker6_G6_tmp = Eigen::Isometry3d::Identity();
   T_marker6_G6_tmp.rotate(Eigen::Matrix3d::Identity());
   T_marker6_G6_tmp.pretranslate(Eigen::Vector3d ( 0,0,195));
   Eigen::Matrix4d T_marker6_G6 = T_marker6_G6_tmp.matrix();

   //// MC的数据（设置marker0的初始位姿）
   Eigen::Quaterniond quaternion( 0.707984924316,  -0.00113865558524,  0.0190440956503,  0.70596987009);//marker0的初始位姿
   Eigen::AngleAxisd rotation_vector(quaternion);
   Eigen::Isometry3d T_mc_marker0 = Eigen::Isometry3d::Identity();
   T_mc_marker0.rotate(rotation_vector);
   T_mc_marker0.pretranslate(Eigen::Vector3d(2627, 890, 624));//marker0的初始位姿
   DeadReckoning deadReckoning(T_mc_marker0.matrix() * T_marker0_G0, DeadReckoning::G0);

   ros::Rate rate(100);
   while (ros::ok()) {
       if (toCheck) {
           toCheck = false;

           //每来一次编码器数据，就给航迹推算类传进去
           DeadReckoning::EncoderDataType encoder_data(begin(ENCODER_DATA), end(ENCODER_DATA));
           deadReckoning.UpdateEncoderData(encoder_data);
           deadReckoning.UpdateGrasperStatus(STATIC_END);

           //计算航迹推算的结果
           geometry_msgs::PoseStamped pose_dr_marker0;
           auto T_mc_marker0 = deadReckoning.GetTransformOfWorldFrame(DeadReckoning::G0) * T_marker0_G0.inverse();
           auto coordinate_G0 = T_mc_marker0.block<3,1>(0,3);
           pose_dr_marker0.pose.position.x = coordinate_G0.x();
           pose_dr_marker0.pose.position.y = coordinate_G0.y();
           pose_dr_marker0.pose.position.z = coordinate_G0.z();
           Eigen:: Quaterniond R_mc_marker0(T_mc_marker0.matrix().block<3,3>(0,0));
           pose_dr_marker0.pose.orientation.x = R_mc_marker0.x();
           pose_dr_marker0.pose.orientation.y = R_mc_marker0.y();
           pose_dr_marker0.pose.orientation.z = R_mc_marker0.z();
           pose_dr_marker0.pose.orientation.w = R_mc_marker0.w();
           pose_dr_marker0.header.frame_id = "world";
           pose_dr_marker0.header.stamp = ros::Time::now();
           pub_marker_0_dr.publish(pose_dr_marker0);

           geometry_msgs::PoseStamped pose_dr_G0;
           auto T_mc_G0 = deadReckoning.GetTransformOfWorldFrame(DeadReckoning::G0);
           auto coordinate_G0_dr = T_mc_G0.block<3,1>(0,3);
           pose_dr_G0.pose.position.x = coordinate_G0_dr.x();
           pose_dr_G0.pose.position.y = coordinate_G0_dr.y();
           pose_dr_G0.pose.position.z = coordinate_G0_dr.z();
           Eigen:: Quaterniond R_mc_G0(T_mc_G0.matrix().block<3,3>(0,0));
           pose_dr_G0.pose.orientation.x = R_mc_G0.x();
           pose_dr_G0.pose.orientation.y = R_mc_G0.y();
           pose_dr_G0.pose.orientation.z = R_mc_G0.z();
           pose_dr_G0.pose.orientation.w = R_mc_G0.w();
           pose_dr_G0.header.frame_id = "world";
           pose_dr_G0.header.stamp = ros::Time::now();
           pub_G0_dr.publish(pose_dr_G0);

           geometry_msgs::PoseStamped pose_dr_marker6;
           auto T_mc_marker6 = deadReckoning.GetTransformOfWorldFrame(DeadReckoning::G6) * T_marker6_G6.inverse();
           auto coordinate_G6 = T_mc_marker6.block<3,1>(0,3);
           pose_dr_marker6.pose.position.x = coordinate_G6.x();
           pose_dr_marker6.pose.position.y = coordinate_G6.y();
           pose_dr_marker6.pose.position.z = coordinate_G6.z();
           Eigen:: Quaterniond R_mc_marker6(T_mc_marker6.matrix().block<3,3>(0,0));
           pose_dr_marker6.pose.orientation.x = R_mc_marker6.x();
           pose_dr_marker6.pose.orientation.y = R_mc_marker6.y();
           pose_dr_marker6.pose.orientation.z = R_mc_marker6.z();
           pose_dr_marker6.pose.orientation.w = R_mc_marker6.w();
           pose_dr_marker6.header.frame_id = "world";
           pose_dr_marker6.header.stamp = ros::Time::now();
           pub_marker_6_dr.publish(pose_dr_marker6);

           geometry_msgs::PoseStamped pose_dr_G6;
           auto T_mc_G6 = deadReckoning.GetTransformOfWorldFrame(DeadReckoning::G6);
           auto coordinate_G6_dr = T_mc_G6.block<3,1>(0,3);
           pose_dr_G6.pose.position.x = coordinate_G6_dr.x();
           pose_dr_G6.pose.position.y = coordinate_G6_dr.y();
           pose_dr_G6.pose.position.z = coordinate_G6_dr.z();
           Eigen:: Quaterniond R_mc_G6(T_mc_G6.matrix().block<3,3>(0,0));
           pose_dr_G6.pose.orientation.x = R_mc_G6.x();
           pose_dr_G6.pose.orientation.y = R_mc_G6.y();
           pose_dr_G6.pose.orientation.z = R_mc_G6.z();
           pose_dr_G6.pose.orientation.w = R_mc_G6.w();
           pose_dr_G6.header.frame_id = "world";
           pose_dr_G6.header.stamp = ros::Time::now();
           pub_G6_dr.publish(pose_dr_G6);
       }
       ros::spinOnce();
       rate.sleep();
   }
}

