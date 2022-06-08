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

find_package(PkgConfig)
pkg_check_modules(VVAS REQUIRED vvas-utils>=2.0)
