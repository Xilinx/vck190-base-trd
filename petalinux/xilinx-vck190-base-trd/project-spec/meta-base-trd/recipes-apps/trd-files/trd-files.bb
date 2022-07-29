#
# This is the trd-files recipe
#
#

SUMMARY = "TRD Files"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
	file://trd-autostart.service \
	file://trd-autostart.sh \
	"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "trd-autostart.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${WORKDIR}/trd-autostart.sh ${D}${bindir}

	install -d ${D}${systemd_system_unitdir}
	install -m 0644 ${WORKDIR}/trd-autostart.service ${D}${systemd_system_unitdir}
}

FILES:${PN} += "${systemd_system_unitdir}"
