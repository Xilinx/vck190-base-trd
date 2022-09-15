FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
KERNEL_FEATURES:append = " bsp.cfg"

SRC_URI += " \
	file://0001-i2c-free_clk.patch \
	file://0003-drm-xlnx_mixer-Dont-enable-primary-plane-by-default.patch \
	file://bsp.cfg \
	file://0001-media-xilinx-Add-isppipeline-driver.patch \
	file://0002-media-xilinx-Add-hdr-extract-driver.patch \
	file://0003-dt-binding-for-hdr-extract-driver.patch \
	file://0004-media-xilinx-Add-hdr-merge-driver.patch \
	file://0005-dt-binding-for-hdr-merge-driver.patch \
	file://0006-imx274-update-for-HDR-mode.patch \
	file://0001-arm-zynq-Add-MAX20087-driver.patch \
	file://0002-max20087-Remove-unused-members.patch \
	file://0001-add-mars-driver-to-makefile.patch \
	file://0007-media-i2c-Add-MARS-driver.patch \
	file://0008-media-i2c-max9286-add-support-for-port-regulators.patch \
	file://0009-max9286-WIP-modifications-for-mars-module.patch \
	file://0010-max9286-WIP-fix-endpoint-fwnode.patch \
	file://0011-max9286-WIP-modify-resolution.patch \
	file://0012-xilinx-vipp-WIP-blacklist-mars-module.patch \
	file://0001-media-i2c-max96705-fix-color-issue-due-to-bad-frame-.patch \
"
