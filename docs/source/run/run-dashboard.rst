Run the Base TRD Dashboard
==========================

The Base TRD dashboard is implemented using the python bokeh framework and
visualizes the following useful platform statistics:

* CPU utilization

* Memory usage

* Temperature using the versal-sysmon device through the ``hwmon`` interface

* Power and voltage using the ina226 power monitors through the ``hwmon`` interface

* Memory throughput using the AXI performance monitors (APM) in the PL

The dashboard is intended to be run in parallel with any of the accelerated
applications and is useful to monitor, evaluate and debug system performance
while the target application is running live. A network connection is required
to run the bokeh server.

Connect to the Bokeh Server
---------------------------

Follow these steps to boot the board into Linux

* Ensure all steps under the section :ref:`Board Setup` are verified.

* Insert the prepared micro SD card into the Versal SD card slot (refer to the
  image in :ref:`Board Setup`)

* Have the UART0 terminal emulator tab connected.

* Turn ON power switch SW13.

* On Versal UART0 terminal, you would see the Versal device booting from the
  micro SD card, starting with the message
  "Xilinx Versal Platform Loader and Manager"

* In about 60 seconds boot is complete. Observe the Linux prompt
  *root@xilinx-vck190-2021_1* and autostart of the bokeh server that serves the
  Base TRD dashboard application as seen in the example below:

  .. code-block:: bash

   Versal Base TRD dashboard initialization
   Starting bokeh
   waiting for IP address..waiting for path.
   start-stop-daemon -S -m -p /var/run/bokeh.pid -x bokeh --  serve --show --allow-websocket-origin=192.168.1.133:5006 /usr/lib/python3.8/site-packages/trd-dashboard/
   Versal Base TRD dashboard will be running at http://192.168.1.133:5006/trd-dashboard
    
.. note::

   If you do not see the above messages or a TIMEOUT error instead, then double
   check your network connection. If DHCP is not available and auto-assigment
   of an IP address times out, you can use a private network and start the bokeh
   server as follows.

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

     ifconfig eth0 10.0.0.2 netmask 255.255.255.0

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

     ifconfig eth0 10.0.0.2 netmask 255.255.255.0

     # Perform a ping test to the host form the target
     ping -c 3 10.0.0.1

* To start the bokeh server run

  .. code-block:: bash

     /etc/init.d/trd-dashboard-init restart

Start the Dashboard
-------------------

**Note:** This dashboard is tested with the Chrome browser only and optimized
for a display resolution of 1920x1080.

* To connect to the bokeh server and to start the dashboard, copy the URL
  printed on the serial console and paste it into the Chrome browser address
  bar, for example:

  .. code-block:: bash

   http://192.168.1.133:5006/trd-dashboard

* The dashboard will be rendered in your browser and should look as follows

  .. image:: ../images/dashboard.jpg
     :width: 1500px
     :alt: Base TRD Dashboard

,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
