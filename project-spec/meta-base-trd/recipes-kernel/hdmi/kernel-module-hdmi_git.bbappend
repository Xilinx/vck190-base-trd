FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a8919bcf39aab0a98595874be20e842"
SRC_URI_vck190-versal = " \
	git://gitenterprise.xilinx.com/ipssw/hdmi-modules.git;protocol=https;branch=2019.2_versal_vck190_dev \
	"
SRC_URI_vc-p-a2197-00-versal = " \
	git://gitenterprise.xilinx.com/ipssw/hdmi-modules.git;protocol=https;branch=2019.2_versal_dev \
	"
SRCREV = "${AUTOREV}"

COMPATIBLE_MACHINE_versal = "versal"
