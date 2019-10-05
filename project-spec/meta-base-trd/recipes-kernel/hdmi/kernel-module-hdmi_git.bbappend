FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_vck190-versal = " \
	git://gitenterprise.xilinx.com/ipssw/hdmi-modules.git;protocol=https;branch=2019.2_versal_vck190_dev \
	"
SRC_URI_vc-p-a2197-00-versal = " \
	git://gitenterprise.xilinx.com/ipssw/hdmi-modules.git;protocol=https;branch=2019.2_versal_dev \
	"
SRCREV = "${AUTOREV}"

COMPATIBLE_MACHINE_versal = "versal"
