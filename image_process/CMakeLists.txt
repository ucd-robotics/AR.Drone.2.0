cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

rosbuild_init()

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#uncomment if you have defined messages
#rosbuild_genmsg()
#uncomment if you have defined services
#rosbuild_gensrv()

#common commands for building c++ executables and libraries
#rosbuild_add_library(${PROJECT_NAME} src/example.cpp)
#target_link_libraries(${PROJECT_NAME} another_library)
#rosbuild_add_boost_directories()
#rosbuild_link_boost(${PROJECT_NAME} thread)
#rosbuild_add_executable(example examples/example.cpp)
#target_link_libraries(example ${PROJECT_NAME})

rosbuild_add_executable(drone_colour_track src/drone_colour_track.cpp) #WORKING! tracks yellow object from drone!
rosbuild_add_executable(drone_facetrack src/drone_facetrack.cpp) #right now only gets drone cam, must work and fix to track face!!
rosbuild_add_executable(single_col_tracking src/single_color_tracking.cpp) #tracks yellow and prints yellow line, (comp cam)
rosbuild_add_executable(face_det src/face_det.cpp) #tracks face and prints circle on face an eyes (comp cam)
rosbuild_add_executable(blobtrack src/blobtrack.cpp) #needs arguments when running
rosbuild_add_executable(camshift src/camshift.cpp) #mouse click and drag to track object, (comp cam)
rosbuild_add_executable(simpleCanny src/simpleCanny.cpp) #gets drone cam and converts image to get canny and prints both feeds
rosbuild_add_executable(tester src/tester.cpp) # doesnt work, optical flow test
#rosbuild_add_executable(blobresult src/blobresult.cpp)
#rosbuild_add_executable(tracking src/colour_tracking.cpp)



