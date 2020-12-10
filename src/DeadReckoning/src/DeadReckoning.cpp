//
// Created by ch on 2020/9/25.
//

#include "DeadReckoning.h"
#include <iostream>

DeadReckoning::DeadReckoning(const DeadReckoning::Transform &T, GrasperName which_end) :
    _T_w_0_current(Eigen::Matrix<double, 4, 4>::Identity()),
    _T_w_6_current(Eigen::Matrix<double, 4, 4>::Identity()),
    _T_w_0_last(Eigen::Matrix<double, 4, 4>::Identity()),
    _T_w_6_last(Eigen::Matrix<double, 4, 4>::Identity()),
    _encoder_data(EncoderDataType()),
    //        _grasper_status(JustG0),
    _kinematics(new ClimberKinematics5D),
    _is_encoder_data_updated(true) {
    //设置夹紧端,并根据夹紧端设置初始姿态
    if (which_end == G0) {
        _T_w_0_current = T;
        _T_w_0_last = T;
    } else if (which_end == G6) {
        _T_w_6_current = T;
        _T_w_6_last = T;
    }
}

void DeadReckoning::UpdateEncoderData(const DeadReckoning::EncoderDataType &encoder_data) {
    _encoder_data = encoder_data;
    _is_encoder_data_updated = true;
}

DeadReckoning::GrasperStatus DeadReckoning::GetGrasperStatus() {
    return _grasper_status;
}

const DeadReckoning::Transform &DeadReckoning::GetTransformOfWorldFrame(DeadReckoning::GrasperName which_end) {
    _UpdateTransform();//判断编码器数据是否有更新，如有则重新计算变换矩阵，如无则直接返回之前的结果
    if (which_end == G0) {
        return _T_w_0_current;
    } else if (which_end == G6) {
        return _T_w_6_current;
    }
}

DeadReckoning::DeadReckoning()  :
        _T_w_0_current(Transform()),
        _T_w_6_current(Transform()),
        _T_w_0_last(Transform()),
        _T_w_6_last(Transform()),
        _encoder_data(EncoderDataType()),
//        _grasper_status(JustG0),
        _kinematics(new ClimberKinematics5D),
    _is_encoder_data_updated(true) {
}

void DeadReckoning::_UpdateTransform() {
    //判断编码器数据是否有更新，如有则重新计算变换矩阵
    if (_is_encoder_data_updated) {
        _is_encoder_data_updated = false;//取消数据更新标志位
        auto T_0_6 = _kinematics->GetTransformMatrix(ClimbotKinematics::G6, _encoder_data);
        if (_grasper_status == JustG0 || _grasper_status == G0AndG6 || _grasper_status == None) { //@todo:两端抓紧与全部松开应怎么处理？
            _T_w_6_current = _T_w_0_last * T_0_6;
            _T_w_0_current = _T_w_0_last;
        } else if (_grasper_status == JustG6) {
            _T_w_0_current = _T_w_6_last * T_0_6.inverse();
            _T_w_6_current = _T_w_6_last;
        }
        _T_w_0_last = _T_w_0_current;
        _T_w_6_last = _T_w_6_current;
    }
}

DeadReckoning::CoordinateDataType DeadReckoning::GetCoordinate(DeadReckoning::GrasperName which_end) {
    _UpdateTransform();//判断编码器数据是否有更新，如有则重新计算变换矩阵，如无则直接返回之前的结果
    if (which_end == G0) {
        return _T_w_0_current.block<3,1>(0,3);
    } else if (which_end == G6) {
        return _T_w_6_current.block<3,1>(0,3);
    }
}

void DeadReckoning::UpdateGrasperStatus(DeadReckoning::GrasperStatus grasper_status) {
    _grasper_status = grasper_status;
}

void DeadReckoning::SetInitTransformMatrix(const DeadReckoning::Transform &T, DeadReckoning::GrasperName which_end_is_grasping) {
    auto T_0_6 = _kinematics->GetTransformMatrix(ClimbotKinematics::G6, _encoder_data);
    if (which_end_is_grasping == DeadReckoning::G0) {
        _T_w_0_current = T;
        _T_w_0_last = T;
        _T_w_6_current = _T_w_0_current * T_0_6.inverse();
        _T_w_6_last = _T_w_6_last * T_0_6.inverse();
    } else {
        _T_w_6_current = T;
        _T_w_6_last = T;
        _T_w_0_current = _T_w_6_current * T_0_6.inverse();
        _T_w_0_last = _T_w_0_last * T_0_6.inverse();
    }
}

