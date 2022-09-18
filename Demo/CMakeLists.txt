cmake_minimum_required(VERSION 3.23)
project(Demo)

set(CMAKE_CXX_STANDARD 20)

add_executable(Demo main.cpp)


add_library(numlib STATIC IMPORTED)
set_target_properties(numlib PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/libNumber.a)
set_target_properties(numlib PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../Number)

add_library(vectorlib SHARED IMPORTED)
set_target_properties(vectorlib PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/libVector.so)
set_target_properties(vectorlib PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../Vector)

target_link_libraries(Demo numlib)
target_link_libraries(Demo vectorlib)
