//
// Created by ch on 20-4-22.
//


#include "BIRL_UWB.h"

bool BIRL_UWB::setOperationMode(opMode mode) {
    static UWBcommands::RequestSetOpmode request;
    static UWBcommands::ConfirmSetOpmode confirm;
    int numBytes;

    request.msgType = htons(request.msgType);
    request.msgId = htons(messageId++);
    request.Mode = htonl(mode);

    usb_->rcmIfFlush();

    int ret = usb_->rcmIfSendPacket(&request, sizeof(request));
    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.status = ntohl(confirm.status);

        // is this the correct message type and is status good?
        if (confirm.msgType == RCM_SET_OPMODE_CONFIRM &&
            confirm.status == OK)
            return true;
    }
    return false;
}

bool BIRL_UWB::setLocationIdleMode() {
    return setLocationMode(IDLE);
}

bool BIRL_UWB::setLocationTrackingMode(){
    return setLocationMode(TRACKING);
}

bool BIRL_UWB::setLocationMode(locationModeType modeType) {
    static UWBcommands::RequestLocationSetMode request;
    static UWBcommands::ConfirmLocationSetMode confirm;
    int numBytes;

    request.msgType = htons(request.msgType);
    request.msgId = htons(messageId++);
    request.mode = modeType;
    //@todo:0 means that only this node is modified. If you want to broadcast to other nodes, change to 1.
    //@todo: When you change it to 1, you should also think about another confirm package(LOC_OTA_MODE_CHANGE_INFO)
    request.broadcastFlag = 1;


    usb_->rcmIfFlush();

    usb_->rcmIfSendPacket(&request, sizeof(request));
    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.status = ntohl(confirm.status);

        // is this the correct message type and is status good?
        if (confirm.msgType == LOC_SET_MODE_CONFIRM &&
            confirm.status == OK)
            return true;
    }
    return false;
}

bool BIRL_UWB::getTrackingInfoEX(LocationInfoEX &info) {

    UWBcommands::InfoLocationEchoedEx echoed_info;

    //    //clear pending message
    //    /*@todo:I don't know whether it would clear the latest location info and just wait for next info ,
    //      @todo:it might cause some unexceptable results if call this function here
    //    */
//    usb_->rcmIfFlush();

    //get echoed info
    int numBytes = usb_->rcmIfGetPacket(&echoed_info, sizeof(echoed_info));

    //check if what i get is what i want to get
    if (numBytes == sizeof(info))
    {
        // Handle byte ordering
        echoed_info.msgType = ntohs(echoed_info.msgType);
        echoed_info.timeStamp = ntohl(echoed_info.timeStamp);
        echoed_info.x = ntohl(echoed_info.x);
        echoed_info.y = ntohl(echoed_info.y);
        echoed_info.z = ntohl(echoed_info.z);
        echoed_info.x_variance = ntohs(echoed_info.x_variance);
        echoed_info.y_variance = ntohs(echoed_info.y_variance);
        echoed_info.z_variance = ntohs(echoed_info.z_variance);
        echoed_info.x_y_cov = ntohs(echoed_info.x_y_cov);
        echoed_info.x_z_cov = ntohs(echoed_info.x_z_cov);
        echoed_info.y_z_cov = ntohs(echoed_info.y_z_cov);
        echoed_info.nodeID = ntohl(echoed_info.nodeID);

        // is this the correct message type and is status good?
        if (echoed_info.msgType == LOC_ECHOED_LOCATION_EX_INFO &&
            echoed_info.solverErrorCode == OK){
            info.x = echoed_info.x;
            info.y = echoed_info.y;
            info.z = echoed_info.z;
            info.x_variance = echoed_info.x_variance;
            info.y_variance = echoed_info.y_variance;
            info.z_variance = echoed_info.z_variance;
            info.x_y_cov = echoed_info.x_y_cov;
            info.x_z_cov = echoed_info.x_z_cov;
            info.y_z_cov = echoed_info.y_z_cov;
            info.time_stamp = echoed_info.timeStamp;
            info.node_ID = echoed_info.nodeID;
            return true;
        }
    }
    return false;
}

int BIRL_UWB::getRangeWithTarget(unsigned id) {
    static rcmMsg_SendRangeRequest request;
    static rcmMsg_SendRangeRequestConfirm confirm;
    static rcmMsg_FullRangeInfo rangeInfo;
    static rcmMsg_DataInfo dataInfo;
    static rcmMsg_ScanInfo scanInfo;
    static rcmMsg_FullScanInfo fullScanInfo;
    static infoMsgs_t infoMsgs;
    int retVal = ERR, numBytes;
    unsigned i;

    // create request message
    request.msgType = htons(RCM_SEND_RANGE_REQUEST);
    request.msgId = htons(messageId);
    request.responderId = htonl(id);
    request.antennaMode = RCM_ANTENNAMODE_TXA_RXA; //@todo: default setting, you should modify it according to the hardware
    request.dataSize = htons(0);

    // make sure no pending messages
    usb_->rcmIfFlush();

    // send message to RCM
    numBytes = sizeof(request);
    usb_->rcmIfSendPacket(&request, numBytes);

    // wait for response
    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.msgId = ntohs(confirm.msgId);

        // is this the correct message type?
        if (confirm.msgType == RCM_SEND_RANGE_REQUEST_CONFIRM)
        {
            // check status code
            confirm.status = ntohl(confirm.status);
            if (confirm.status == OK)
            {
                retVal = OK;

                // clear out caller's info structs
                rangeInfo.rangeStatus = RCM_RANGE_STATUS_TIMEOUT;

                // Collect any info messages
                // We will always get a rangeInfo, maybe a dataInfo and/or scanInfo also
                while ((numBytes = usb_->rcmIfGetPacket(&infoMsgs, sizeof(infoMsgs))) > 0)
                {
                    // make sure this info message has the same msgId as the request
                    // the msgId is in the same place in all structs
                    if (ntohs(infoMsgs.rangeInfo.msgId) == messageId)
                    {
                        switch(ntohs(infoMsgs.rangeInfo.msgType))
                        {
                            case RCM_FULL_RANGE_INFO:
                                // copy message to caller's struct
                                memcpy(&rangeInfo, &infoMsgs.rangeInfo, sizeof(rangeInfo));
                                // handle byte ordering
                                rangeInfo.msgType = ntohs(rangeInfo.msgType);
                                rangeInfo.msgId = ntohs(rangeInfo.msgId);
                                rangeInfo.responderId = ntohl(rangeInfo.responderId);
                                rangeInfo.stopwatchTime = ntohs(rangeInfo.stopwatchTime);
                                rangeInfo.precisionRangeMm = ntohl(rangeInfo.precisionRangeMm);
                                rangeInfo.coarseRangeMm = ntohl(rangeInfo.coarseRangeMm);
                                rangeInfo.filteredRangeMm = ntohl(rangeInfo.filteredRangeMm);
                                rangeInfo.precisionRangeErrEst = ntohs(rangeInfo.precisionRangeErrEst);
                                rangeInfo.coarseRangeErrEst = ntohs(rangeInfo.coarseRangeErrEst);
                                rangeInfo.filteredRangeErrEst = ntohs(rangeInfo.filteredRangeErrEst);
                                rangeInfo.filteredRangeVel = ntohs(rangeInfo.filteredRangeVel);
                                rangeInfo.filteredRangeVelErrEst = ntohs(rangeInfo.filteredRangeVelErrEst);
                                rangeInfo.reqLEDFlags = ntohs(rangeInfo.reqLEDFlags);
                                rangeInfo.respLEDFlags = ntohs(rangeInfo.respLEDFlags);
                                rangeInfo.noise = ntohs(rangeInfo.noise);
                                rangeInfo.vPeak = ntohs(rangeInfo.vPeak);
                                rangeInfo.coarseTOFInBins = ntohl(rangeInfo.coarseTOFInBins);
                                rangeInfo.timestamp = ntohl(rangeInfo.timestamp);
                                break;
                            case RCM_DATA_INFO:
                                // copy message to caller's struct
                                memcpy(&dataInfo, &infoMsgs.dataInfo, sizeof(dataInfo));
                                // handle byte ordering
                                dataInfo.msgType = ntohs(dataInfo.msgType);
                                dataInfo.msgId = ntohs(dataInfo.msgId);
                                dataInfo.sourceId = ntohl(dataInfo.sourceId);
                                dataInfo.noise = ntohs(dataInfo.noise);
                                dataInfo.vPeak = ntohs(dataInfo.vPeak);
                                dataInfo.timestamp = ntohl(dataInfo.timestamp);
                                dataInfo.dataSize = ntohs(dataInfo.dataSize);
                                break;
                            case RCM_SCAN_INFO:
                                // copy message to caller's struct
                                memcpy(&scanInfo, &infoMsgs.scanInfo, sizeof(scanInfo));
                                // handle byte ordering
                                scanInfo.msgType = ntohs(scanInfo.msgType);
                                scanInfo.msgId = ntohs(scanInfo.msgId);
                                scanInfo.sourceId = ntohl(scanInfo.sourceId);
                                scanInfo.LEDflags = ntohs(scanInfo.LEDflags);
                                scanInfo.noise = ntohs(scanInfo.noise);
                                scanInfo.vPeak = ntohs(scanInfo.vPeak);
                                scanInfo.timestamp = ntohl(scanInfo.timestamp);
                                scanInfo.ledIndex = ntohl(scanInfo.ledIndex);
                                scanInfo.lockspotOffset = ntohl(scanInfo.lockspotOffset);
                                scanInfo.numSamples = ntohl(scanInfo.numSamples);
                                for (i = 0; i < scanInfo.numSamples; i++)
                                    scanInfo.samples[i] = ntohl(scanInfo.samples[i]);
                                break;
                            case RCM_FULL_SCAN_INFO:
                                //
                                // NOTE: this only returns the last RCM_FULL_SCAN_INFO packet
                                //
                                // copy message to caller's struct
                                memcpy(&fullScanInfo, &infoMsgs.fullScanInfo, sizeof(fullScanInfo));
                                // handle byte ordering
                                fullScanInfo.msgType = ntohs(fullScanInfo.msgType);
                                fullScanInfo.msgId = ntohs(fullScanInfo.msgId);
                                fullScanInfo.sourceId = ntohl(fullScanInfo.sourceId);
                                fullScanInfo.timestamp = ntohl(fullScanInfo.timestamp);
                                fullScanInfo.noise = ntohs(fullScanInfo.noise);
                                fullScanInfo.vPeak = ntohs(fullScanInfo.vPeak);
                                fullScanInfo.ledIndex = ntohl(fullScanInfo.ledIndex);
                                fullScanInfo.lockspotOffset = ntohl(fullScanInfo.lockspotOffset);
                                fullScanInfo.scanStartPs = ntohl(fullScanInfo.scanStartPs);
                                fullScanInfo.scanStopPs = ntohl(fullScanInfo.scanStopPs);
                                fullScanInfo.scanStepBins = ntohs(fullScanInfo.scanStepBins);
                                fullScanInfo.numSamplesInMessage = ntohs(fullScanInfo.numSamplesInMessage);
                                fullScanInfo.numSamplesTotal = ntohl(fullScanInfo.numSamplesTotal);
                                fullScanInfo.messageIndex = ntohs(fullScanInfo.messageIndex);
                                fullScanInfo.numMessagesTotal = ntohs(fullScanInfo.numMessagesTotal);
                                for (i = 0; i < fullScanInfo.numSamplesInMessage; i++)
                                    fullScanInfo.scan[i] = ntohl(fullScanInfo.scan[i]);
                                break;
                        }

                        // We get RANGE_INFO last.
                        if(ntohs(infoMsgs.rangeInfo.msgType) == RCM_FULL_RANGE_INFO)
                            break;
                    }
                }
                return rangeInfo.precisionRangeMm;
            }
        }
    }
    messageId++;
    return -1;
}

bool BIRL_UWB::getLocationConfig(LocationConfigInfo& info) {
    static UWBcommands::RequestLocationGetConfig request;
    static UWBcommands::ConfirmLocationGetConfig confirm;
    int numBytes;

    request.msgType = htons(LOC_GET_CONFIG_REQUEST);
    request.msgId =  htons(messageId++);

    // make sure no pending messages
    usb_->rcmIfFlush();
    usb_->rcmIfSendPacket(&request, sizeof(request));
    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    //check if what i get is what i want to get
    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.flag = ntohs(confirm.flag);
        confirm.bootMode = confirm.bootMode;
        confirm.solverMaxREE = ntohs(confirm.solverMaxREE);
        confirm.solverMaxGDOP = ntohs(confirm.solverMaxGDOP);
        confirm.kalmanSigmaAccel = ntohs(confirm.kalmanSigmaAccel);
        confirm.timeStamp = ntohl(confirm.timeStamp);
        confirm.status = ntohl(confirm.status);

        // is this the correct message type and is status good?
        if (confirm.msgType == LOC_GET_CONFIG_CONFIRM &&
            confirm.status == OK){
            info.status = ntohl(confirm.status);
            info.timeStamp = ntohl(confirm.timeStamp);
            info.kalmanSigmaAccel = ntohs(confirm.kalmanSigmaAccel);
            info.solverGDOP = ntohs(confirm.solverMaxGDOP);
            info.solverMaxREE = ntohs(confirm.solverMaxREE);
            info.bootMode = ntohs(confirm.bootMode);
            info.flag = ntohs(confirm.flag);
            return true;
        }

    }
    return false;

}

bool BIRL_UWB::setLocationConfig(echoedInfoType type) {
    static UWBcommands::RequestLocationSetConfig request;
    static UWBcommands::ConfirmLocationSetConfig confirm;

    int numBytes;
    request.msgType = htons(LOC_SET_CONFIG_REQUEST);
    request.msgId = htons(messageId++);
    //0001101000101001 :2d
    //0011101000100001 :3d
    if(type == ELL) request.flag = htons(         0b0011101000011010);               //0 0 11 10 1 0 0 0 0 1 10 10
    else if(type == ELR) request.flag = htons(    0b0011101000101010);          //0 0 11 10 1 0 0 0 1 0 10 10
    else if(type == ELL_ELR) request.flag = htons(0b0011101000111010);      //0 0 11 10 1 0 0 0 1 1 10 10
    request.bootMode = 0;  

    // make sure no pending messages
    usb_->rcmIfFlush();
    usb_->rcmIfSendPacket(&request, sizeof(request));
    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.status = ntohl(confirm.status);

        // is this the correct message type and is status good?
        if (confirm.msgType == LOC_SET_CONFIG_CONFIRM &&
            confirm.status == OK){
            return true;
        }
    }
    return false;
}

bool BIRL_UWB::getLocationMap( UWBcommands::ConfirmGetLocationMap<5>& confirm){
    UWBcommands::RequestGetLocationMap request;

    //准备请求包
    request.msgType = htons(request.msgType);
    request.messageId = htons(messageId++);

    //发送请求包
    usb_->rcmIfFlush();// make sure no pending messages
    usb_->rcmIfSendPacket(&request, sizeof(request));

    //读取答应包
    int numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    //check if what I get is what I want to get
    if (numBytes == sizeof(confirm)) {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.messageId = ntohs(confirm.messageId);
        confirm.status = ntohl(confirm.status);
        //如果答应包正常，则提取答应包内容
        if (confirm.msgType == LOC_GET_LOCATION_MAP_CONFIRM &&
            confirm.status == OK) {
            //读取基站与标签的MAP配置
            auto num = confirm.numberLocations;
            while (num--) {
                confirm.entries[num].nodeID = ntohl(confirm.entries[num].nodeID);
                confirm.entries[num].beaconInterval = ntohs(1000);
                confirm.entries[num].z = ntohl(confirm.entries[num].z);
                confirm.entries[num].y = ntohl(confirm.entries[num].y);
                confirm.entries[num].x = ntohl(confirm.entries[num].x);
            }
            return true;
        }
    }
    return false;
}

bool BIRL_UWB::setLocationMap(const std::vector<int> &x, std::vector<int> &y, std::vector<int> &z) {
    UWBcommands::RequestSetLocationMap<5> request;
    UWBcommands::ConfirmSetLocationMap confirm;

    int numBytes;
    int node_base = 100;  //ID of the first node
    auto num_of_entries = x.size();

    //设置请求包（包括调整字节顺序）
    request.msgType = htons(request.msgType);
    request.messageId = htons(messageId);
    request.broadcastFlag = 1;
    request.numberOfEntries = num_of_entries;
    request.persistFlag = 2;

    while(num_of_entries){
        auto i = x.size() - num_of_entries;//x数据的顺序：100->101->...->104
        switch(node_base){
            case 100:{
                request.entries[i].nodeType = 2;
                break;
            }
            case 101:{
                request.entries[i].nodeType = 3;
                break;
            }
            case 102:{
                request.entries[i].nodeType = 5;
                break;
            }
            case 103:{
                request.entries[i].nodeType = 7;
                break;
            }
            case 104:{
                request.entries[i].nodeType = 0;
                break;
            }
            default:break;
        }
        request.entries[i].nodeID = htonl(node_base++);
        //@todo:flags
        // 1 : ELL – the Mobile will s end the last position computed on its next range request;
        // 2 : ELLEX – the Mobile will send the last position
        //     along with the variance and covariance
        //     information in its next range request. Essentially
        //     includes the same information as the Location Info message
        if(request.entries[i].nodeID==htonl(104))request.entries[i].flags = 5;
        else request.entries[i].flags = 4;

        //@todo:beaconInterval
        //0: Automatic Congestion Control (ACC)
        request.entries[i].beaconInterval = htons(1000);

        request.entries[i].x = htonl(x[i]);
        request.entries[i].y = htonl(y[i]);
        request.entries[i].z = htonl(z[i]);
        num_of_entries--;
    }
    usb_->rcmIfSendPacket(&request, sizeof(request));//发送请求

    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));//读取答应包

    //check if what i get is what i want to get
    if (numBytes == sizeof(confirm)) {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);
        confirm.messageID = ntohs(confirm.messageID);
        confirm.status = ntohl(confirm.status);
        if(confirm.status == 0 && confirm.msgType == LOC_SET_LOCATION_MAP_CONFIRM)
            return true;
    }
    return false;
}

int BIRL_UWB::getLocationMode(void) {
    static UWBcommands::RequestLocationGetMode request;
    static UWBcommands::ConfirmLocationGetMode confirm;

    int numBytes;

    request.msgType = htons(LOC_GET_MODE_REQUEST);
    request.msgId =  htons(messageId++);

    // make sure no pending messages
    usb_->rcmIfFlush();
    usb_->rcmIfSendPacket(&request, sizeof(request));
    numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));
    //check if what i get is what i want to get

    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);

        // is this the correct message type and is status good?
        if (confirm.msgType == LOC_GET_MODE_CONFIRM){
            return confirm.mode;
        }

    }
    return -1;
}

bool BIRL_UWB::getELR(EchoedRangingInfo& info){

    static UWBcommands::InfoELR echoed_info;

    int numBytes;

//    usb_->rcmIfFlush();

    if ((numBytes = usb_->rcmIfGetPacket(&echoed_info, sizeof(echoed_info))) > 0) {
        // Handle byte ordering
        echoed_info.msgType = ntohs(echoed_info.msgType);
        echoed_info.msgId = ntohs(echoed_info.msgId);
        echoed_info.requesterID = ntohl(echoed_info.requesterID);
        echoed_info.responderID = ntohl(echoed_info.responderID);
        echoed_info.PRM = ntohl(echoed_info.PRM);
        echoed_info.PRMErrorEstimate = ntohs(echoed_info.PRMErrorEstimate);
        echoed_info.LEDFlag = ntohs(echoed_info.LEDFlag);
        echoed_info.timeStamp = ntohl(echoed_info.timeStamp);
        if (echoed_info.msgType != RCM_ECHOED_RANGE_INFO)
            return false;
        else {
            if(info.id_beacon == 101)
                std::cout << "fucking 101\n";
            info.id_beacon = echoed_info.responderID;
            info.id_tag = echoed_info.requesterID;
            info.range = echoed_info.PRM;
            info.led_flag = echoed_info.LEDFlag;
            info.is_renewed = true;
            return true;
        }
    }
    return false;
}

bool BIRL_UWB::getELRs(EchoedRangingInfos &infos) {
    EchoedRangingInfo info;
    infos.infos.resize(num_of_p440s_ - 1);//重新调整大小
    for(auto& e : infos.infos){//刷新一下数据更新位
        e.is_renewed = false;
    }
    int k = -1, error = -1;
    auto end = std::chrono::system_clock::now();//计时
    auto start = std::chrono::system_clock::now();
    bool out_of_time = false;
    while(true) {

        //从UWB中读取数据
        if (getELR(info)) {
            infos.infos[info.id_beacon-100] = info;//@todo:这里考虑给Infos加移动拷贝赋值运算符，直接将info移过来
        } else {
            continue;
        }

        //计时
        end = std::chrono::system_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        out_of_time = duration.count() > 100000;//100ms
        std::cout << "duration:" << duration.count() << "\n";
        std::cout << "Spent" << double(duration.count()) * std::chrono::microseconds::period::num / std::chrono::microseconds::period::den << " seconds." << std::endl;

        //检查标签与几个基站之间的测距值是否都读到了
        bool got_all_ranges = true;
        for (int range_id = 0; range_id < num_of_p440s_ - 1; range_id++){
            got_all_ranges = got_all_ranges && infos.infos[range_id].is_renewed;
        }

        //如果超时或读取了全部测距值就退出循环
        if (got_all_ranges || out_of_time)
            return got_all_ranges;
    }
}

bool BIRL_UWB::getTrackingInfo(LocationInfo &info) {

    static UWBcommands::InfoLocationEchoed echoed_info;

    int numBytes;

    auto end = std::chrono::system_clock::now();
    auto start = std::chrono::system_clock::now();
    usb_->rcmIfFlush();
    if ((numBytes = usb_->rcmIfGetPacket(&echoed_info, sizeof(echoed_info))) > 0) {
        // Handle byte ordering
        echoed_info.msgType = ntohs(echoed_info.msgType);
        echoed_info.remoteTimestamp = ntohl(echoed_info.remoteTimestamp);
        echoed_info.x = ntohl(echoed_info.x);
        echoed_info.y = ntohl(echoed_info.y);
        echoed_info.z = ntohl(echoed_info.z);
        echoed_info.nodeID = ntohl(echoed_info.nodeID);
        if (echoed_info.msgType != LOC_ECHOED_LOCATION_INFO);//只判断收到的是不是ELL
        else {
            info.x = echoed_info.x;
            info.y = echoed_info.y;
            info.z = echoed_info.z;
            info.node_ID = echoed_info.nodeID;
            info.time_stamp = echoed_info.remoteTimestamp;
            info.solverErrorCode = echoed_info.solverErrorCode;
            return true;
        }
    }
    return false;
}

bool BIRL_UWB::getRCMConfig(UWBcommands::ConfirmGetConfig& config){
    UWBcommands::RequestGetConfig request;
    request.msgType = htons(request.msgType);

    //发送读取请求
    // make sure no pending messages
    usb_->rcmIfFlush();
    usb_->rcmIfSendPacket(&request, sizeof(request));
    int numBytes = usb_->rcmIfGetPacket(&config, sizeof(config));

    //如果读取的字符数正确
    if (numBytes == sizeof(config))
    {
        // Handle byte ordering
        config.msgType = ntohs(config.msgType);

        // is this the correct message type and is status good?
        if (config.msgType == RCM_GET_CONFIG_CONFIRM){
            config.msgType = ntohs(config.msgType);
            config.nodeId = ntohl(config.nodeId);
            config.PII = ntohs(config.PII);
            config.antenna_delay_A = ntohl(config.antenna_delay_A);
            config.antenna_delay_B = ntohl(config.antenna_delay_B);
            config.flags = ntohs(config.flags);
            config.timestamp = ntohl(config.timestamp);
            config.status = ntohl(config.status);
            return true;
        }
        return false;
    }
}

bool BIRL_UWB::getOperationMode(UWBcommands::ConfirmGetOpmode& confirm){
    UWBcommands::RequestGetOpmode request;
    request.msgType = htons(request.msgType);

    //发送读取请求
    usb_->rcmIfFlush();
    usb_->rcmIfSendPacket(&request, sizeof(request));
    int numBytes = usb_->rcmIfGetPacket(&confirm, sizeof(confirm));

    //如果读取的字符数正确
    if (numBytes == sizeof(confirm))
    {
        // Handle byte ordering
        confirm.msgType = ntohs(confirm.msgType);

        // is this the correct message type and is status good?
        if (confirm.msgType == RCM_GET_OPMODE_CONFIRM){
            confirm.Mode = ntohl(confirm.Mode);
            return true;
        }
        return false;
    }
}

bool BIRL_UWB::getPositionOfADuration(std::vector<int> &position) {
    //1.设定计时器300ms，进入循环
    const int MAX_TIME_COST = 5000;//ms
    const int MAX_COUNT = 10;//ms

    bool is_position_updated = false;
    int position_nums = 0;

    auto end = std::chrono::system_clock::now();//计时
    auto start = std::chrono::system_clock::now();
#ifdef FOR_DEBUG
    std::cout << "getPositionOfADuration : Begin to get data.\n";
#endif
    do {
        //2.读取消息包，根据Message type来判断是位置消息包还是测距消息包
        union UWBcommands::LocInfoEx_ELR_Union data;
        usb_->rcmIfFlush();
        int numBytes = usb_->rcmIfGetPacket(&data, sizeof(data));
#ifdef FOR_DEBUG
        std::cout << "sizeof LocInfoEx_ELR_Union is: " << sizeof(data) << std::endl;
#endif
        if (numBytes > 2) {
            uint16_t message_type = ntohs(*(uint16_t *) (&data));
            //4 如果是位置消息包:
            //// 4.1 根据位置消息包给出的位置，与位置vector做算术平均；修改更新标志位
            if (message_type ==
                LOC_ECHOED_LOCATION_EX_INFO) {// 是不是用LOC_ECHOED_LOCATION_EX_INFO会特别慢:不是，本来每个基站一秒也就10条左右测距信息
                is_position_updated = true;
                position_nums++;
                position[0] += ntohl(data.loc_info.x);
                position[1] += ntohl(data.loc_info.y);
                position[2] += ntohl(data.loc_info.z);
            }
        }
        //6 如果超时或count超出最大值则退出循环
        end = std::chrono::system_clock::now();//计时
        auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
#ifdef FOR_DEBUG
#include <iostream>
        std::cout << "current time cost is: " << duration << "\n";
#endif
    } while (std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() < MAX_TIME_COST &&
            position_nums < MAX_COUNT);
#ifdef FOR_DEBUG
    std::cout << "getPositionOfADuration : Finish.\n";
#endif
    if (is_position_updated) {
        for (auto &p : position) p /= position_nums;
        return true;
    } else return false;
}

//技术点：协议解析
//问题：要问底层串口读取消息包，读包函数的参数是一个块内存的地址以及最大读取字节数；但消息包的大小是尚未确定的（因为不知道p440会返回什么消息包回来），那么要向读包函数传什么东西比较合适？
//方案：传这几个包的union
bool BIRL_UWB::getRangeOfADuration(std::unordered_map<int, std::vector<int>> &range_data) {
    //1.设定计时器300ms，进入循环
    const int MAX_TIME_COST = 5000;//ms
    const int RANGE_DATA_CAPACITY = 100;

    auto end = std::chrono::system_clock::now();//计时
    auto start = std::chrono::system_clock::now();
#ifdef FOR_DEBUG
    std::cout << "getRangeOfADuration: Begin to get data.\n";
#endif
    do {
        //2.读取消息包，根据Message type来判断是位置消息包还是测距消息包
        union UWBcommands::LocInfoEx_ELR_Union data;
        usb_->rcmIfFlush();
        int numBytes = usb_->rcmIfGetPacket(&data, sizeof(data));
#ifdef FOR_DEBUG
        std::cout << "sizeof LocInfoEx_ELR_Union is: " << sizeof(data) << std::endl;
#endif
        if (numBytes > 2) {
            uint16_t message_type = ntohs(*(uint16_t*)(&data));
            //3 如果是测距消息包：
            if (message_type == RCM_ECHOED_RANGE_INFO) {
                //// 3.1 根据测距消息包给出的基站id，将测距信息放到对应的vector里去
                //// 3.2 如果某个vector满了100组测距，则跳过
                if (range_data[ntohl(data.echoed_ELR.responderId)].size() < RANGE_DATA_CAPACITY) {
                    auto id = ntohl(data.echoed_ELR.responderId);
                    range_data[id].push_back(htonl(data.echoed_ELR.precisionRangeMm));
                }
            }
        }
        //5 如果各组数据满100且更新标志位为true则返回true
        if (range_data[100].size() >= RANGE_DATA_CAPACITY &&
            range_data[101].size() >= RANGE_DATA_CAPACITY &&
            range_data[102].size() >= RANGE_DATA_CAPACITY &&
            range_data[103].size() >= RANGE_DATA_CAPACITY ) return true;
        //6 如果超时则退出循环
        end = std::chrono::system_clock::now();//计时
        auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
#ifdef FOR_DEBUG
        #include <iostream>
        std::cout << "current time cost is: " << duration << "\n";
#endif
    } while (std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() < MAX_TIME_COST);
#ifdef FOR_DEBUG
    std::cout << "getRangeOfADuration: Finish.\n";
#endif
    return !range_data[100].empty() &&
           !range_data[101].empty() &&
           !range_data[102].empty() &&
           !range_data[103].empty();
}
