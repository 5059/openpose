set(SOURCES  
  cuda.cpp
  errorAndLog.cpp
  fileSystem.cpp
  flagsToOpenPose.cpp
  keypoint.cpp
  openCv.cpp
  profiler.cpp
  string.cpp)

find_package(Boost COMPONENTS system filesystem REQUIRED)
  
cuda_add_library(utilities SHARED ${SOURCES})
target_link_libraries(utilities producer filestream ${Caffe_LIBS}
  ${Boost_FILESYSTEM_LIBRARY} ${Boost_SYSTEM_LIBRARY})
if (BUILD_CAFFE)
  add_dependencies(utilities caffe)
endif (BUILD_CAFFE)
