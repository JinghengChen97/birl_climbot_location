//
// Created by ch on 2020/12/10.
//
/** 这个文件接收从camera主程序发送的robot_pose消息，然后发布一个T_G0(from aruco)_marker **/

#include <ros/ros.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <tf/transform_broadcaster.h>
#include <Eigen/Core>

/** MC marker parameter **/
const double Z_OFFSET = 0.325;//m
Eigen::Matrix4d T_G0_G0marker, T_G6_G6marker;

void PublishG0MarkerData(const geometry_msgs::PoseWithCovarianceStampedConstPtr& data);

ros::Publisher publisher_G0_marker_pose_from_aruco;

int main(int argc, char** argv) {
    ros::init(argc, argv, "G0G6_marker_from_aruco");
    ros::NodeHandle n;
    ros::NodeHandle node;
    ros::Subscriber sub_G0 = node.subscribe("/G0_pose", 100, PublishG0MarkerData);
    publisher_G0_marker_pose_from_aruco = node.advertise<geometry_msgs::PoseWithCovarianceStamped>("/G0_marker_pose_from_aruco", 100);
    ros::spin();
}

void PublishG0MarkerData(const geometry_msgs::PoseWithCovarianceStampedConstPtr& data) {//ROS线程，如果不另开线程的话,main里面会有两个while(一个是realsense的while， 一个是ros的spin)
    static tf::TransformBroadcaster bf;

    tf::Transform transform;
    transform.setRotation(tf::Quaternion(0, 0, 0, 1));
    transform.setOrigin(tf::Vector3(0 ,0 , Z_OFFSET));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "G0", "G0marker_from_aruco"));

//    geometry_msgs::PoseWithCovarianceStamped T_world_G0Marker_from_aruco;
//    T_world_G0Marker_from_aruco.pose.pose.position.z = data->pose.pose.position.z;
//    T_world_G0Marker_from_aruco.pose.pose.position.y = data->pose.pose.position.y;
//    T_world_G0Marker_from_aruco.pose.pose.position.x = data->pose.pose.position.x;
//    T_world_G0Marker_from_aruco.pose.pose.orientation.w = data->pose.pose.orientation.w;
//    T_world_G0Marker_from_aruco.pose.pose.orientation.x = data->pose.pose.orientation.x;
//    T_world_G0Marker_from_aruco.pose.pose.orientation.y = data->pose.pose.orientation.y;
//    T_world_G0Marker_from_aruco.pose.pose.orientation.z = data->pose.pose.orientation.z;
//    T_world_G0Marker_from_aruco.header.stamp = ros::Time::now();
//    T_world_G0Marker_from_aruco.header.frame_id = data->header.frame_id;
//    T_world_G0Marker_from_aruco.header.seq = data->header.seq;
//    T_world_G0Marker_from_aruco.pose.pose.position.z -= (Z_OFFSET / 1000);
//    publisher_G0_marker_pose_from_aruco.publish(T_world_G0Marker_from_aruco);
    ROS_INFO("T_mc_G0marker\n");
}
