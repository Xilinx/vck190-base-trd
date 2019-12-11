Build the Vivado Design
=======================

Prerequisites
-------------

* Reference Design zip file

* Vivado Design Suite 2019.2

Build Flow Tutorial
-------------------

**Download Reference Design Files:**

Skip the following steps if the design zip file has already been downloaded and
extracted to a working directory

#. Download the VCK190 Base Targeted Reference Design ZIP file

#. Unzip Contents

The directory structure is described in the Introduction Section

**Generate Device Image and XSA:**

#. Enable Versal device support

   To enable Versal device support, you need to create two tcl initialization
   scripts, one for Vivado and one for HLS. Add the following line to each of
   the tcl scripts:

   .. code-block:: bash

      enable_beta_device *

   The initialization tcl script for Vivado shall be placed at:

   * **Linux**: $HOME/.Xilinx/Vivado/Vivado_init.tcl

   * **Windows**: %APPDATA%/Roaming/Xilinx/Vivado/Vivado_init.tcl

   Similarly, the initialization tcl script for HLS shall be placed at:

   * **Linux**: $HOME/.Xilinx/HLS_init.tcl

   * **Windows**: %APPDATA%/Roaming/Xilinx/HLS_init.tcl

#. Open the Vivado GUI.

   On Windows, open Vivado by navigating to *Start > Xilinx Design Tools > Vivado 2019.2*.
   In the tcl console type:

   .. code-block:: bash

     cd $working_dir/vck190_base_trd_platform1/vivado
     source scripts/main.tcl

   On Linux, at the command prompt enter:

   .. code-block:: bash

     cd $working_dir/vck190_base_trd_platform1/vivado
     vivado -source scripts/main.tcl

   A Vivado cockpit as shown below will open with vck190_base_trd_platform1
   project populated.

   .. image:: images/vivado.png
     :width: 1200
     :alt: Vivado cockpit

#. In the Flow Navigator pane on the left-hand side under IP Integrator, click
   on *Open Block Design*. An IP Integrator (IPI) block design
   (*vck190_base_trd_platform1.bd*) becomes visible that contains the
   Control, Interface and Processing System (CIPS) IP, NOC IP and
   Display Pipeline.

   .. image:: images/block_design.png
     :width: 1200
     :alt: IPI Block Design

#. In the Flow Navigator pane on the left-hand side under Program and Debug,
   click on *Generate Device Image*. The device image (pdi) for the design will
   be generated and available at
   *$working_dir/vck190_base_trd_platform1/vivado/project/vck190_base_trd_platform1.runs/impl_1/vck190_base_trd_platform1_wrapper.pdi*.

#. After Device Image Generation completes successfully a window pops up. Select
   *Open Implemented Design* and click on *OK*.

   .. image:: images/open_implemented_design.png
     :width: 350
     :alt: Open Implemented Design

#. To create the XSA, click on *File --> Export --> Export hardware*. A
   window pops up.

   * Unselect Include files for Emulation.

   * Select Include Device Image.

   * Change Export path to
     *$working_dir/vck190_base_trd_platform1/vivado/project/vck190_base_trd_platform1.sdk*

   * Click on OK.

   .. image:: images/export.png
     :width: 500
     :alt: Export hardware Options

   The file *vck190_base_trd_platform1.xsa* will be available in
   *$working_dir/vck190_base_trd_platform1/vivado/project/vck190_base_trd_platform1.sdk*
