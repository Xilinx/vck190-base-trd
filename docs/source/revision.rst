Revision History
================

**2022.1 v1.5**

* Add DOL HDR support in single-sensor capture pipeline

**2022.1 v1.4**

* Update Vivado/Vitis/Petalinux tools versions to 2022.1

* Synced to VAI 2.5 and VVAS 2.0 releases

* Remove support for ES1 silicon

**2021.2 v1.3**

* Update Vivado/Vitis/Petalinux tools versions to 2021.2

* Synced to VAI 2.0 and VVAS 1.1 releases

* Added TRD dashboard, which replaces APM, POWER and CPU notebooks

**2021.1 v1.2.1**

* Fix filter2d overlay references in build tutorials

**2021.1 v1.2**

* XVDPU support for quad-sensor ES platform (requires AIE workaround script)

**2021.1 v1.1**

* XVDPU support for single-sensor and quad-sensor production platforms

* Supported models: yolov3, refinedet, densebox, ssd

**2021.1 v1.0**

* Update Vivado/Vitis/Petalinux tools versions to 2021.1

* Add support for Dual LPDDR

* Support HDR10 for HDMI capture and playback

* Update ISP IP for Single and Quad sensor from Vitis Vision Libraries

* Add IVAS plugins for Filter 2D PL and Filter 2D SW

**2020.2 v0.5**

* Update Vivado/Vitis/Petalinux tools versions to 2020.2

* Add support for HDMI Rx and pass through audio in platform 3

* Update notebooks to support video capture from HDMI Rx

* Update notebooks to support audio capture and replay

* Add support for Pre-production Silicon

**2020.1 v0.4**

* Update Vivado/Vitis/Petalinux tools versions to 2020.1

* Add support for Avnet Multi-Camera MIPI FMC Module in platform 2

* Update notebooks to support video capture from Multi-camera FMC

* Add notebooks for plotting CPU utilization and Power Consumption

* Add Vitis Vision based ISP in MIPI capture pipelines

* Use mediasrcbin plugin instead of xlnxvideosrc

**2019.2 v0.3**

* Add support for Leopard IMX274 MIPI FMC in platform 1

* Update notebooks to support video capture from IMX274 sensor

* Add notebook to demonstrate time-multiplexed filtering on a multi-branch
  pipeline

* Add AXI performance monitor support in platform 1

* Add library and notebook to plot memory bandwith using AXI performance monitor

**2019.2 v0.2:**

* Replace 'shell' with 'platform' according to taxonomy

* Add link to PetaLinux Versal device support README

* Add Vitis platform and XSCT platform creation tcl script

* Add Vitis accelerator projects, GStreamer plugins and Jupyter notebook

  * 2D Filter (PL) using the Vitis Vision libraries

  * 2D Filter (AIE)

**2019.2 v0.1.1:**

* Compatible with Vivado and PetaLinux 2019.2 tools version

* Replace AXI GPIO with CIPS GPIO in Vivado design

**2019.2 EA v0.1:**

* Compatible with Vivado and PetaLinux 2019.2 EA tools version

* Initial Release of platform 1 including:

  * Vivado design

  * PetaLinux BSP

  * Prebuilt SD card image

  * Jupyter notebooks (NB1-4)

,,,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
