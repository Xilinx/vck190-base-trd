Known Issues
============

#. On ES1 silicon there is an issue with the MIPI DPHY XPIO which requires 
   additional register writes after the system is booted. A script named 
   *mipi_dphy_workaround.sh* is provided and automatically executed during boot.

#. The APM, CPU utilization and power graph plots result in high CPU
   utilization. If the plots are disabled, the CPU utilization is reduced. This
   can be verified by running the top command from a terminal.

#. The monitor should show a blue standby screen after boot. If that is not the
   case, re-plug the HDMI cable and the blue standby screen should appear.

#. Enabling the primary plane on the Video Mixer by default results in a bandwidth 
   utilization of 2GB. A patch is applied to disable the mixer primary plane by 
   default. To enable/disable the primary plane through module_param and devmem use 
   the following commands. To render a test pattern on the display using a utility 
   like modetest, the primary plane should be enabled.
   
   * Enable:
   
   .. code-block:: bash

	echo Y > /sys/module/xlnx_mixer/parameters/mixer_primary_enable
	
   * Disable:

   .. code-block:: bash
	
	devmem 0xa0070040 32 0x0
	echo N > /sys/module/xlnx_mixer/parameters/mixer_primary_enable
