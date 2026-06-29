cmake_minimum_required(VERSION 3.18)
project(ct_hemorrhage CUDA CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)

find_package(CUDA REQUIRED)
find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS} include)

add_executable(ct_hemorrhage src/main.cu)
target_link_libraries(ct_hemorrhage ${OpenCV_LIBS})
