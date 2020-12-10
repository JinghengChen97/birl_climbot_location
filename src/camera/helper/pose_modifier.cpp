/* @ file decription: 当UR3 TCP的位姿与G0位姿不一致时，可以用这个程序对手眼标定的结果进行修正
   @ input: RPY_G0_TOOL : G0 TCP坐标系下描述的UR3 TCP坐标系的旋转部分(RPY表示，Z-Y-X固定角)
	    TRANSITION_TOOL_CAMERA : T_tool_camera的平移，输入顺序与Eigen::Vector默认顺序相反，是（Z-Y-X）->(0, 1, 2);这个是在UR3上做手眼标定得到的结果
	    RPY_TOOL_CAMERA : T_tool_camera的旋转部分，（Z-Y-X）RPY表示；这个是在UR3上做手眼标定得到的结果
   @ output: T_G0_camera
   @ 过程：T_GO_camera = T_G0_tool * T_tool_camera
   @ author : 19硕陈劲恒
 * */

#include <Eigen/Geometry>
#include <Eigen/Core>
using namespace Eigen;

#include <iostream>
using namespace std;

/** 输入在这里 **/
inline double DEGREE2RAD(double degree) {return degree * 3.141592653 / 180;}//辅助函数，°转rad


const float RPY_G0_TOOL[3] = {-3.141592653 / 2, 0, -3.141592653};//Z-Y-X,rad，G0 TCP坐标系下描述的UR3 TCP坐标系的旋转部分(RPY表示，Z-Y-X)
const Eigen::Vector3d TRANSITION_TOOL_CAMERA(-245.69, -166.566, 27.19 );//T_tool_camera的平移，输入顺序与Eigen::Vector默认顺序相反，是（Z-Y-X）->(0, 1, 2)
const Eigen::Vector3d RPY_TOOL_CAMERA(DEGREE2RAD(1.03097), DEGREE2RAD(359.689), DEGREE2RAD(2.50572));//T_tool_camera的旋转部分，（Z-Y-X）RPY表示

/** 不要修改这个！！这个是索引变量，只是为了提高代码可读性而声明的 **/
const int X = 2;
const int Y = 1;
const int Z = 0;

int main() {
    /** R_G0_TOOL **/
    Matrix3d R_G0_TOOL;
    R_G0_TOOL = ( Eigen :: AngleAxisd ( RPY_G0_TOOL[Z], Eigen :: Vector3d ::UnitZ())
                  * Eigen :: AngleAxisd (RPY_G0_TOOL[Y] , Eigen :: Vector3d ::UnitY())
                  * Eigen :: AngleAxisd (RPY_G0_TOOL[X] , Eigen :: Vector3d ::UnitX())) ;


    /** T_tool_camera **/
    Matrix3d rotation_matrix;
    rotation_matrix = ( Eigen :: AngleAxisd (RPY_TOOL_CAMERA [ Z ] ,Eigen :: Vector3d ::UnitZ())
                      * Eigen :: AngleAxisd (RPY_TOOL_CAMERA [ Y ] , Eigen :: Vector3d ::UnitY())
                      * Eigen :: AngleAxisd (RPY_TOOL_CAMERA [ X ] , Eigen :: Vector3d ::UnitX())) ;
    Isometry3d T_tool_camera = Eigen::Isometry3d::Identity();
    T_tool_camera.rotate(rotation_matrix);
    T_tool_camera.pretranslate(TRANSITION_TOOL_CAMERA);

    /** T_G0_tool **/
    Isometry3d T_G0_tool = Eigen::Isometry3d::Identity();
    T_G0_tool.rotate(R_G0_TOOL);
    T_G0_tool.pretranslate(Eigen::Vector3d(0, 0, 0));

    Matrix4d T_G0_camera =  T_G0_tool.matrix() * T_tool_camera.matrix();

    /* OUTPUT */
    cout << T_G0_camera << endl;
    std ::cout << "euler_angles(Z-Y-X) from T_G0_camera: \n " << T_G0_camera.block<3, 3>(0, 0).eulerAngles( 2 , 1 , 0 ).transpose() << std ::endl ;
}
