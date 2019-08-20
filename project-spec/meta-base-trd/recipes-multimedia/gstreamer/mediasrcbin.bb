#
# This file is the mediasrcbin recipe.
#

SUMMARY = "mediasrcbin GStreamer plugin"
SECTION = "libs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2664d92662c8911dfc45938dc8c4165d"

DEPENDS += " \
	glib-2.0 \
	gstreamer1.0 \
	gstreamer1.0-plugins-base \
	media-ctl \
	"

SRC_URI = "file://mediasrcbin"
S = "${WORKDIR}"

inherit pkgconfig cmake

FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
