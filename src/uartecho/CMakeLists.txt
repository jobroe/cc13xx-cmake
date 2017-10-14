project(uartecho)

cmake_minimum_required(VERSION 3.6)

message("CMAKE_MODULE_PATH:  ${CMAKE_MODULE_PATH}")

set(LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/tirtos/gcc/CC1310_LAUNCHXL_TIRTOS.lds")
include(cc13xx)

find_package(SimpleLinkCC13X0SDK)

find_package(Xdctools)

file(GLOB ${PROJECT_NAME}_SOURCES
    "*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/tirtos/*.c"
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${SimpleLinkCC13X0SDK_INCLUDE_DIRS}
    ${Xdctools_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)
target_link_libraries(${PROJECT_NAME}
    ${SimpleLinkCC13X0SDK_drivers_cc13x0_LIBRARY}
    ${SimpleLinkCC13X0SDK_rf_multiMode_cc13x0_LIBRARY}
    ${SimpleLinkCC13X0SDK_dpl_cc13x0_LIBRARY}
    ${SimpleLinkCC13X0SDK_driverlib_LIBRARY}
    gcc
    m
    nosys
    c
)
target_compile_definitions(${PROJECT_NAME} PUBLIC -DDeviceFamily_CC13X0 )

