FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
KERNEL_FEATURES_append = " bsp.cfg"

SRC_URI += " \
	file://0001-i2c-free_clk.patch \
	file://0003-drm-xlnx_mixer-Dont-enable-primary-plane-by-default.patch \
	file://bsp.cfg \
	file://0001-arm-zynq-Add-MAX20087-driver.patch \
	file://0002-max20087-Remove-unused-members.patch \
	file://0003-media-max9271-Fix-GPIO-enable-disable.patch \
	file://0004-media-i2c-max9286-fix-access-to-unallocated-memory.patch \
	file://0005-media-i2c-max9286-Break-out-reverse-channel-setup.patch \
	file://0006-media-i2c-max9286-Make-channel-amplitude-programmabl.patch \
	file://0007-media-i2c-max9286-Configure-reverse-channel-amplitud.patch \
	file://0008-media-i2c-Add-driver-for-RDACM21-camera-module.patch \
	file://0009-media-i2c-Kconfig-Make-MAX9271-a-module.patch \
	file://0010-media-i2c-max9271-Add-MODULE_-macros.patch \
	file://0011-media-i2c-Add-driver-for-Mars-camera-module.patch \
	file://0012-media-i2c-max9286-WIP-for-mars-compatibility.patch \
	file://0013-media-i2c-max9271-WIP-for-mars-compatibility.patch \
	file://0014-xilinx-vipp-debug-blacklist.patch \
	file://0016-media-i2c-mars-add-v4l-ctrls.patch \
	file://0017-media-i2c-mars-modify-resolution.patch \
	file://0018-media-i2c-max9286-modify-resolution.patch \
"
