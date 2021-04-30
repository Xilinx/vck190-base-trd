SRC_URI += "file://bsp.cfg \
            file://0001-linux-kernel-sound-audio-formatter.patch \
           "
KERNEL_FEATURES_append = " bsp.cfg"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
