Create the Vitis Platform
=========================

Prerequisites
-------------

* Reference Design source files

* Vivado Design Suite 2021.1

* Vitis Unified Software Platform 2021.1

Enable Versal device support
-----------------------------

.. note::

   The below steps can be skipped if design is not being built for ES 
   silicon.

To enable Versal device support, you need to create two tcl initialization
scripts, one for Vivado and one for HLS. Add the following line to each of
the tcl scripts:

.. code-block:: bash

   enable_beta_device *

The initialization tcl script for Vivado shall be placed at:

* $HOME/.Xilinx/Vivado/Vivado_init.tcl

Similarly, the initialization tcl script for HLS shall be placed at:

* $HOME/.Xilinx/HLS_init.tcl

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

      git clone --branch 2021.1 --recursive https://github.com/Xilinx/vck190-base-trd.git
      
The directory structure is described in the Introduction Section

**Create a Vitis Extensible Platform:**

#. To create the Vitis platform, run the following Make script:

   .. code-block:: bash

      cd $working_dir
      make platform PFM=vck190_mipiRxSingle_hdmiTx

   The generated platform will be located at:

   *$working_dir/platforms/xilinx_vck190_mipiRxSingle_hdmiTx_202110_1*

   It will be used as input when building the Vitis accelerator projects.

   The Makefile implements the following:

   * Builds the ISP pipeline from the Vitis Vision Libraries using Vitis HLS tool.
     This IP is required by the Single sensor and Quad sensor platforms 

   * Generates the XSA for the target platform using Vivado tool. 

   The following is a list of important output products:

   * IP files
      *$working_dir/platforms/vivado/ip*

   * Vivado project
      *$working_dir/platforms/vivado/vck190_mipiRxSingle_hdmiTx/project/vck190_mipiRxSingle_hdmiTx.xpr*

   * XSA 
      *$working_dir/platforms/vivado/vck190_mipiRxSingle_hdmiTx/project/vck190_mipiRxSingle_hdmiTx.xsa*

**View Platform Interfaces (Optional)**

#. Open the Vivado project.

   At the command prompt enter:

   .. code-block:: bash

     cd $working_dir/platform/vivado/vck190_mipiRxSingle_hdmiTx/project
     vivado vck190_mipiRxSingle_hdmiTx.xpr

#. In the Flow Navigator pane on the left-hand side under IP Integrator, click
   on *Open Block Design*. An IP Integrator (IPI) block design
   (*vck190_mipiRxSingle_hdmiTx.bd*) becomes visible that contains the
   Control, Interface and Processing System (CIPS) IP, NOC IP,
   AXI Performace Monitors (APM), MIPI CSI capture pipeline and HDMI Tx display
   pipeline.

#. To view the Platform interfaces that are enabled for Vitis compiler to stitch
   in accelerators, on the tool bar at the top click on  *Window >
   Platform Setup*. Platform interfaces are enabled under the following IPs

   * clk_wiz: Clocks used to drive clock inputs on the accelerator.
   * smartconnect_gp2: AXI Memory Mapped master ports to drive the accelerator
     control port.
   * NOC_0: AXI Memory Mapped slave ports driven by the
     accelerator data port.
   * intc_0: Interrupt contoller to forward interrupts from the accelerator to 
     the Procesing System

   .. tip::
      For more information on how to setup Platform Interfaces refer to Section
      - Creating an Embedded Platform in Xilinx Vitis Unified Software Platform Documentation(UG1393)

,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
