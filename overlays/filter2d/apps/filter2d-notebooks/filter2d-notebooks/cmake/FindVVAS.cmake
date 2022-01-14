#
# Copyright 2021 Xilinx Inc.
# SPDX-License-Identifier: Apache-2.0
#

#
# FindVVAS
# ----------
# Finds the VVAS util library
#
# This will define the following variables:
#
# VVAS_FOUND - system has VVAS
# VVAS_INCLUDE_DIRS - the VVAS include directory
# VVAS_LIBRARIES - the VVAS libraries
#

find_path(VVAS_INCLUDE_DIRS NAMES vvas/vvas_kernel.h)
find_library(VVAS_LIBRARIES NAMES vvasutil)

set (_VVAS_REQUIRED_VARS VVAS_LIBRARIES VVAS_INCLUDE_DIRS)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(VVAS REQUIRED_VARS ${_VVAS_REQUIRED_VARS})

mark_as_advanced(VVAS_INCLUDE_DIRS VVAS_LIBRARIES)
