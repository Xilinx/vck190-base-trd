#
# Copyright 2021 Xilinx Inc.
# SPDX-License-Identifier: Apache-2.0
#

set(KERNEL vvas_xfilter2d_pl)

add_library(${KERNEL} SHARED src/vvas_xfilter2d_pl.c)

target_include_directories(${KERNEL} PRIVATE
    ${JANSSON_INCLUDE_DIRS}
    ${VVAS_INCLUDE_DIRS})

target_link_libraries(${KERNEL}
    ${JANSSON_LIBRARIES}
    ${VVAS_LIBRARIES})

install(TARGETS ${KERNEL} DESTINATION ${TRD_LIB_INSTALL_DIR})
install(FILES json_files/kernel_xfilter2d_pl.json DESTINATION ${TRD_VVAS_INSTALL_DIR})

