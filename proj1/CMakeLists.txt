cmake_minimum_required(VERSION 3.8)
project(proj1
    VERSION 0.1.0
    DESCRIPTION "Example for find_dependency problems"
)

set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/../proj1_install/)

find_package(GSL 2.4 REQUIRED)

add_library(proj1_lib
    proj1.c
)
target_link_libraries(proj1_lib
    PUBLIC
        GSL::gsl
)

include(GNUInstallDirs)
install(TARGETS proj1_lib EXPORT proj1_lib_targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(EXPORT proj1_lib_targets
    FILE Proj1Targets.cmake
    NAMESPACE Proj1::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/proj1/
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    Proj1Config.cmake.in
    ${CMAKE_BINARY_DIR}/Proj1Config.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/proj1/
)
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/Proj1ConfigVersion.cmake
    VERSION ${proj1_VERSION}
    COMPATIBILITY SameMajorVersion
)
install(
    FILES 
        ${CMAKE_BINARY_DIR}/Proj1Config.cmake 
        ${CMAKE_BINARY_DIR}/Proj1ConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/proj1/
)
