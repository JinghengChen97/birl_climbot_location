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
CMAKE_SOURCE_DIR = /home/ch/code/birl_climbot_location/src/camera

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ye.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ye.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ye.dir/flags.make

CMakeFiles/ye.dir/test/main.cpp.o: CMakeFiles/ye.dir/flags.make
CMakeFiles/ye.dir/test/main.cpp.o: ../test/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ch/code/birl_climbot_location/src/camera/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ye.dir/test/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ye.dir/test/main.cpp.o -c /home/ch/code/birl_climbot_location/src/camera/test/main.cpp

CMakeFiles/ye.dir/test/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ye.dir/test/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ch/code/birl_climbot_location/src/camera/test/main.cpp > CMakeFiles/ye.dir/test/main.cpp.i

CMakeFiles/ye.dir/test/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ye.dir/test/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ch/code/birl_climbot_location/src/camera/test/main.cpp -o CMakeFiles/ye.dir/test/main.cpp.s

# Object files for target ye
ye_OBJECTS = \
"CMakeFiles/ye.dir/test/main.cpp.o"

# External object files for target ye
ye_EXTERNAL_OBJECTS =

devel/lib/camera/ye: CMakeFiles/ye.dir/test/main.cpp.o
devel/lib/camera/ye: CMakeFiles/ye.dir/build.make
devel/lib/camera/ye: CMakeFiles/ye.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ch/code/birl_climbot_location/src/camera/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable devel/lib/camera/ye"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ye.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ye.dir/build: devel/lib/camera/ye

.PHONY : CMakeFiles/ye.dir/build

CMakeFiles/ye.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ye.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ye.dir/clean

CMakeFiles/ye.dir/depend:
	cd /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ch/code/birl_climbot_location/src/camera /home/ch/code/birl_climbot_location/src/camera /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug/CMakeFiles/ye.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ye.dir/depend

