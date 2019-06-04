SUMMARY = "Gstreamer Perf 0.2.1"
DESCRIPTION = "GStreamer element to measure framerate, bitrate and CPU usage"
SECTION = "multimedia"
LICENSE = "LGPLv3+"

LIC_FILES_CHKSUM = "file://plugins/gstperf.c;beginline=1;endline=16;md5=b2756c8f4284266d8f8318cc6823bd42"

DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"

SRCBRANCH ?= "master"
SRCREV = "1ab3705b072178013c0d3627d2a84d7c2d58e664"
SRC_URI = "git://github.com/RidgeRun/gst-perf.git;protocol=https;branch=${SRCBRANCH}"

S = "${WORKDIR}/git"

FILES_${PN} += "${libdir}/gstreamer-1.0/libgstperf.so "

inherit autotools pkgconfig
