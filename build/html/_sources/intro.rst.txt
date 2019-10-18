Introduction
============

The Versal Base TRD consists of a series of design shells and jupyter notebooks
to demonstrate various aspects of the design. A design shell is a Vivado design
with a pre-instantiated set of I/O interfaces and a corresponding PetaLinux BSP
and image that includes the required kernel drivers and user-space libraries to
exercise those interfaces. The reference design currently supports the VCK190
evaluation board.

Design Shells
-------------

The following is a list of supported design shells including key I/O interfaces:

* Shell 1:

  * Sources:

    * USB webcam capture pipeline

    * File source

  * Processing:

    * VP9 decode and demux

  * Sinks:

    * HDMI Tx + video mixer display pipeline

    * Application sink into jupyter notebook display

.. image:: images/system-bd.jpg
    :width: 1000px
    :align: center
    :alt: System Design Block Diagram

Software Stack
--------------

The main software frameworks used in this reference design are:

* Jupyter notebooks for top-level application control and visualization

* GStreamer multimedia framework and plugins for video pipeline creation

* V4L2 kernel subsystem and drivers for video capture devices

* DRM/KMS kernel subsystem and drivers for display devices

.. image:: images/sw-stack.jpg
    :width: 550px
    :align: center
    :alt: Software Stack Overview

Design File Hierarchy
---------------------

The reference design zip file can be downloaded from
https://www.xilinx.com/member/forms/download/xef.html?filename=vck190_base_trd_shell1_2019.2_v0.1.zip

It has the following contents:

* Documentation (html webpages)

* Petalinux Board Support Package (BSP)

* Pre-built SD card image

* Vivado hardware design project

* README file

* Design sources zip file

* Licenses zip file

The design file hierarchy is shown below::

 vck190_base_trd_shell1_2019.2_v0.1
 ├── docs
 │   ├── doctrees
 │   ├── html
 │   └── index.html
 ├── licenses.zip
 ├── petalinux
 │   └── xilinx-vck190-qspi-base-trd-2019.2-v0.1.bsp
 ├── README.txt
 ├── sdcard
 │   └── sdcard.img.zip
 ├── sources.zip
 └── vivado
     ├── scripts
     └── xdc

Licenses
--------

The design includes files licensed by Xilinx and third parties under the terms
of the GNU General Public License, GNU Lesser General Public License,
BSD License, MIT License, and other licenses. The design directory includes one
zip file named ``sources.zip`` containing the complete set of design source
files and one zip file named ``licenses.zip`` containing licenses extracted from
the design source files. You are solely responsible for checking any files you
use for notices and licenses and for complying with any terms applicable to your
use of the design and any third party files supplied with the design.

