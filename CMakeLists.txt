cmake_minimum_required(VERSION 3.0.0)
project(flutter_login_getx_template VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(flutter_login_getx_template main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
