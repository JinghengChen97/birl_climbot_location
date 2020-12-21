#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <std_msgs/Int16.h>
#include <tf/transform_broadcaster.h>

/* 参考ROS wiki
 * http://wiki.ros.org/tf/Tutorials/Writing%20a%20tf%20broadcaster%20%28C%2B%2B%29
 * */
void ImuCallback(const sensor_msgs::ImuConstPtr& imu_data) {
    static tf::TransformBroadcaster br;//广播器
    tf::Transform transform;
    transform.setOrigin(tf::Vector3(0, 0, 0));//设置平移部分

    //从IMU消息包中获取四元数数据
    tf::Quaternion q;
    q.setX(imu_data->orientation.x);
    q.setY(imu_data->orientation.y);
    q.setZ(imu_data->orientation.z);
    q.setW(imu_data->orientation.w);
    q.normalized();//归一化

    transform.setRotation(q);//设置旋转部分
    //广播出去
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "imu"));
}
int main (int argc, char ** argv) {
    ros::init(argc, argv, "imu_data_to_tf");
    ros::NodeHandle n;

    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("/imu", 10, &ImuCallback);

    ros::spin();
    return 0;
}