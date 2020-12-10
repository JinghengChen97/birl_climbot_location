//
// Created by ch on 2020/9/27.
//

#ifndef DEAD_RECKONING_CLIMBERKINEMATICS5D_H
#define DEAD_RECKONING_CLIMBERKINEMATICS5D_H

#include <ClimbotKinematics.h>
#include <math.h>
#include <Eigen/Dense>
#include <Eigen/Core>
#include "Kine.h"
class ClimberKinematics5D : public ClimbotKinematics {
public:

    ClimberKinematics5D();

    virtual Transform GetTransformMatrix(JointIndex joint_index, const EncoderDataType& encoder_data) override;

    virtual Transform ForwardKinematics(const EncoderDataType& encoder_data) override;

    virtual EncoderDataType ReverseKinematics(const Transform& T_Grasper1_Grasper2) override;

private:

    Kine_CR_FiveDoF_G1 _fkine;
};


#endif //DEAD_RECKONING_CLIMBERKINEMATICS5D_H
