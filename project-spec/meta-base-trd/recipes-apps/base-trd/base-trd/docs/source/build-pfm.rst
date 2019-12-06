Create the Vitis Platform
=========================

Prerequisites
-------------

* Reference Design zip file

* Vitis Unified Software Platform 2019.2

Build Flow Tutorial
-------------------

**Download Reference Design Files:**

Skip the following steps if the design zip file has already been downloaded and
extracted to a working directory

#. Download the VCK190 Base Targeted Reference Design ZIP file

#. Unzip Contents

The directory structure is described in the Introduction Section

**Create a Vitis Extensible Platform:**

#. Use XSCT to generate the Vitis platform

   To create the Vitis platform, run the following xsct tcl script::

    cd $working_dir/vck190_base_trd_platform1/platform
    xsct pfm.tcl -xsa $working_dir/vck190_base_trd_platform1/vivado/project/vck190_base_trd_platform1.sdk/vck190_base_trd_platform1.xsa

   The generated platform will be located at:

   *$working_dir/vck190_base_trd_platform1/platform/ws/vck190_base_trd_platform1/export/vck190_base_trd_platform1*

   It will be used as input when building the Vitis accelerator projects.
