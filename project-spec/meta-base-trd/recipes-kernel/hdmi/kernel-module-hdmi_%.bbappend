FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f230abc77d436836711a1271433a8919"
SRC_URI = " \
	file://Documentation \
	file://hdmi \
	file://Kbuild \
	file://LICENSE.md \
	file://Makefile \
	file://misc \
	"

S = "${WORKDIR}"

COMPATIBLE_MACHINE_versal = "versal"
