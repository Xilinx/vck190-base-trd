#
# This is the trd-files recipe
#
#

SUMMARY = "TRD Files"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "\
	file://trd-autostart.sh \
	file://autostart.sh \
	file://mipi_dphy_workaround.sh \
	file://xocl.txt \
	"

S = "${WORKDIR}"

inherit update-rc.d

INITSCRIPT_NAME = "trd-autostart"
INITSCRIPT_PARAMS = "start 99 5 ."

do_install() {
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/trd-autostart.sh ${D}${sysconfdir}/init.d/trd-autostart

	install -d ${D}${sysconfdir}/trd
	install -m 0755 ${S}/autostart.sh ${D}${sysconfdir}/trd/

	install -d ${D}${sysconfdir}
	install -m 0644 ${S}/xocl.txt ${D}${sysconfdir}/
}

# Temporary hack for Versal platforms
do_install_append_versal() {
	install -d ${D}${sysconfdir}/trd
	install -m 0755 ${S}/mipi_dphy_workaround.sh ${D}${sysconfdir}/trd/
}

RDEPENDS_${PN}_append += "bash"
