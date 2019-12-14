Integrate 2D Filter Kernels in the Platform
===========================================

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

**Set up AI engine toolchain environment:**

#. To set up the AIE toolchain, run the following commands:

   .. code-block:: bash

      export CARDANO_ROOT=$XILINX_VITIS/cardano
      source $CARDANO_ROOT/scripts/cardano_env.sh
      export XILINXD_LICENSE_FILE=<path to where the license file is installed>

**Implement platform design with filter2d PL and filter2d AIE accelerators:**

#. To create the platform design with accelerators integrated, run the following
   Makefile:

   .. code-block:: bash

      cd $working_dir/vck190_base_trd_platform1/accelerators/examples/filter2d_combined
      make PLATFORM=$working_dir/vck190_base_trd_platform1/platform/ws/vck190_base_trd_platform1/export/vck190_base_trd_platform1/vck190_base_trd_platform1.xpfm

   The Makefile implements the following

   * Builds the filter2d PL kernel. Output is *filter2d_pl_accel.xo* file.
   * Builds the filter2d AIE kernel and the datamover kernel. The datamover
     kernel is implemented on PL and is responsible to move data from/to DDR
     to/from the AI Engine. Output is a *graph.o* and *filter2d_aie_accel.xo*
   * Integrates the above kernels into *vck190_base_trd_platform1*

>The Vivado project with the integrated kernels is located at:
  *$working_dir/vck190_base_trd_platform1/accelerators/examples/filter2d_combined/_x/link/vivado/vpl/prj/prj.xpr*

>The XSA required to build Petalinux BSP is located at:
  *$working_dir/vck190_base_trd_platform1/accelerators/examples/filter2d_combined/_x/link/vivado/vpl/output/vpl_gen_fixed.xsa*

>The PDI required to build the *BOOT.BIN* is located at:
  *$working_dir/vck190_base_trd_platform1/accelerators/examples/filter2d_combined/_x/link/vivado/vpl/output/system.pdi*

>The AIE elf file required to build the *BOOT.BIN* is located at:
  *$working_dir/vck190_base_trd_platform1/accelerators/examples/filter2d_aie/kernel/2_2*

>The AIE cdo file required to build the *BOOT.BIN* is located at:
  *$working_dir/vck190_base_trd_platform1/accelerators/examples/filter2d_aie/kernel/aie_cdo.bin*

