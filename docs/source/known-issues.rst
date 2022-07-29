Known Issues
============

#. On the vck190_hdmiRx_hdmiTx platform, few of VCK190 boards HDMI TX
   display (blue screen) doesn't come up right after linux boot in such
   scenarios, disconnect HDMI RX source and boot again. After the boot,
   connect back the HDMI RX source.

#. Enabling the primary plane on the Video Mixer by default results in a
   bandwidth utilization of 2GB. A patch is applied to disable the mixer primary
   plane by default. To enable/disable the primary plane through module_param
   and devmem use the following commands. To render a test pattern on the
   display using a utility like modetest, the primary plane should be enabled.

   * Enable:

   .. code-block:: bash

	echo Y > /sys/module/xlnx_mixer/parameters/mixer_primary_enable

   * Disable:

   .. code-block:: bash

	devmem 0xa0070040 32 0x0
	echo N > /sys/module/xlnx_mixer/parameters/mixer_primary_enable

,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
