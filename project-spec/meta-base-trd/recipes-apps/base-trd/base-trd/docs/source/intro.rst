Introduction
============

The Versal Base TRD consists of a series of design shells and jupyter notebooks
to demonstrate various aspects o fthe design. A design shell is a Vivado design
with a pre-instantiated set of I/O interfaces and a corresponding PetaLinux BSP
and image that includes the required kernel drivers and user-space libraries to
exercise those interfaces.

Design Shells
-------------

The following is a list of supported design shells including key I/O interfaces:

* Shell 1:

  * Sources:

    * USB webcam capture pipeline

    * File source

  * Sinks:

    * HDMI Tx + video mixer display pipeline

    * Application sink into jupyter notebook display


**TODO:**

* Add system block diagram
  

Software Stack
--------------

The main software framworks used in this reference design are:

* Jupyter notebooks for top-level application control and visualization

* GStreamer multimedia framework and plugins for video pipeline creation

* V4L2 kernel subsystem and drivers for video capture devices

* DRM/KMS kernel subsystem and drivers for display devices

* Xilinx Runtime (XRT) and zocl driver for accelerator kernels

**TODO:**

* Add software stack diagram
