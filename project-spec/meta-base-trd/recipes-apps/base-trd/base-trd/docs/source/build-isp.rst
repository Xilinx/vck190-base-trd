Appendix A - Build ISP IP
=======================================================

Prerequisites
-------------

* Vivado Design Suite 2020.1

* Vitis Libraries

Build Flow Tutorial
-------------------

**Download Reference Design Files:**

Skip the following steps if the design zip file has already been downloaded and
extracted to a working directory

#. Download the VCK190 Base Targeted Reference Design ZIP file

#. Unzip Contents

The directory structure is described in the Introduction Section. The Image Signal Processing (ISP) 
function will be available at 
*$working_dir/accelerators/vitis_libraries/vision/L1/examples/isppipeline*


**Set up the environment required to build the ISP:**

#. Set the following variables:

   .. code-block:: bash

      export OPENCV_INCLUDE=$working_dir/accelerators/vitis_libraries/vision/L1/include
      export HLS=vivado_hls

#. Edit the Makefile in the directory *isppipeline*. Since the ISP is not being simulated 
   or run through Vitis, the following checks can be removed. 

   .. code-block:: bash

      Replace
      setup: | check_part check_opencv
      with
      setup: | check_part
      
   .. code-block:: bash
   
      Replace
      runhls: data setup | check_vivado check_vpp
      with
      runhls: data setup | check_vivado 
   
   

#. Edit the file *xf_config_param.h* in the directory *isppipeline/build* based on platform 
   requirements

   .. code-block:: bash

      For Platform 1 - Single Sensor MIPI update parameter:
      #define XF_NPPC XF_NPPC4
      
   .. code-block:: bash
   
      For Platform 2 - Quad Sensor MIPI update parameters:
      #define XF_WIDTH 1920  
      #define XF_HEIGHT 1080      
      #define XF_BAYER_PATTERN XF_BAYER_GR 
   
**Generate ISP IP to instantiate in Vivado IPI:**

#. To create the ISP IP, run the Makefile in *./xf_opencv/L1/examples/isppipeline/*

   .. code-block:: bash
      
      For Platform 1 - Single Sensor MIPI running at 200 MHz:
      make run XPART=xcvc1902-vsva2197-1LP-e-S-es1 VIVADO_SYN=1 CLKP=5.0

   .. code-block:: bash
      
      For Platform 2 - Quad Sensor MIPI running @ 150 MHz:
      make run XPART=xcvc1902-vsva2197-1LP-e-S-es1 VIVADO_SYN=1 CLKP=6.6

   After synthesis completes the zip file for the IP, *xilinx_com_hls_ISPPipeline_accel_1_0.zip* 
   will be available in *isppipeline/isppipeline.prj/sol1/impl/ip*

#. To use the IP in the Vivado project, copy the zip in the user IP repository and 
   unzip it. To include the user IP repository in the project run the following commands 
   on the Vivado tcl console
   
   .. code-block:: bash
   
      set ip_repo_path {<path to user IP repository>}
      set_property ip_repo_paths $ip_repo_path [current_project] 
   
   To instantiate this IP in the IPI block design:
   Right click > Add IP > Select ISPPipeline_accel 
     
.. Note::

   The above instruction assumes that a user IP repository assocaited with a Vivado project
   doesn't exists. If it exists copy the zip file in that directory and skip the tcl commands.  
   
   
   

   


