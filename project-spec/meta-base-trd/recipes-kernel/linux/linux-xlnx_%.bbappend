FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
KERNEL_FEATURES_append = " bsp.cfg"

SRC_URI += " \
	file://0001-i2c-free_clk.patch \
	file://0003-drm-xlnx_mixer-Dont-enable-primary-plane-by-default.patch \
	file://bsp.cfg \
"
