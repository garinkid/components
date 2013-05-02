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
CMAKE_SOURCE_DIR = /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build

# Utility rule file for ROSBUILD_gensrv_py.

# Include the progress variables for this target.
include CMakeFiles/ROSBUILD_gensrv_py.dir/progress.make

CMakeFiles/ROSBUILD_gensrv_py: ../src/edufill_object_detection/srv/__init__.py

../src/edufill_object_detection/srv/__init__.py: ../src/edufill_object_detection/srv/_DetectCube.py
	$(CMAKE_COMMAND) -E cmake_progress_report /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating ../src/edufill_object_detection/srv/__init__.py"
	/opt/ros/fuerte/share/rospy/rosbuild/scripts/gensrv_py.py --initpy /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/srv/DetectCube.srv

../src/edufill_object_detection/srv/_DetectCube.py: ../srv/DetectCube.srv
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/rospy/rosbuild/scripts/gensrv_py.py
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/roslib/bin/gendeps
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/geometry_msgs/msg/Pose.msg
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/geometry_msgs/msg/PoseStamped.msg
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/std_msgs/msg/Header.msg
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/geometry_msgs/msg/Quaternion.msg
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/geometry_msgs/msg/Point.msg
../src/edufill_object_detection/srv/_DetectCube.py: ../manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/geometry_msgs/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/sensor_msgs/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/stacks/vision_opencv/opencv2/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/roslang/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/roscpp/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/stacks/vision_opencv/cv_bridge/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/ros/core/rosbuild/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/roslib/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/rosconsole/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/stacks/pluginlib/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/message_filters/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/stacks/image_common/image_transport/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/share/rospy/manifest.xml
../src/edufill_object_detection/srv/_DetectCube.py: /opt/ros/fuerte/stacks/vision_opencv/image_geometry/manifest.xml
	$(CMAKE_COMMAND) -E cmake_progress_report /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating ../src/edufill_object_detection/srv/_DetectCube.py"
	/opt/ros/fuerte/share/rospy/rosbuild/scripts/gensrv_py.py --noinitpy /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/srv/DetectCube.srv

ROSBUILD_gensrv_py: CMakeFiles/ROSBUILD_gensrv_py
ROSBUILD_gensrv_py: ../src/edufill_object_detection/srv/__init__.py
ROSBUILD_gensrv_py: ../src/edufill_object_detection/srv/_DetectCube.py
ROSBUILD_gensrv_py: CMakeFiles/ROSBUILD_gensrv_py.dir/build.make
.PHONY : ROSBUILD_gensrv_py

# Rule to build all files generated by this target.
CMakeFiles/ROSBUILD_gensrv_py.dir/build: ROSBUILD_gensrv_py
.PHONY : CMakeFiles/ROSBUILD_gensrv_py.dir/build

CMakeFiles/ROSBUILD_gensrv_py.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ROSBUILD_gensrv_py.dir/clean

CMakeFiles/ROSBUILD_gensrv_py.dir/depend:
	cd /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_perception/edufill_object_detection/build/CMakeFiles/ROSBUILD_gensrv_py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ROSBUILD_gensrv_py.dir/depend
