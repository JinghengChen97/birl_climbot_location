//
// Created by ch on 2020/11/18.
//
#include "BIRL_UWB.h"
#include <unordered_map>
#include <vector>
using namespace std;

int main() {
    char dev[] = "/dev/ttyACM0";
    BIRL_UWB p440(dev);
    //initialize
    p440.setNumOfP440s(5);

    //测试getRangeOfADuration
    p440.setLocationConfig(BIRL_UWB::ELR);
    p440.setLocationMode(BIRL_UWB::TRACKING);
    unordered_map<int, vector<int>> range_data;//500 sets of range data, <anchor id, range data>
    for (int i = 100; i <= 103; i++) {
        range_data[i] = vector<int>();
    }
    vector<int> position(3, 0);
    auto result_range = p440.getRangeOfADuration(range_data);//if out of time return false

    //测试getPositionOfADuration
    p440.setLocationConfig(BIRL_UWB::ELL);
    p440.setLocationMode(BIRL_UWB::TRACKING);
    auto result_position = p440.getPositionOfADuration(position);


		//输出结果
    std::cout << "\n\n\n";
    for (int i = 100; i <= 103; i++) {
        std::cout << "size of range data " << i << " " << range_data[i].size() << "\n" ;
        for (auto& r : range_data[i]) {
            std::cout << "range data of " << i << ": " << r << "\n";
        }
    }
    std::cout << "position" << ": " << position[0] << ", " << position[1] << ", " << position[2] << "\n\n\n";
    std:: cout << "Range result: " << (bool)result_range << "\n";
    std:: cout << "Position result: " << (bool)result_position << "\n";
}
