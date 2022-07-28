Run 2D Filter Application
=========================

Jupyter Notebooks are used to demonstarte the workings of the
Platform 3 - *vck190_hdmiRx_hdmiTx* with filter2d accelerator. 
A network connection is required to run these Notebooks.

Use SD card image for Platform 3 - *vck190_hdmiRx_hdmiTx* to 
run this application.


Connect to the JupyterLab Server
--------------------------------

Follow these steps to boot the board into Linux. These steps can be skipped 
if you are already at the Linux prompt *xilinx-vck190-20221* 

* Ensure all steps under the section :ref:`Board Setup` are
  verified.

* Insert the prepared micro SD card into the Versal SD card slot (refer to the
  image in :ref:`Board Setup`)

* Have the UART0 terminal emulator tab connected.

* Turn ON power switch SW13.

* On Versal UART0 terminal, you would see the Versal device booting from the
  micro SD card, starting with the message
  "Xilinx Versal Platform Loader and Manager"

* In about 60 seconds boot is complete. Observe the Linux prompt
  *xilinx-vck190-20221* and finish logging in. 

* JupyterLab server is disabled in the systemd services and will not autostart.
  Users can enable 'jupyter-setup' via systemctl to autostart the service.

Follow the steps in the example below to start JupyterLab:

  .. code-block:: bash

     xilinx-vck190-20221:~$ sudo systemctl start jupyter-setup
     xilinx-vck190-20221:~$ sudo jupyter-lab  list
     Currently running servers:
     http://192.168.xx.x:8888/?token=1f69939d70cdedd044adb64c91d26a75c01da7ad34f8ff03 :: /usr/share/notebooks

* Copy the above URL `http://192.168.xx.x:8888/?token=1f69939d70cdedd044adb64c91d26a75c01da7ad34f8ff03` to the chrome browser.

* Users can check status of the systemd service 'jupyter-setup' any time for debug info:

  .. code-block:: bash

     xilinx-vck190-20221:~$ systemctl status jupyter-setup
     * jupyter-setup.service - jupyter setup scripts
          Loaded: loaded (/lib/systemd/system/jupyter-setup.service; disabled; vendor preset: disabled)
          Active: active (running) since Fri 2021-11-19 10:12:14 PST; 20min ago
        Main PID: 879 (start-jupyter.s)
           Tasks: 3 (limit: 2237)
          Memory: 125.6M
          CGroup: /system.slice/jupyter-setup.service
                  |-879 /bin/bash /sbin/start-jupyter.sh
                  `-884 python3 /usr/bin/jupyter-lab --no-browser --allow-root --ip=192.xxx.xx.xx



.. note::

    If you do not see any URL for the Juputer Notebook, you may have to setup
    a private network. Likely, DHCP is not available to allot the board an
    IP address. To setup a private network and start the notebook follow the
    instruction below.


Setting up a private network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
In case of a private network, user can assign a static address within
the subnet of the host machine.

**Setting up a private network with target board and the host machine for
Windows users:**

* Ensure a direct connection between the windows host machine and the target
  board using an ethernet cable as shown in the :ref:`Board Setup` section.

* In windows, run command prompt as an admisntrator

  .. code-block:: bash

     Press Windows+R to open the “Run” box.
     Type “cmd” into the box.
     press Ctrl+Shift+Enter to run the command as an administrator

* Run ipconfig on the windows machine to list available ethernet adapters and
  set a static private ip

  .. code-block:: bash

     # A sample output after executing ipconfig
     # notice interface "Ethernet" has an auto address assigned with no Default Gateway

     ipconfig

     Ethernet adapter Ethernet:

        Connection-specific DNS Suffix  . :
        Link-local IPv6 Address . . . . . : fe80::1d8d:ac40:ff9b:8d1%21
        Autoconfiguration IPv4 Address. . : 169.254.8.209
        Subnet Mask . . . . . . . . . . . : 255.255.0.0
        Default Gateway . . . . . . . . . :

     # Set static ip address
     netsh interface ip set address name="YOUR INTERFACE NAME" static "IP_ADDRESS" "SUBNET_MASK"

     # Example
     netsh interface ip set address name="Ethernet" static 10.0.0.1 255.255.255.0

* Ensure to boot the target board (VCK190) into Linux

* Set a private ip address for the target within the subnet of host machine and
  verify connectivity.

  .. code-block:: bash

     sudo ifconfig eth0 10.0.0.2 netmask 255.255.255.0

     # Perform a ping test to the host form the target
     ping -c 3 10.0.0.1

**Setting up a private network with target board and the host machine for Linux
users:**

* Make a direct connection between the Linux host machine and the target board
  using an ethernet cable

* Run ifconfig on the Linux machine to list available ethernet adapters and set
  a static private ip

  .. code-block:: bash

     # Example to set an ip 10.0.0.1 to ethernet interface enp2s0:
     sudo ifconfig enp2s0 10.0.0.1 netmask 255.255.255.0

* Ensure to boot the target board (VCK190) into Linux

* Set a private ip address for the target within the subnet of host machine and
  verify connectivity.

  .. code-block:: bash

     sudo ifconfig eth0 10.0.0.2 netmask 255.255.255.0

     # Perform a ping test to the host form the target
     ping -c 3 10.0.0.1

* To start Jupyter Notebook run

  .. code-block:: bash

    sudo systemctl start jupyter-setup
    sudo jupyter-lab list

Start the Notebook
^^^^^^^^^^^^^^^^^^

**Note:** This demo is tested with Chrome browser only.

* To connect to the jupyter-server and start the Notebook, copy the
  generated URL with token on the prompt of Versal target and paste
  it to the Chrome browser address bar of the laptop, for example:

  .. code-block:: bash

     http://192.168.1.77:8888/?token=06cfb958c61eb0581bb759f40e3a4c3a6252cef3b7075449

* If you have lost the URL, to look up the jupyter server IP address and token on the
  target, run:

  .. code-block:: bash

	sudo jupyter-lab  list

.. note::

   Filter 2D AIE accelerator is not available in this version of the design.
   It will be supported soon. So with notebooks nb6 and nb7 do not run
   Filter 2D AIE.

Run the Jupyter Notebooks
-------------------------

This TRD includes the following jupyter notebooks:

#. **base-trd-nb1.ipynb**: Demonstrates videoplayback of a file source in rootfs
   of the target to the Jupyter notebook using the GStreamer multimedia
   framework.

#. **base-trd-nb2.ipynb**: Demonstrates streaming video from a v4l2 device on
   the target to the Jupyter notebook using the GStreamer multimedia framework

#. **base-trd-nb3.ipynb**: Demonstrates streaming video from a v4l2 device on
   the target to a HDMI monitor using the GStreamer multimedia framework.

#. **base-trd-nb4.ipynb**: Demonstrates two simultaneous streaming pipelines,
   one from file source and another from a v4l2 device onto two individual
   planes of a HDMI monitor using the GStreamer multimedia framework.

#. **base-trd-nb5.ipynb**: Demonstrates streaming video from a Mulit-Camera FMC
   module on the target to a HDMI monitor using the GStreamer multimedia
   framework.

#. **base-trd-nb6.ipynb**: Demonstrates the 2D filter accelerator kernels, both
   the PL and the AIE versions, inserted into the video pipeline of notebook 2.

#. **base-trd-nb7.ipynb**: Demonstrates using both 2D filter accelerator kernels
   in a time-multiplexed fashion in a multi-branch pipeline.

#. **base-trd-nb8.ipynb**: Demonstrates streaming audio/video from a v4l2 device
   or a file to a HDMI monitor/speaker using the GStreamer multimedia framework.

**Note:** MIPI sources in the notebook is platform specific, User is allowed to
choose "mipi" in platform 1 and "mipi_quad" in platform 2 respectively,
otherwise an exception would be thrown.

To run the notebooks, follow the below steps:

#. On the left pane of the browser, 8 notebooks are available under the folder
   Base TRD.

#. Double click to open the notebook

#. Select 'Kernel' → 'Restart Kernel and Run All Cells' from the top menu bar to
   run the demo. For nb1, nb2 and nb6 scroll down to the end of the notebook to see
   the video output. For all other notebooks the video output is displayed on the
   monitor.


#. Click the rectangular icon to interrupt the kernel and stop the video stream.

#. Select 'Kernel' → 'Shutdown Kernel' → close the notebook tab and move to the
   next notebook.

   .. image:: ../images/jnbh.jpg
      :width: 1000px
      :alt: Jupyter_nb_home

**Note1:** Rerunning a TRD notebook may have spurious behavior, this is because software
commands are designed to run in order and may not behave as expected in iterative runs when
the kernel is not restarted. In practice, there are some command sequences that can be regressed,
but the safest thing is to restart the Jupyter Notebook kernel with 'kernel' → 'Interrupt kernel'
, followed by 'kernel' → 'Restart Kernel and Run All Cells' when rerunning a notebook.

**Note2:** Jupyter-setup is expected to be started with root privilages 'sudo systemctl start jupyter-setup'. If not started with root permission for the first atempt, then post install scripts will fail to execute and dot may throw an error creating a graph in png format. This can be resolved by executing 'dot -c' at the linux prompt .

,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
