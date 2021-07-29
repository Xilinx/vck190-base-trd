SUMMARY = "IVAS accel sw libs"
DESCRIPTION = "IVAS accelerator libraries"
SECTION = "multimedia"
LICENSE = "Apache-2.0"

include ivas.inc

DEPENDS = "glib-2.0 glib-2.0-native xrt libcap libxml2 bison-native flex-native jansson ivas-utils ivas-gst opencv vitis-ai-library vart"

inherit meson pkgconfig gettext

LIC_FILES_CHKSUM = "file://../LICENSE;md5=e6d9577dd6743c14fb3056b97887d4a4"

S = "${WORKDIR}/git/ivas-accel-sw-libs"

GIR_MESON_ENABLE_FLAG = "enabled"
GIR_MESON_DISABLE_FLAG = "disabled"

FILES_${PN} += "${libdir}/ivas/*.so ${libdir}/*.so"
FILES_${PN}-dev = "${includedir}"
