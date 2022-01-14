#
# Copyright 2021 Xilinx Inc.
# SPDX-License-Identifier: Apache-2.0
#

find_package(VVAS REQUIRED)
find_package(jansson REQUIRED)

set(TRD_LIB_INSTALL_DIR "lib/vvas")
set(TRD_VVAS_INSTALL_DIR "share/vvas/${CMAKE_PROJECT_NAME}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-narrowing -fpermissive -rdynamic -Wl,--no-undefined" )
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++14")

add_subdirectory(vvas_xfilter2d_pl)
add_subdirectory(vvas_xfilter2d_sw)

