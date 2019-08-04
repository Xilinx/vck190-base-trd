FILESEXTRAPATHS_prepend := "${THISDIR}/gstreamer1.0-plugins-bad:"

SRC_URI_append = " \
	file://0001-xlnxvideoscale-Add-support-for-RGBx-format.patch \
"
