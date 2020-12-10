//
// Created by ch on 2020/10/20.
//
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/PoseStamped.h>
#include <Eigen/Dense>
#include <Eigen/Core>

void DrMarker0ToTF(const geometry_msgs::PoseStampedConstPtr& data) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(
            tf::Quaternion(
                    data->pose.orientation.x,
                    data->pose.orientation.y,
                    data->pose.orientation.z,
                    data->pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data->pose.position.x / 1000,
                    data->pose.position.y / 1000,
                    data->pose.position.z / 1000));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "DR_marker0"));
    ROS_INFO("DR_marker0\n");
}

void DrMarker6ToTF(const geometry_msgs::PoseStampedConstPtr& data) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(
            tf::Quaternion(
                    data->pose.orientation.x,
                    data->pose.orientation.y,
                    data->pose.orientation.z,
                    data->pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data->pose.position.x / 1000,
                    data->pose.position.y / 1000,
                    data->pose.position.z / 1000));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "DR_marker6"));
    ROS_INFO("DR_marker6\n");
}

void DrG0ToTF(const geometry_msgs::PoseStampedConstPtr& data) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(
            tf::Quaternion(
                    data->pose.orientation.x,
                    data->pose.orientation.y,
                    data->pose.orientation.z,
                    data->pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data->pose.position.x / 1000,
                    data->pose.position.y / 1000,
                    data->pose.position.z / 1000));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "DR_G0"));
    ROS_INFO("DR_G0\n");
}

void DrG6ToTF(const geometry_msgs::PoseStampedConstPtr& data) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(
            tf::Quaternion(
                    data->pose.orientation.x,
                    data->pose.orientation.y,
                    data->pose.orientation.z,
                    data->pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data->pose.position.x / 1000,
                    data->pose.position.y / 1000,
                    data->pose.position.z / 1000));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "DR_G6"));
    ROS_INFO("DR_G6\n");
}

void McMarker0ToTF(const geometry_msgs::PoseStampedConstPtr& data) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(
            tf::Quaternion(
                    data->pose.orientation.x,
                    data->pose.orientation.y,
                    data->pose.orientation.z,
                    data->pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data->pose.position.x,
                    data->pose.position.y,
                    data->pose.position.z));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "MC_marker0"));
    ROS_INFO("MC_marker0\n");
}

void McMarker6ToTF(const geometry_msgs::PoseStampedConstPtr& data) {
    static tf::TransformBroadcaster bf;
    tf::Transform transform;
    transform.setRotation(
            tf::Quaternion(
                    data->pose.orientation.x,
                    data->pose.orientation.y,
                    data->pose.orientation.z,
                    data->pose.orientation.w));
    transform.setOrigin(
            tf::Vector3(
                    data->pose.position.x,
                    data->pose.position.y,
                    data->pose.position.z));
    bf.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "MC_marker6"));
    ROS_INFO("MC_marker6\n");
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "Data2TF");
    ros::NodeHandle n;

    ros::NodeHandle node;
    ros::Subscriber sub_dr_marker0 = node.subscribe("/marker0_dr", 100, DrMarker0ToTF);
    ros::Subscriber sub_dr_marker6 = node.subscribe("/marker6_dr", 100, DrMarker6ToTF);
    ros::Subscriber sub_dr_G0 = node.subscribe("/G0_dr", 100, DrG6ToTF);
    ros::Subscriber sub_dr_G6 = node.subscribe("/G6_dr", 100, DrG0ToTF);
    ros::Subscriber sub_MC_marker0 = node.subscribe("/vrpn_client_node/G0/pose", 100, McMarker0ToTF);
    ros::Subscriber sub_MC_marker6 = node.subscribe("/vrpn_client_node/G6/pose", 100, McMarker6ToTF);

    ROS_INFO("Begin to get data...\n");
    while (ros::ok()) ros::spin();
}
