FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0030-add-max20087-driver-2018-3.patch \
	file://0031-add-avt-multi-sensor-fmc-driver-2018-3-1080p30-720p60.patch \
	file://0007-max9286-serdes-Fix-source-pad-media-format.patch \
	file://0006-ar0231-Fix-the-media-bus-format-to-GRBG.patch \
	file://0003-arm-zynq-Disable-line-buffer-full-interrupt.patch \
"
