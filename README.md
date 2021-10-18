# VCK190 Base TRD

This repo uses git submodules. To clone this repo, run

``` bash
git clone --recursive https://github.com/Xilinx/vck190-base-trd.git
```

## Overview

The Versal:tm: Base TRD consists of a series of platforms, accelerators, and Jupyter
notebooks targeting the VCK190 evaluation board. A platform is a Vivado:registered: design
with a pre-instantiated set of I/O interfaces and a corresponding PetaLinux BSP
and image that includes the required kernel drivers and user-space libraries to
exercise those interfaces. Accelerators are mapped to FPGA logic resources
and/or AI Engine cores and stitched into the platform using the Vitis:tm: unified software platform toolchain.

Following is the list of Platform designs available in 2021.1:

| Platform Name  | Description   |  Links |
| -------------- | ------------- | ---------------- |
| vck190_mipiRxSingle_hdmiTx | This platform captures video from either a file source, USB webcam, or MIPI image sensor and displays it on a Jupyter Notebook or HDMI monitor. Along with video, audio from a file can be replayed using an HDMI transmitter. Accelerator functions can also be added to this platform using the Vitis platform. Supported acceleration function in this design is a 2D filter. | <ul><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_single_es_filter2d_prebuilt.zip">Filter2D ES Prebuilt Image</a></li><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_single_filter2d_prebuilt.zip">Filter2D Prebuilt Image</a></li><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_single_xvdpu_prebuilt.zip">XVDPU Prebuilt Image</a></li></ul>
| vck190_mipiRxQuad_hdmiTx | This platform captures video from either a file source, USB webcam, or Quad MIPI image sensor and displays it on a Jupyter Notebook or HDMI monitor. Along with video, audio from a file can be replayed using an HDMI transmitter. Accelerator functions can also be added to this platform using the Vitis platform. Supported acceleration function in this design is a 2D filter. | <ul><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_quad_es_filter2d_prebuilt.zip">Filter2D ES Prebuilt Image</a></li><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_quad_filter2d_prebuilt.zip">Filter2D Prebuilt Image</a></li><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_quad_xvdpu_prebuilt.zip">XVDPU Prebuilt Image</a></li></ul>
| vck190_hdmiRx_hdmiTx | This platform captures video from either a file source, USB webcam, or HDMI receiver and displays it on a Jupyter Notebook or HDMI monitor. Along with video, audio from a file or an HDMI receiver can  be replayed using an HDMI transmitter. Accelerator functions can also be added to this platform using the Vitis platfom. Supported acceleration function in this design is a 2D filter. |  <ul><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_hdmi_es_filter2d_prebuilt.zip">Filter2D ES Prebuilt Image</a></li><li><a href="https://www.xilinx.com/member/forms/download/trd-license-versal.html?filename=vck190_base_trd_hdmi_filter2d_prebuilt.zip">Filter2D Prebuilt Image</a></li></ul>

Other relevant links:

| Description   |  Links |
| ------------- | ---------------- |
| Instructions to run the prebuilt images and build the design from source files | <ul><li><a href="https://xilinx.github.io/vck190-base-trd/2021.1/html/index.html">Tutorials</a></li></ul>|
| License and sources associated with the prebuilt image|<ul><li><a href="https://www.xilinx.com/bin/public/openDownload?filename=vck190_base_trd_third_party_licenses_and_source.tar.gz">Third-party Licenses and Sources</a></li></ul>|

## License

Licensed under the Apache License, version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
