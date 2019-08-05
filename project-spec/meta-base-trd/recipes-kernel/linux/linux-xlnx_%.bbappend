FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0030-add-max20087-driver-2018-3.patch\
	file://0031-add-avt-multi-sensor-fmc-driver-2018-3.patch\
	file://0033-csi2rxss-disable-line-buffer-full-int.patch\
"
