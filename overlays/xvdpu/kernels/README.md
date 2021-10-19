# XVDPU Example

XVDPU (DPUCVDX8G) example supports platforms 'vck190_mipiRxSingle_hdmiTx' and 'vck190_mipiRxQuad_hdmiTx'.
It can also support ES1 platform 'vck190_es1_mipiRxQuad_hdmiTx', by adding the workaroud for ES1 part. See the below section "Workaround for ES1"
 
For the description of DPUCVDX8G, please refer to the document PG389 'Xilinx Versal DPU (DPUCVDX8G) Product Guide' .
This example support configuration is 'CPB_N=32, BATCH_N=1' and frequency of DPUCVDX8G is 333M Hz.

```
Generated xclbin:  overlays/xvdpu/kernels
Implemented Vivado project: overlays/xvdpu/kernels/vitis_prj/hw/binary_container_1/link/vivado/vpl/prj
'arch.json' file : "overlays/xvdpu/kernels/arch.json", also can be found "overlays/xvdpu/kernels/vitis_prj/package_out/sd_card/arch.json"
```

# Workaround for ES1

For the SD image built with ES1 platform 'vck190_es1_mipiRxQuad_hdmiTx', before running apps of xvdpu, need firstly run workaround for ES1 part.

After VCK190-ES1 board is booting up with the SD image, create a file named as 'es1_workaround.sh' with below content, and run it with command 'bash es1_workaround.sh'.

Content of 'es1_workaround.sh' :

```
for i in {0..39}
do
  for j in {1..8}
  do
    a=0x20000000000
    b=0x31000
    devmem $[a+b+(i<<23)+(j<<18)] 32 0
  done
done
```

# License

Licensed under the Apache License, version 2.0 (the "License"); you may not use this file 
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)


Unless required by applicable law or agreed to in writing, software distributed under the 
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
either express or implied. See the License for the specific language governing permissions 
and limitations under the License.  