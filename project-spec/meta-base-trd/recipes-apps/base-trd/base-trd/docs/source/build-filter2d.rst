Integrate 2D Filter Kernels in the Platform
===========================================

Prerequisites
-------------

* Reference Design zip file

* Vitis Unified Software Platform 2020.1 (include AIE tool chain)

* Xilinx Runtime (XRT) 2020.1


Build Flow Tutorial
-------------------

.. tip::

   You can skip this tutorial and move straight to the next tutorial if desired.
   Pre-built Vitis acceleration output products are located inside the PetaLinux
   BSP file located at:
   *$working_dir/petalinux/xilinx-vck190-es1-base-trd-platform1-2020.1.bsp*

.. note::

   The below steps use platform 1 as an example. The same steps can be used for
   other platforms as well, only the file/directory names with platform1 will be
   replaced with the targeted platform.

**Download Reference Design Files:**

Skip the following steps if the design zip file has already been downloaded and
extracted to a working directory

#. Download the VCK190 Base Targeted Reference Design ZIP file

#. Unzip Contents

The directory structure is described in the Introduction Section

**Set up the AI Engine toolchain and XRT environment:**

#. To set up the AIE toolchain, run the following commands:

   .. code-block:: bash

      export CARDANO_ROOT=$XILINX_VITIS/cardano
      source $CARDANO_ROOT/scripts/cardano_env.sh
      export XILINXD_LICENSE_FILE=<path to where the license file is installed>

#. To set up the XRT environment, follow the installation instructions provided
   here: https://xilinx.github.io/XRT/2020.1/html/build.html

**Implement platform design with filter2d PL and filter2d AIE accelerators:**

#. To create the platform design with accelerators integrated, run the following
   Makefile:

   .. code-block:: bash

      cd $working_dir/accelerators/examples/filter2d_combined
      make PLATFORM=$working_dir/vivado/project/vck190_base_trd_platform1.sdk/vck190_base_trd_platform1.xsa

   .. tip::

      Alternatively, the prebuilt platform can be used which allows skipping the
      Vivado and platform creation steps in the previous two tutorials. To do
      so, run the above make command with the following platform path instead:
      *PLATFORM=$working_dir/vivado/vck190_base_trd_platform1.xsa*

   .. warning::

      The *PLATFORM* variable needs to use an absolute path, otherwise the make
      step will error out.

   The Makefile implements the following:

   * Builds the filter2d PL kernel. Output is *filter2d_pl_accel.xo* file.
   * Builds the filter2d AIE kernel and the datamover kernel. The datamover
     kernel is implemented on PL and is responsible to move data from/to DDR
     to/from the AI Engine. Output is a *graph.o* and *filter2d_aie_accel.xo*
   * Integrates the above kernels into the *vck190_base_trd_platform1* design
     using the Vitis linker. Generates *binary_container_1.xclbin* which
     contains meta data describing the kernels and platform. Generates a new
     XSA that includes the updated PDI.

#. The following is a list of important output products:

   * Vivado project with integrated kernels:
     *$working_dir/accelerators/examples/filter2d_combined/_x/link/vivado/vpl/prj/prj.xpr*

   * XSA required for building the Petalinux BSP:
     *$working_dir/accelerators/examples/filter2d_combined/binary_container_1.xsa*
     The XSA contains the updated PDI with the accelerators added into the
     platform design and the merged AIE binary. The XSA is required to build the
     final boot image *BOOT.BIN* in PetaLinux.

   * The xclbin that contains the platform and kernel meta data needed by XRT:
     *$working_dir/accelerators/examples/filter2d_combined/binary_container_1.xclbin*

   * The AIE elf file required to build the *BOOT.BIN*:
     *$working_dir/accelerators/examples/filter2d_aie/kernel/2_2*

   * The AIE cdo file required to build the *BOOT.BIN*:
     *$working_dir/accelerators/examples/filter2d_aie/kernel/aie_cdo.bin*

