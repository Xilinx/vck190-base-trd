SUMMARY = "Smart mipicam application"
DESCRIPTION = "Application for runing single/quad mipi sensor with Vitis AI/IVAS"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = " \
    file://cmake \
    file://config \
    file://models \
    file://src \
    file://CMakeLists.txt \
    file://LICENSE \
    "

S = "${WORKDIR}"

DEPENDS = " glog ivas-accel-libs opencv"

RDEPENDS_${PN} += " \
	gst-perf \
	gstreamer1.0-plugins-bad-kms \
	gstreamer1.0-plugins-bad-mediasrcbin \
	gstreamer1.0-plugins-bad-videoparsersbad \
	gstreamer1.0-plugins-good-multifile \
	gstreamer1.0-plugins-good-video4linux2 \
	ivas-accel-libs \
	libdrm-tests \
	v4l-utils \
	alsa-utils \
	"

inherit cmake

EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release"

FILES_${PN} += " \
    ${datadir} \
    "
