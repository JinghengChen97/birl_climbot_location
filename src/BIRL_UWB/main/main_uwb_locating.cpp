//
// Created by ch on 2020/9/17.
//
#include "BIRL_UWB.h"
#include <vector>
#include <map>
#include <string>
#include <iostream>
#include <cstdarg>
#include <Eigen/Core>
#include <limits.h>
#include <float.h>

#define DEBUG

using namespace std;
using namespace Eigen;

struct Coordinates{
public:
    typedef double DataType;
    DataType data[3];
public:
    Coordinates(){ data[0] = 0; data[1] = 0; data[2] = 0; }
    void getData(DataType x, DataType y, DataType z){
        this->data[0] = x;
        this->data[1] = y;
        this->data[2] = z;
    }

    friend ostream &operator<<(ostream &output, const Coordinates& rhs){
        output << "x:" <<rhs.data[0] << "," << "y:" <<rhs.data[1] << "," << "z:"<< rhs.data[2] << "\n";
        return output;
    }

    Coordinates operator+(const Coordinates& rhs){
        Coordinates ret;
        ret.data[0] = this->data[0] + rhs.data[0];
        ret.data[1] = this->data[1] + rhs.data[1];
        ret.data[2] = this->data[2] + rhs.data[2];
        return ret;
    }

    Coordinates operator/(DataType num){
        Coordinates ret;
        ret.data[0] = this->data[0] / num;
        ret.data[1] = this->data[1] / num;
        ret.data[2] = this->data[2] / num;
        return ret;
    }

    void operator=(const Coordinates& rhs){
        this->data[0] = rhs.data[0];
        this->data[1] = rhs.data[1];
        this->data[2] = rhs.data[2];
    }
};

/* 找出距离测距残差最小的基站
 * possible_base_points:基站可能在的位置散点
 * num:散点数目
 * range:测距与当前基站的测距值
 * robot_pos：当机器人位置
 * */
Coordinates calculateCandidateBase(Coordinates* possible_base_points, int num, Coordinates robot_pos, int range){
    Coordinates ret;
    //找出距离测距残差最小的基站
    bool init = true;
    double min_res = DBL_MAX;
    for(int i = 0; i < num; i++){
        auto res = sqrt(pow(possible_base_points[i].data[0]-robot_pos.data[0],2) +
                        pow(possible_base_points[i].data[1]-robot_pos.data[1],2) +
                        pow(possible_base_points[i].data[2]-robot_pos.data[2],2)) - range;
        if(init){
            init = false;
            min_res = res;
            ret = possible_base_points[i];
        }else{
            if(min_res > res){
                min_res = res;
                ret = possible_base_points[i];
            }
        }
    }
    return ret;
}

int main(){
    ////////1.设备的准备工作
    //打开UWB设备
    BIRL_UWB* uwb;
    char dev[] = "/dev/ttyACM0";
    uwb = new BIRL_UWB(dev);
    if (!uwb->IsAvailable()){
        std::cout << "Fail to open p440.\n";
#ifndef DEBUG
        return -1;
#endif
    } else{
        std::cout << "Success to open p440.\n";
    }

    //初始化UWB
    uwb->setNumOfP440s(5);
    uwb->setOperationMode(BIRL_UWB::LOCATION);
    uwb->setLocationMode(BIRL_UWB::TRACKING);
    uwb->setLocationConfig(BIRL_UWB::ELR);

    ////////2.第一次读UWB测距信息，为准备散点数据做准备
    EchoedRangingInfos ranges;
    Coordinates robot_pos;
    map<int, double> ranges_data;
#ifndef DEBUG
    while(!uwb->getELRs(ranges));//尝试读取UWB数据直至成功
    for(auto& r : ranges.infos){
        ranges_data[r.id_beacon] = r.range;
    }
#else
    for(int i = 0; i < 4; i++){
        ranges_data[i+100] = sqrt(2);
    }
#endif

    ////////3.输入各个基站的高度信息，用以勾股定理
    //@todo:如果基站数目变多的话，这样写会改到扑街；有没有什么好办法可以解决？
    map<int, double> z_base;
    cout << "请输入各个基站的高度信息：";
    for(int i = 100; i < 104; i++){
        cin >> z_base[i+100];
    }
    {//输入机器人初始位置（花括号是为了让x、y、z变量不覆盖下面的xyz）
        int x, y, z;
        cout << "请输入机器人初始位置：";
        cin >> x >> y >> z;//空格作为分隔
        robot_pos.getData(x, y, z);
    }

    ////////4.生成散点数据
    //先分配内存空间
    const int POSSIBLE_POINTS_NUM = 500;
    Coordinates** possible_points = new Coordinates*[4];
    for(int i = 0 ;i < 4; i++){
        possible_points[i] = new Coordinates[POSSIBLE_POINTS_NUM];
    }

    //生成散点
    const double PI = 3.141592653;
    double delta_theta = 2 * PI / POSSIBLE_POINTS_NUM;
    for(int base_index = 0; base_index < 4; base_index++){
        double horizontal_range;
        horizontal_range = sqrt(pow(ranges_data[100+base_index],2) - pow(z_base[100+base_index],2));
        for(int i = 0; i < POSSIBLE_POINTS_NUM; i++){
            possible_points[base_index][i].data[0] = robot_pos.data[0] + horizontal_range * cos( i * delta_theta );
            possible_points[base_index][i].data[1] = robot_pos.data[1] + horizontal_range * sin( i * delta_theta );
            possible_points[base_index][i].data[2] = z_base[100+base_index];
        }
    }

//    //观察散点是否被正确赋值
//    for(int i = 0; i < 4; i++){
//        for(int j = 0; j < POSSIBLE_POINTS_NUM; j++){
//            cout << "point:" << possible_points[i][j].data[0] << " " << possible_points[i][j].data[1] << " " << possible_points[i][j].data[2] << endl;
//        }
//    }

    ////////5.多次读取UWB数据，确定一个最有可能的基站位置
    Coordinates base_candidates[4];
    int n = 1;
    for(int i = 0; i < n; i++){
        string key;
        double x, y, z;
        cout << i+1<<"th, Please input robot pose:";
        cin >> x >> y >> z;//空格作为分隔
        robot_pos.getData(x, y, z);
#ifndef DEBUG
        while(!uwb->getELRs(ranges));//尝试读取UWB数据直至成功

        for(auto& r : ranges.infos){
            ranges_data[r.id_beacon] = r.range;
        }
#else
        cout << i+1<<"th, Please input range:";
        int range = 0;
        cin >> range;
        for(int j = 0; j < 4; j++){
            ranges_data[j+100] = sqrt(range);
        }
#endif
        for(int j = 0; j < 4; j++){
            base_candidates[j] = calculateCandidateBase(possible_points[j], POSSIBLE_POINTS_NUM, robot_pos, ranges_data[j+100]) + base_candidates[j];
        }
    }

    ////////6.输出结果
    for(int i = 0; i < 4; i++){
        base_candidates[i] = base_candidates[i] / n;
        cout << i+100 <<":" <<base_candidates[i];
    }

    return 0;
}

