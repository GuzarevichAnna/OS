cmake_minimum_required(VERSION 3.23)
project(Vector)

set(CMAKE_CXX_STANDARD 20)

add_library(Vector SHARED Vector.cpp)







add_library(numlib STATIC IMPORTED)
set_target_properties(numlib PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/libNumber.a)
set_target_properties(numlib PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../Number)

target_link_libraries(Vector numlib)