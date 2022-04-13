FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://vck190.conf"

do_install:append:vck190() {
    # Install vck190 libsensors configuration file
    install -d ${D}${sysconfdir}/sensors.d
    install -m 0644 ${WORKDIR}/vck190.conf ${D}${sysconfdir}/sensors.d
}

FILES:${PN}-libsensors:vck190 += "${sysconfdir}/sensors.d/vck190.conf"
