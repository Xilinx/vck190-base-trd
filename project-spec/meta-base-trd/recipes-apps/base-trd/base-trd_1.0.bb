#
# This is the base-trd recipe
#
#

SUMMARY = "Base TRD Jupyter notebooks"
SECTION = "PETALINUX/apps"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f9990fcc34ccf1f82ccf1bc5a1cc3bfc"

S = "${WORKDIR}"

SRC_URI = " \
	file://cmake \
	file://ivas-accel-sw-libs \
	file://notebooks \
	file://CMakeLists.txt \
	file://LICENSE \
	"

inherit cmake

DEPENDS += " \
	ivas-utils \
	jansson \
	opencv \
	"

RDEPENDS_${PN} += " \
	gstreamer1.0-plugins-bad \
	gstreamer1.0-plugins-good \
	gstreamer1.0-python \
	ivas-accel-libs \
	ivas-gst \
	python3-notebook \
	python3-opencv \
	python3-pydot \
	"

FILES_${PN} += " \
	${libdir} \
	${datadir} \
	"
