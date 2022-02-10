# XVDPU Example

XVDPU (DPUCVDX8G) example supports platforms 'vck190_mipiRxSingle_hdmiTx, 'vck190_mipiRxQuad_hdmiTx', and 'vck190_es1_mipiRxQuad_hdmiTx'.
 
For the description of DPUCVDX8G, please refer to the document PG389 'Xilinx Versal DPU (DPUCVDX8G) Product Guide' .
This example support configuration is 'CPB_N=32, BATCH_N=1' and frequency of DPUCVDX8G is 333M Hz.

```
Generated xclbin:  overlays/xvdpu/kernels
Implemented Vivado project: overlays/xvdpu/kernels/vitis_prj/hw/binary_container_1/link/vivado/vpl/prj
'arch.json' file : "overlays/xvdpu/kernels/arch.json", also can be found "overlays/xvdpu/kernels/vitis_prj/package_out/sd_card/arch.json"
```

**NOTE**:\
For the SD image built with ES1 platform *vck190_es1_mipiRxQuad_hdmiTx*, need execute AIE workaround firstly before running apps of xvdpu.
Please run command `/etc/init.d/aie_workaround4es1.sh` in linux shell after VCK190-ES1 board boots up.

# License

Licensed under the Apache License, version 2.0 (the "License"); you may not use this file 
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)


Unless required by applicable law or agreed to in writing, software distributed under the 
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
either express or implied. See the License for the specific language governing permissions 
and limitations under the License.  