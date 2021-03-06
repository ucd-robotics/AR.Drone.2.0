# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/build

# Include any dependencies generated for this target.
include CMakeFiles/facetrack.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/facetrack.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/facetrack.dir/flags.make

CMakeFiles/facetrack.dir/src/facetrack_working.o: CMakeFiles/facetrack.dir/flags.make
CMakeFiles/facetrack.dir/src/facetrack_working.o: ../src/facetrack_working.cpp
CMakeFiles/facetrack.dir/src/facetrack_working.o: ../manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/roslib/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/roslang/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/roscpp/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/geometry_msgs/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/sensor_msgs/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/ros/core/rosbuild/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/rosconsole/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/pluginlib/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/message_filters/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/image_common/image_transport/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/vision_opencv/opencv2/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/vision_opencv/cv_bridge/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/bullet/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/geometry/angles/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/rospy/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/rostest/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/roswtf/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/geometry/tf/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/common_rosdeps/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/image_common/camera_calibration_parsers/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/image_common/camera_info_manager/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/rosservice/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/dynamic_reconfigure/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/diagnostic_msgs/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/share/std_msgs/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/diagnostics/diagnostic_updater/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/diagnostics/self_test/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/driver_common/driver_base/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /home/aaroncz/fuerte_workspace/AR.Drone.2.0/uvc_cam/manifest.xml
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/geometry/tf/msg_gen/generated
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/geometry/tf/srv_gen/generated
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/dynamic_reconfigure/msg_gen/generated
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/dynamic_reconfigure/srv_gen/generated
CMakeFiles/facetrack.dir/src/facetrack_working.o: /opt/ros/fuerte/stacks/driver_common/driver_base/msg_gen/generated
	$(CMAKE_COMMAND) -E cmake_progress_report /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/facetrack.dir/src/facetrack_working.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -DBT_USE_DOUBLE_PRECISION -DBT_EULER_DEFAULT_ZYX -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -o CMakeFiles/facetrack.dir/src/facetrack_working.o -c /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/src/facetrack_working.cpp

CMakeFiles/facetrack.dir/src/facetrack_working.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/facetrack.dir/src/facetrack_working.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -DBT_USE_DOUBLE_PRECISION -DBT_EULER_DEFAULT_ZYX -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -E /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/src/facetrack_working.cpp > CMakeFiles/facetrack.dir/src/facetrack_working.i

CMakeFiles/facetrack.dir/src/facetrack_working.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/facetrack.dir/src/facetrack_working.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -DBT_USE_DOUBLE_PRECISION -DBT_EULER_DEFAULT_ZYX -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -S /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/src/facetrack_working.cpp -o CMakeFiles/facetrack.dir/src/facetrack_working.s

CMakeFiles/facetrack.dir/src/facetrack_working.o.requires:
.PHONY : CMakeFiles/facetrack.dir/src/facetrack_working.o.requires

CMakeFiles/facetrack.dir/src/facetrack_working.o.provides: CMakeFiles/facetrack.dir/src/facetrack_working.o.requires
	$(MAKE) -f CMakeFiles/facetrack.dir/build.make CMakeFiles/facetrack.dir/src/facetrack_working.o.provides.build
.PHONY : CMakeFiles/facetrack.dir/src/facetrack_working.o.provides

CMakeFiles/facetrack.dir/src/facetrack_working.o.provides.build: CMakeFiles/facetrack.dir/src/facetrack_working.o

# Object files for target facetrack
facetrack_OBJECTS = \
"CMakeFiles/facetrack.dir/src/facetrack_working.o"

# External object files for target facetrack
facetrack_EXTERNAL_OBJECTS =

../bin/facetrack: CMakeFiles/facetrack.dir/src/facetrack_working.o
../bin/facetrack: CMakeFiles/facetrack.dir/build.make
../bin/facetrack: CMakeFiles/facetrack.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/facetrack"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/facetrack.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/facetrack.dir/build: ../bin/facetrack
.PHONY : CMakeFiles/facetrack.dir/build

CMakeFiles/facetrack.dir/requires: CMakeFiles/facetrack.dir/src/facetrack_working.o.requires
.PHONY : CMakeFiles/facetrack.dir/requires

CMakeFiles/facetrack.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/facetrack.dir/cmake_clean.cmake
.PHONY : CMakeFiles/facetrack.dir/clean

CMakeFiles/facetrack.dir/depend:
	cd /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/build /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/build /home/aaroncz/fuerte_workspace/AR.Drone.2.0/image_process/build/CMakeFiles/facetrack.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/facetrack.dir/depend

