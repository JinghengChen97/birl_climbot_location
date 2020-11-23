//
// Created by ch on 20-4-30.
//
#define DEBUG
#define NLS
//#define RANGING_LOCATION

#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <geometry_msgs/Point.h>
#include <iostream>
#include <utility>
#include <vector>
#include <chrono>
#include "BIRL_UWB.h"
#include "uwb_msg/UWB.h"
//#include "rosinrange_msg/RangePose.h"

#include <Eigen/Core>

#ifdef NLS
#include <ceres/ceres.h>
struct FITTING_COST{
    FITTING_COST( double range, std::vector<double> xyz ) : _range(range), _xyz(std::move(xyz)){}
    template<typename T>
    bool operator()(const T* const location,
                    T* residual) const{
        residual[0] = ceres::pow(_range, 2) -( ceres::pow(location[0] - _xyz[0], 2) +
                ceres::pow(location[1] - _xyz[1], 2) +
                ceres::pow(location[2] - _xyz[2], 2)
                );
        return true;
    }
    const double _range;
    std::vector<double> _xyz;
};
#endif

#ifdef RANGING_LOCATION
#include <geometry_msgs/PointStamped.h>
Eigen::Vector3d locate(const std::vector<double>& x,
        const std::vector<double>& y,
        const std::vector<double>& z,
        const std::vector<double>& range){

    Eigen::Matrix3d A;
    Eigen::Vector3d b, ret;
    A <<    2 * (x[0] - x[3]), 2 * (y[0] - y[3]), 2 * (z[0] - z[3]),
            2 * (x[1] - x[3]), 2 * (y[1] - y[3]), 2 * (z[1] - z[3]),
            2 * (x[2] - x[3]), 2 * (y[2] - y[3]), 2 * (z[2] - z[3]);
    b <<    x[0] * x[0] - x[3] * x[3] + y[0] * y[0] - y[3] * y[3] + z[0] * z[0] - z[3] * z[3] + range[3] * range[3] - range[0] * range[0],
            x[1] * x[1] - x[3] * x[3] + y[1] * y[1] - y[3] * y[3] + z[1] * z[1] - z[3] * z[3] + range[3] * range[3] - range[1] * range[1],
            x[2] * x[2] - x[3] * x[3] + y[2] * y[2] - y[3] * y[3] + z[2] * z[2] - z[3] * z[3] + range[3] * range[3] - range[2] * range[2];
    ret = A.inverse() * b;

    static double estimated_xyz[3] = {0, 0, 0};
    std::vector<std::vector<double>> xyz;
    //estimated_xyz[0] = ret[0];
    //estimated_xyz[1] = ret[1];
    estimated_xyz[2] = ret[2];  //z轴坐标初始值为三边定位算出的值
    for(int i = 0; i < range.size(); i++){
        std::vector<double> tmp_xyz;
        tmp_xyz.push_back(x[i]);
        tmp_xyz.push_back(y[i]);
        tmp_xyz.push_back(z[i]);
        xyz.push_back(tmp_xyz);
    }

    ceres::Problem problem;
    for( int i = 0; i < range.size(); i++){
        problem.AddResidualBlock(
                new ceres::AutoDiffCostFunction<FITTING_COST, 1, 3>(
                        new FITTING_COST( range[i], xyz[i] )
                        ),
                nullptr,
                estimated_xyz
        );
    }
    ceres::Solver::Options options;
    options.linear_solver_type = ceres::DENSE_QR;
//    options.max_solver_time_in_seconds = 0.3;
    ceres::Solver::Summary summary;
    ceres::Solve(options, &problem, &summary);

    if(summary.termination_type == ceres::USER_SUCCESS ||
       summary.termination_type == ceres::CONVERGENCE){
        ret << estimated_xyz[0], estimated_xyz[1], estimated_xyz[2];
    }else{
        ret << 0, 0, 0;
    }
    return ret;
}
#endif

std::vector<int> ids;
std::vector<double> beacon_x, beacon_y, beacon_z;
BIRL_UWB* uwb;
int main( int argc, char** argv ){
    ros::init(argc, argv, "BIRL_UWB");
    ros::NodeHandle nh;
    std::string ranging_topic_name;
    nh.getParam("BIRL_UWB/topic_name", ranging_topic_name);
    ros::Publisher range_publisher = nh.advertise<uwb_msg::UWB>(ranging_topic_name, 10);
//    ros::Publisher range_publisher = nh.advertise<rosinrange_msg::RangePose>(ranging_topic_name, 10);
#ifdef RANGING_LOCATION
    ros::Publisher location_publisher = nh.advertise<geometry_msgs::PointStamped>("UWB_location", 10);
#endif

#ifdef DEBUG
    char dev[] = "/dev/ttyACM0";
    uwb = new BIRL_UWB(dev);
    if (!uwb->IsAvailable()){
        ROS_ERROR_STREAM_ONCE("Fail to open p440. Please check if these exists '/dev/ttyACM0' and have 'sudo chmod 666 /dev/ttyACM0' done.\n");
        return -1;
    }else{
        ROS_INFO_STREAM_ONCE("Sucess to open p440.\n");
    }
#else
#endif
    /* 读取参数 */
    int num = -1;
    nh.getParam("BIRL_UWB/num_of_p440", num);
    if(num == -1){
        ROS_ERROR_STREAM_ONCE("No parameter!! Please check if the config file is OK!!\n");
    }
    for(int i = 0; i < num; i++ ){
        std::string s = "BIRL_UWB/UWB_10"+ std::to_string(i) + "/ID";
        int id;
        nh.getParam(s, id);
        ids.push_back(id);
    }

    for(int i = 0; i < num; i++ ){
        std::string s = "BIRL_UWB/UWB_10"+ std::to_string(i) + "/X";
        double x;
        nh.getParam(s,x);
        beacon_x.push_back(x);
    }

    for(int i = 0; i < num; i++ ){
        std::string s = "BIRL_UWB/UWB_10"+ std::to_string(i) + "/Y";
        double y;
        nh.getParam(s, y);
        beacon_y.push_back(y);
    }

    for(int i = 0; i < num; i++ ){
        std::string s = "BIRL_UWB/UWB_10"+ std::to_string(i) + "/Z";
        double z;
        nh.getParam(s, z);
        beacon_z.push_back(z);
    }

    ///初始化模块
    uwb->setOperationMode(BIRL_UWB::LOCATION);
    uwb->setNumOfP440s(5);
    uwb->setLocationMode(BIRL_UWB::TRACKING);
    uwb->setLocationConfig(BIRL_UWB::ELR);

    ///等待五秒
    ROS_INFO_STREAM("Waiting for initializing...\n");
    auto t1=std::chrono::steady_clock::now();
    while(true){
        auto t2=std::chrono::steady_clock::now();
        if(std::chrono::duration_cast<std::chrono::seconds>(t2 - t1).count() > 5)break;
    }

    ///开始读取测距信息
    ROS_INFO_STREAM("Trying to get ranges...\n");

    #ifdef RANGING_LOCATION
    ros::Rate rate(100);

    rosinrange_msg::RangePose uwb_range;
    geometry_msgs::PointStamped location_point;
    Eigen::Vector3d location;
    std::vector<double> ranges;
    int loop_count = 0, success_count = 0;

    ranges.resize(4, 0);
    while(ros::ok()){
        location_point.point.x = 0;
        location_point.point.y = 0;
        location_point.point.z = 0;
        while(loop_count++ < 5){
            EchoedRangingInfos infos;
            if(uwb->getELRs(infos)) {
                success_count++;
                for (int i = 0; i < infos.infos.size(); i++) {
                    ranges[i] = infos.infos[i].range / 1000.0;
                }
                location = locate(beacon_x, beacon_y, beacon_z, ranges);

                location_point.point.x += location[0];
                location_point.point.y += location[1];
                location_point.point.z += location[2];
            }
        }
        location_point.point.x /= success_count;
        location_point.point.y /= success_count;
        location_point.point.z /= success_count;
        success_count = 0;
        loop_count = 0;

        location_point.header.frame_id = "UWB";
        location_point.header.stamp = ros::Time::now();
        location_publisher.publish(location_point);
        rate.sleep();
    }
    #else
    ros::Rate rate(100);
    while(ros::ok()){
        EchoedRangingInfos infos;
//        rosinrange_msg::RangePose uwb_range;
        uwb_msg::UWB uwb_range;
        if(uwb->getELRs(infos)){
            for(int i = 0; i < infos.infos.size(); i++){
                uwb_range.coordinates[0] = beacon_x[i];
                uwb_range.coordinates[1] = beacon_y[i];
                uwb_range.coordinates[2] = beacon_z[i];
                uwb_range.range = infos.infos[i].range;
                uwb_range.LED_flag = infos.infos[i].led_flag;
                uwb_range.ID = ids[i];              //基站的ID
                uwb_range.header.stamp = ros::Time::now();

                range_publisher.publish(uwb_range);
            }
        }else{
            ROS_ERROR_STREAM("No data!!\n");
        }
        rate.sleep();
    }
    #endif
}