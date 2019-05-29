SUMMARY = "Gstreamer Interpipes 1.0.4"
DESCRIPTION = "GStreamer plug-in that allows communication between two independent pipelines"
HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstInterpipe"
SECTION = "multimedia"
LICENSE = "LGPL2.1"

LIC_FILES_CHKSUM = "file://COPYING;md5=3191ae9476980e87e3494d2d8ebe4584"

DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"

SRCBRANCH ?= "master"
SRCREV = "9af5b40d106f35ce75f8baa5efc8c59fc5f7eda1"
SRC_URI = "git://github.com/RidgeRun/gst-interpipe.git;protocol=https;branch=${SRCBRANCH}"

S = "${WORKDIR}/git"

FILES_${PN} += "${libdir}/gstreamer-1.0/libgstinterpipe.so "

inherit autotools pkgconfig gettext

do_configure() {
${S}/autogen.sh --noconfigure

oe_runconf
}
