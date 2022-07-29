Integrate 2D Filter Kernels in the Platform
===========================================

Prerequisites
-------------

* Reference Design source files

* Vitis Unified Software Platform 2022.1 (include AIE tool chain)

.. _Implement platform design with filter2d PL and filter2d AIE accelerators:

Build Flow Tutorial
-------------------

.. note::

   The below steps use platform vck190_mipiRxSingle_hdmiTx as an example.
   The same steps can be used for other platforms as well. The file/directory
   names will be replaced with the targeted platform name - *vck190_<platform_name>*

**Clone the Reference Design Files:**

Skip the following steps if the design has already been cloned and
extracted to a working directory

#. Clone the VCK190 Base TRD repository using the following command

   .. code-block:: bash

      git clone --branch 2022.1 --recursive https://github.com/Xilinx/vck190-base-trd.git

The directory structure is described in the Introduction Section

**Set up the Vitis toolchain:**

#. To set up the Vitis toolchain, run the following commands:

   .. code-block:: bash

      source $XILINX_VITIS/settings.sh
      export XILINXD_LICENSE_FILE=<path to where the aiecompiler license file is installed>

**Implement platform design with filter2d PL and filter2d AIE accelerators:**

#. To create the platform design with accelerators integrated, run the following
   Makefile:

   .. code-block:: bash

      cd $working_dir
      make overlay PFM=vck190_mipiRxSingle_hdmiTx OVERLAY=filter2d

   The Makefile implements the following:

   * Builds the filter2d PL kernel. Output is *filter2d_pl_accel.xo* file.
   * Builds the filter2d AIE kernel and the datamover (Tiler + Stitcher) kernel.
     The datamover   kernel is implemented on PL and is responsible to move data
     from/to DDR to/from the AI Engine. Outputs are *filter2d_aie_accel.xo*
     and *libadf.a* containing the AIE elf and cdo files as well as the
     graph description.
   * Integrates the above kernels into the *vck190_mipiRxSingle_hdmiTx* design
     using the Vitis linker. Generates *binary_container_1.xclbin* which
     contains meta data describing the kernels and platform. Generates a new
     XSA that includes the updated PDI.

   Note: If the *Create the Vitis Platform* tutorial is not run before this,
   then this Makefile also generates the Vitis platform


#. The following is a list of important output products:

   * Vivado project with integrated kernels:
     *$working_dir/overlays/filter2d/kernels/_x/link/vivado/vpl/prj/prj.xpr*

   * XSA required for building the Petalinux BSP:
     *$working_dir/overlays/filter2d/kernels/binary_container_1.xsa*
     The XSA contains the updated PDI with the accelerators added into the
     platform design and the merged AIE binary.The XSA is required to build the
     final boot image *BOOT.BIN* in PetaLinux.

   * The xclbin that contains the platform and kernel meta data needed by XRT:
     *$working_dir/overlays/filter2d/kernels/binary_container_1.xclbin*

,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
