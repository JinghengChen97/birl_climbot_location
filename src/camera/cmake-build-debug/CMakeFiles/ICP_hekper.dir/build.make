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
include CMakeFiles/ICP_hekper.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ICP_hekper.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ICP_hekper.dir/flags.make

CMakeFiles/ICP_hekper.dir/test/main.cpp.o: CMakeFiles/ICP_hekper.dir/flags.make
CMakeFiles/ICP_hekper.dir/test/main.cpp.o: ../test/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ch/code/birl_climbot_location/src/camera/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ICP_hekper.dir/test/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ICP_hekper.dir/test/main.cpp.o -c /home/ch/code/birl_climbot_location/src/camera/test/main.cpp

CMakeFiles/ICP_hekper.dir/test/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ICP_hekper.dir/test/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ch/code/birl_climbot_location/src/camera/test/main.cpp > CMakeFiles/ICP_hekper.dir/test/main.cpp.i

CMakeFiles/ICP_hekper.dir/test/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ICP_hekper.dir/test/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ch/code/birl_climbot_location/src/camera/test/main.cpp -o CMakeFiles/ICP_hekper.dir/test/main.cpp.s

# Object files for target ICP_hekper
ICP_hekper_OBJECTS = \
"CMakeFiles/ICP_hekper.dir/test/main.cpp.o"

# External object files for target ICP_hekper
ICP_hekper_EXTERNAL_OBJECTS =

devel/lib/camera/ICP_hekper: CMakeFiles/ICP_hekper.dir/test/main.cpp.o
devel/lib/camera/ICP_hekper: CMakeFiles/ICP_hekper.dir/build.make
devel/lib/camera/ICP_hekper: CMakeFiles/ICP_hekper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ch/code/birl_climbot_location/src/camera/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable devel/lib/camera/ICP_hekper"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ICP_hekper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ICP_hekper.dir/build: devel/lib/camera/ICP_hekper

.PHONY : CMakeFiles/ICP_hekper.dir/build

CMakeFiles/ICP_hekper.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ICP_hekper.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ICP_hekper.dir/clean

CMakeFiles/ICP_hekper.dir/depend:
	cd /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ch/code/birl_climbot_location/src/camera /home/ch/code/birl_climbot_location/src/camera /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug /home/ch/code/birl_climbot_location/src/camera/cmake-build-debug/CMakeFiles/ICP_hekper.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ICP_hekper.dir/depend

