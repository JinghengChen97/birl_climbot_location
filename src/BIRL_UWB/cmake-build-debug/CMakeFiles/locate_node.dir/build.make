# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/ch/SOFTWARES/Clion/clion-2020.2.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/ch/SOFTWARES/Clion/clion-2020.2.4/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ch/code/P440/ROS_P440/src/BIRL_UWB

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/locate_node.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/locate_node.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/locate_node.dir/flags.make

CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.o: CMakeFiles/locate_node.dir/flags.make
CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.o: ../src/BIRL_UWB.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.o -c /home/ch/code/P440/ROS_P440/src/BIRL_UWB/src/BIRL_UWB.cpp

CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ch/code/P440/ROS_P440/src/BIRL_UWB/src/BIRL_UWB.cpp > CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.i

CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ch/code/P440/ROS_P440/src/BIRL_UWB/src/BIRL_UWB.cpp -o CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.s

CMakeFiles/locate_node.dir/src/usb.cpp.o: CMakeFiles/locate_node.dir/flags.make
CMakeFiles/locate_node.dir/src/usb.cpp.o: ../src/usb.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/locate_node.dir/src/usb.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/locate_node.dir/src/usb.cpp.o -c /home/ch/code/P440/ROS_P440/src/BIRL_UWB/src/usb.cpp

CMakeFiles/locate_node.dir/src/usb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/locate_node.dir/src/usb.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ch/code/P440/ROS_P440/src/BIRL_UWB/src/usb.cpp > CMakeFiles/locate_node.dir/src/usb.cpp.i

CMakeFiles/locate_node.dir/src/usb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/locate_node.dir/src/usb.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ch/code/P440/ROS_P440/src/BIRL_UWB/src/usb.cpp -o CMakeFiles/locate_node.dir/src/usb.cpp.s

CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.o: CMakeFiles/locate_node.dir/flags.make
CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.o: ../main/main_uwb_locating.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.o -c /home/ch/code/P440/ROS_P440/src/BIRL_UWB/main/main_uwb_locating.cpp

CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ch/code/P440/ROS_P440/src/BIRL_UWB/main/main_uwb_locating.cpp > CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.i

CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ch/code/P440/ROS_P440/src/BIRL_UWB/main/main_uwb_locating.cpp -o CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.s

# Object files for target locate_node
locate_node_OBJECTS = \
"CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.o" \
"CMakeFiles/locate_node.dir/src/usb.cpp.o" \
"CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.o"

# External object files for target locate_node
locate_node_EXTERNAL_OBJECTS =

devel/lib/BIRL_UWB/locate_node: CMakeFiles/locate_node.dir/src/BIRL_UWB.cpp.o
devel/lib/BIRL_UWB/locate_node: CMakeFiles/locate_node.dir/src/usb.cpp.o
devel/lib/BIRL_UWB/locate_node: CMakeFiles/locate_node.dir/main/main_uwb_locating.cpp.o
devel/lib/BIRL_UWB/locate_node: CMakeFiles/locate_node.dir/build.make
devel/lib/BIRL_UWB/locate_node: CMakeFiles/locate_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable devel/lib/BIRL_UWB/locate_node"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/locate_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/locate_node.dir/build: devel/lib/BIRL_UWB/locate_node

.PHONY : CMakeFiles/locate_node.dir/build

CMakeFiles/locate_node.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/locate_node.dir/cmake_clean.cmake
.PHONY : CMakeFiles/locate_node.dir/clean

CMakeFiles/locate_node.dir/depend:
	cd /home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ch/code/P440/ROS_P440/src/BIRL_UWB /home/ch/code/P440/ROS_P440/src/BIRL_UWB /home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug /home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug /home/ch/code/P440/ROS_P440/src/BIRL_UWB/cmake-build-debug/CMakeFiles/locate_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/locate_node.dir/depend

