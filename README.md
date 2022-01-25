# VCK190 Base TRD

This repo uses git submodules. To clone this repo, run

``` bash
git clone --recursive https://github.com/Xilinx/vck190-base-trd.git
```

## Tools Version

The supported Xilinx tools release is 2021.2.

Install y2k22_patch for Vivado HLS and Vitis HLS tools to avoid 'Y2K22 Overflow Issue'.
Refer to the following Answer Record for obtaining the patch. 

https://support.xilinx.com/s/article/76960?language=en_US

## Overview

The Versal:registered: Base TRD consists of a series of platforms, accelerators,
Jupyter notebooks and applications targeting the VCK190 evaluation board. A
platform is a Vivado:registered: design with a pre-instantiated set of I/O
interfaces and a corresponding PetaLinux BSP and image that includes the
required kernel drivers and user-space libraries to exercise those interfaces.
Accelerators are mapped to FPGA logic resources and/or AI Engine cores and
stitched into the platform using the Vitis:tm: unified software platform
toolchain.

## Platforms

1. **Mipi Rx Single Sensor and HDMI Tx Platform:**
This Vitis platform captures video from either a file source, USB webcam, or an
image sensor using the [IMX274 MIPI FMC Module](https://www.leopardimaging.com/product/csi-2-mipi-modules-i-pex/li-imx274mipi-fmc/)
and displays it on a HDMI monitor. Along with video, audio from a file can be
replayed using the HDMI transmitter. Accelerator functions can be added into
this platform using the Vitis acceleration flow. Two versions of this platform
are available for production and ES silicon.

2. **Mipi Rx Quad Sensor and HDMI Tx Platform:**
This Vitis platform captures video from either a file source, USB webcam, or
four image sensors using the [Quad AR0231AT Camera FMC Bundle](https://www.avnet.com/shop/emea/products/avnet-engineering-services/aes-fmc-mc4-ar0231at-g-3074457345636156873/)
and displays it on a HDMI monitor. Along with video, audio from a file can be
replayed using the HDMI transmitter. Accelerator functions can be added into
this platform using the Vitis acceleration flow. Two versions of this platform
are available for production and ES silicon.

3. **HDMI Rx and HDMI Tx Platform:**
This platform captures video from either a file source, USB webcam, or HDMI
receiver and displays it on a HDMI monitor. Along with video, audio from a file
or the HDMI receiver can be replayed using the HDMI transmitter. Accelerator
functions can be added into this platform using the Vitis acceleration flow. Two
versions of this platform are available for production and ES silicon.

## Overlays

1. **Filter2d:**
This overlay adds a 2D convolution filter with programmable coefficients into a
Vitis platform. The current 2D filter implementation supports an OpenCV based
version running on the APU and an HLS-based PL accelerated version using the
Vitis Vision libraries. A series of jupyter notebooks are provided demonstrating
different data flows through the 2D filter.

2. **XVDPU:**
This overlay adds the XVDPU ML inference engine and multi-scaler IP into a Vitis
platform. A command line application allows capturing video from the image
sensor(s), running the ML model(s) and then displaying the output on the
display. The supported ML models are: yolov3, refinedet, densebox, ssd.

## Documentation

Additional documentation can be found on [github pages](https://xilinx.github.io/vck190-base-trd/2021.1/html/index.html) including:

* Tutorials for running the prebuilt SD card images and applications
* Tool flow tutorials for various design components including Vitis platforms,
Vitis overlays and the PetaLinux BSP
* Architecture guide on hardware designs and software stack

## Third-Party Content

All Xilinx and third-party licenses and sources associated with this reference
design can be downloaded [here](https://www.xilinx.com/bin/public/openDownload?filename=vck190_base_trd_third_party_licenses_and_source.tar.gz).

## License

Licensed under the Apache License, version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
