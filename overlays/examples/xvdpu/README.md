
XVDPU (DPUCVDX8G) example supports platforms 'vck190_mipiRxSingle_hdmiTx' and 'vck190_mipiRxQuad_hdmiTx'. 
Before running this example, please firstly generate the VCK190 platform.

For the description of DPUCVDX8G, please refer to the document PG389 'Xilinx Versal DPU (DPUCVDX8G) Product Guide' .
This example support configuration is 'BATCH_N=1' and 'BATCH_N=3', with 'CPB_N=32' and frequency of DPUCVDX8G is 333M Hz.

To build the HW design,  
```
% cd overlays/examples/xvdpu/vitis_prj

% make all PLATFORM=<VCK190 platform> BATCH_N=<>

```
Generated SD card image:  overlays/examples/xvdpu/vitis_prj/package_out/sd_card.img.gz

Implemented Vivado project: overlays/examples/xvdpu/vitis_prj/hw/binary_container_1/link/vivado/vpl/prj

**Note1:** With 'make help' to check the detailed information about the commands. 

**Note2:** The 'arch.json' file : overlays/examples/xvdpu/vitis_prj/package_out/sd_card/arch.json