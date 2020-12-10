# CMake generated Testfile for 
# Source directory: /home/ch/code/birl_climbot_location/src/vrpn_client
# Build directory: /home/ch/code/birl_climbot_location/build/vrpn_client
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_vrpn_client_ros_roslint_package "/home/ch/code/birl_climbot_location/build/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/ch/code/birl_climbot_location/build/test_results/vrpn_client_ros/roslint-vrpn_client_ros.xml" "--working-dir" "/home/ch/code/birl_climbot_location/build/vrpn_client" "--return-code" "/opt/ros/kinetic/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/ch/code/birl_climbot_location/build/test_results/vrpn_client_ros/roslint-vrpn_client_ros.xml make roslint_vrpn_client_ros")
add_test(_ctest_vrpn_client_ros_roslaunch-check_launch "/home/ch/code/birl_climbot_location/build/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/ch/code/birl_climbot_location/build/test_results/vrpn_client_ros/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/ch/code/birl_climbot_location/build/test_results/vrpn_client_ros" "/opt/ros/kinetic/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/ch/code/birl_climbot_location/build/test_results/vrpn_client_ros/roslaunch-check_launch.xml' '/home/ch/code/birl_climbot_location/src/vrpn_client/launch' ")
