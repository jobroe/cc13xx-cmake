# About

The aim of this project is to provide a software development environment based on CMake, GCC and openOCD for TI's CC13x0 platform.
This poject is the beginning and currently only tested on LAUNCHXL-CC1310 development kit.

# Requirements

   * CMake >= 3.6
   * GCC arm-none-abi
     * Linux Arch: `arm-none-eabi-gcc` `arm-none-eabi-binutils` `arm-none-eabi-newlib`
     * Ubuntu packages: `gcc-arm-none-eabi` `gdb-arm-none-eabi` `libnewlib-arm-none-eabi`
   * [SIMPLELINK-CC13X0-SDK](http://www.ti.com/tool/download/SIMPLELINK-CC13X0-SDK)
   * [XDCtools](http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/index.html)


# Features

 * General CMake Toolchain file for arm-none-eabi-gcc
 * Target specific extension of Toolchain file
 * Find modules for SIMPLELINK-CC13X0-SDK and XDCtools
 
Planned:
 * Debugging and flashing possibilities
 * Building TI-RTOS and Drivers instead of using prebuild libraries

# Usage

There is a example project (taken from the SIMPLELINK-CC13X0-SDK) inlcuded under src/uartecho which shows how the this toolset can be used for your own projects.

Go to src/uartecho, create build directory:

    mkdir build

run to configure:

    cmake -DCMAKE_PREFIX_PATH="/path/to/simplelink_cc13x0_sdk_1_40_00_10;/path/to/xdctools_3_50_02_20_core/" -DCMAKE_TOOLCHAIN_FILE=../../../cmake/toolchain-arm-none-eabi.cmake ..

and finally to build:

    make

