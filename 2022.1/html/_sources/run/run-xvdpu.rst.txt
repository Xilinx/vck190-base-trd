Run XVDPU application
======================

The smart-mipi-app application is targeted to run with Single-MIPI(Leopard IMX274 MIPI) or
Quad-MIPI(Avnet Multi-Camera MIPI) sensor as input source, and HDMI as output sink. The
application supports 4 models - yolov3, refinedet, densebox, ssd.

Use SD card images for Platform 1 - *vck190_mipiRxSingle_hdmiTx* or
Platform 2 - *vck190_mipiRxQuad_hdmiTx* based on the input source.

Follow these steps to boot the board into Linux. These steps can be skipped
if you are already at the Linux prompt *xilinx-vck190-20221*

* Ensure all steps under the section :ref:`Board Setup<Board Setup>` are
  verified. Make connections based on the input source and output sink
  selected.

* Insert the prepared micro SD card into the Versal SD card slot (refer to the
  image in :ref:`Board Setup<Board Setup>`)

* Have the UART0 terminal emulator tab connected.

* Turn ON power switch SW13.

* On Versal UART0 terminal, you would see the Versal device booting from the
  micro SD card starting with the message
  "Xilinx Versal Platform Loader and Manager"

* In about 60 seconds boot is complete. Observe the Linux prompt
  *xilinx-vck190-20221* and finish logging in.

* Use command line options provided below to run the smart-mipi-app application

Examples for quad-mipi sensor
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

* Run 4 channel mipi camera with 3840x2160 resolution monitor

  .. code-block:: bash

     sudo smart-mipi-app

* Run 4 channel mipi camera with 1920x1080 resolution monitor

  .. code-block:: bash

     sudo smart-mipi-app -W 1920 -H 1080

* Run 4 channel mipi camera with specified AI model

  .. code-block:: bash

     sudo smart-mipi-app --t1=yolov3 --t2=refinedet --t3=facedetect --t4=ssd

* Run 4 channel mipi camera with specified media device, the default is "/dev/media1"

  .. code-block:: bash

     sudo smart-mipi-app -m 2

Examples for single-mipi sensor
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

* Run 1 channel mipi camera with 3840x2160 resolution monitor

  .. code-block:: bash

     sudo smart-mipi-app -s

* Run 1 channel mipi camera with 1920x1080 resolution monitor

  .. code-block:: bash

     sudo smart-mipi-app -s -W 1920 -H 1080

* Run 1 channel mipi camera with specified AI model

  .. code-block:: bash

     sudo smart-mipi-app -s -t yolov3

* Run 1 channel mipi camera with specified media device, the default is "/dev/media1"

  .. code-block:: bash

     sudo smart-mipi-app -s -m 2

**Note:** Currently, Only **yolov3, facedetect, refinedet, ssd** models are supported by this application.

Command Options:
>>>>>>>>>>>>>>>>

* The examples show the capability of the smart-mipi-app for specific configurations. User can get more and detailed
  application options as following by invoking

.. code-block:: bash

   smart-mipi-app -h

.. code-block:: bash

      Usage:
      smart-mipi-app [OPTION?] - Application for detction on VCK190 board of Xilinx.

      Examples for 4 mipi camera:
      smart-mipi-app
               # Run 4 channel mipi camera with 3840x2160 resolution monitor.
      smart-mipi-app -W 1920 -H 1080
               # Change to 1920x1080 resolution monitor.
      smart-mipi-app --t1=yolov3 --t2=refinedet --t3=facedetect --t4=ssd
               # Change ai task for each channel
      smart-mipi-app -m 2
               # Change mipi camera device to /dev/media2.

      Examples for single mipi camera:
      smart-mipi-app -s
               # Run single channel mipi camera with 3840x2160 resolution monitor.
      smart-mipi-app -s -W 1920 -H 1080
               # Change to 1920x1080 resolution monitor.
      smart-mipi-app -s -t ssd
               # Change ai task from yolov3 to ssd
      smart-mipi-app -s -m 2
               # Change mipi camera device to /dev/media2.

      Help Options:
      -h, --help                                Show help options
      --help-all                                Show all help options
      --help-gst                                Show GStreamer Options

      Application Options:
      -v, --verbose                             print gstreamer pipeline
      -s, --single                              only process one channel video and display fullscreen
      -W, --width=WIDTH                         resolution width of the input: [1920 | 3840], default: 3840
      -H, --height=HEIGHT                       resolution height of the input: [1080 | 2160], default: 2160
      -t, --task=TASK                           select AI task to be run: [yolov3 | facedetect | refinedet | ssd], default: yolov3, work only when single is true
      --t1=TASK                                 select AI task to be run for channel 1, default: refinedet
      --t2=TASK                                 select AI task to be run for channel 2, default: facedetect
      --t3=TASK                                 select AI task to be run for channel 3, default: ssd
      --t4=TASK                                 select AI task to be run for channel 4, default: yolov3
      -m, --media-device=NUM                    num of media-device, default: 1
      -n, --channel-num=NUM                     channel numbers of video: [1 | 2 | 3 | 4], work only when single is false
      -x, --xclbin-location=XCLBIN-LOCATION     set path of xclbin
      -c, --config-dir=CONFIG-DIR               set config path of gstreamer plugin
      -p, --performace                          print performance

Files structure of the application
----------------------------------

The application is installed as:

* Binary File Directory: /usr/bin

  .. code-block:: bash

     /usr/bin/smart-mipi-app

* Configuration file directory: /usr/share/vvas/smart-mipi-app

  .. code-block:: bash

      |-- facedetect
      |   |-- aiinference.json
      |   |-- drawresult.json
      |   `-- preprocess.json
      |-- refinedet
      |   |-- aiinference.json
      |   |-- drawresult.json
      |   `-- preprocess.json
      |-- ssd
      |   |-- aiinference.json
      |   |-- drawresult.json
      |   |-- label.json
      |   `-- preprocess.json
      `-- yolov3
          |-- aiinference.json
          `-- drawresult.json

* Model file directory: /usr/share/vitis_ai_library/models

  .. code-block:: bash

      |-- densebox_640_360
      |   |-- densebox_640_360.prototxt
      |   |-- densebox_640_360.xmodel
      |   `-- md5sum.txt
      |-- refinedet_pruned_0_96
      |   |-- md5sum.txt
      |   |-- refinedet_pruned_0_96.prototxt
      |   `-- refinedet_pruned_0_96.xmodel
      |-- ssd_adas_pruned_0_95
      |   |-- label.json
      |   |-- md5sum.txt
      |   |-- ssd_adas_pruned_0_95.prototxt
      |   `-- ssd_adas_pruned_0_95.xmodel
      `-- yolov3_voc_tf
         |-- label.json
         |-- md5sum.txt
         |-- yolov3_voc_tf.prototxt
         `-- yolov3_voc_tf.xmodel

,,,,,

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0


Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.
