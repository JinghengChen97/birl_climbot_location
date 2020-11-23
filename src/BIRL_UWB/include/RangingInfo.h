//
// Created by ch on 20-5-8.
//

#ifndef P440_API_RANGINGINFO_H
#define P440_API_RANGINGINFO_H

#include <vector>

struct EchoedRangingInfo{

    int id_beacon = 0;

    int id_tag = 0;

    long range = 0;//mm

    //bit 0:SATURATED
    //bit 3:LOS
    //bit 4:NLOS
    //bit 5:LINE-OF-SIGHT PEAK MISMATCH
    //bit 7:RMS Delay Spread Squared Threshold Exceeded
    //bit 8:NoiseRatio Threshold Exceeded
    int led_flag = 0;

    bool is_renewed = false;//这个range的数据是否被更新，在getELR中使用
};

struct EchoedRangingInfos{
    std::vector<EchoedRangingInfo> infos;
};

#endif //P440_API_RANGINGINFO_H
