cmake_minimum_required(VERSION 3.0.2)
project(camera)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package( OpenCV 4 REQUIRED )
find_package( Eigen3 REQUIRED )
find_package(catkin REQUIRED COMPONENTS
        roscpp
        rospy
        std_msgs
        visualization_msgs
        geometry_msgs
        ui
        tf
)
set(DEPENDENCIES realsense2)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES camera
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}_node test/main.cpp)

add_executable(eye_hand_calibration_halcon test/eye_hand_calibration_halcon.cpp
        src/ClimberKinematics5D.cpp
        src/ClimbotKinematics.cpp
        src/Kine.cpp
        src/Matrix.cpp
        src/Setup.cpp)

add_executable(eye_hand_calibration_opencv test/eye_hand_calibration_opencv.cpp
        src/ClimberKinematics5D.cpp
        src/ClimbotKinematics.cpp
        src/Kine.cpp
        src/Matrix.cpp
        src/Setup.cpp)

add_executable(helper_ICP helper/marker_icp.cpp)
add_executable(pose_modifier helper/pose_modifier.cpp)
add_executable(G0G6marker_from_aruco test/G0G6marker_from_aruco.cpp)

target_link_libraries(${PROJECT_NAME}_node
   ${DEPENDENCIES}
   ${catkin_LIBRARIES}
   ${OpenCV_LIBS}
)

target_link_libraries(eye_hand_calibration_halcon
        ${DEPENDENCIES}
        ${catkin_LIBRARIES}
        ${OpenCV_LIBS}
        ${EIGEN3_LIBS}
)

target_link_libraries(eye_hand_calibration_opencv
        ${DEPENDENCIES}
        ${catkin_LIBRARIES}
        ${OpenCV_LIBS}
        ${EIGEN3_LIBS}
        )

target_link_libraries(pose_modifier
        ${DEPENDENCIES}
        ${catkin_LIBRARIES}
        ${OpenCV_LIBS}
        ${EIGEN3_LIBS}
        )

target_link_libraries(G0G6marker_from_aruco
        ${DEPENDENCIES}
        ${catkin_LIBRARIES}
        ${OpenCV_LIBS}
        ${EIGEN3_LIBS}
        )

# add_dependencies(G0G6marker_from_aruco  ui)

# add_dependencies(eye_hand_calibration_halcon  ui)

# add_dependencies(eye_hand_calibration_opencv  ui)

# add_dependencies(${PROJECT_NAME}_node  ui)

# add_dependencies(pose_modifier  ui)
