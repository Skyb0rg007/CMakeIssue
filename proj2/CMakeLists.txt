cmake_minimum_required(VERSION 3.13)
project(proj2
    VERSION 1.0
    DESCRIPTION "Example for find_dependency issues"
)

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_SOURCE_DIR}/../proj1_install/lib64/cmake/proj1/)

find_package(Proj1 0.1.0 REQUIRED)

add_executable(proj2_exe proj2.c)
target_link_libraries(proj2_exe
    PRIVATE
        Proj1::proj1_lib
)
