# XVDPU Example

This XVDPU (DPUCVDX8G) example is specific for this TRD, it's configuration is fixed as C32B1 (CPB_N=32, BATCH_N=1). For other configurations of XVDPU, please use XVDPU-TRD in the Vitis-AI git (https://github.com/Xilinx/Vitis-AI/tree/master/dsa/XVDPU-TRD)


XVDPU (DPUCVDX8G) example supports platforms 'vck190_mipiRxSingle_hdmiTx' and 'vck190_mipiRxQuad_hdmiTx'.

For the description of DPUCVDX8G, please refer to the document PG389 'Xilinx Versal DPU (DPUCVDX8G) Product Guide' .
In this example, frequency of DPUCVDX8G is 333M Hz.

```
Generated xclbin:  overlays/xvdpu/kernels
Implemented Vivado project: overlays/xvdpu/kernels/vitis_prj/hw/binary_container_1/link/vivado/vpl/prj
'arch.json' file : "overlays/xvdpu/kernels/arch.json", also can be found "overlays/xvdpu/kernels/vitis_prj/package_out/sd_card/arch.json"
```

**NOTE!**:
Some NOC parameters in Vitis 2022.1 have been changed, which will affect DDR performance, thus performance of XVDPU for running some models will be dropped.

To get performance back, there is workaround to change the default NOC parameters for Vitis 2022.1.

Before compiling the project, adding the following line to your tcl scripts '$HOME/.Xilinx/Vivado/Vivado_init.tcl'

```
set_param place.preplaceNOC true

```

For details about 'Vivado_init.tcl', please refer to the link page 'https://docs.xilinx.com/r/en-US/ug894-vivado-tcl-scripting/Initializing-Tcl-Scripts'.

# License

Licensed under the Apache License, version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
