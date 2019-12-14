SUMMARY = "Simple libapm application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRCBRANCH ?= "master"
SRCREV = "${AUTOREV}"
SRC_URI = "git://gitenterprise.xilinx.com/nayyala/libxapm.git;protocol=https;destsuffix=src/;branch=${SRCBRANCH}"
PACKAGE_ARCH = "${MACHINE_ARCH}"
TARGET_CC_ARCH += "${LDFLAGS}"
TARGET_CFLAGS += "-I${STAGING_DIR_TARGET}/${includedir}/python3.5m"
PROVIDES = "libxapm"

DEPENDS += "python3"
DEPENDS += "boost"

inherit setuptools3

S = "${WORKDIR}/src"

do_compile() {
    oe_runmake
}

do_install() {
	install -d ${D}${libdir}
	install -d ${D}${includedir}
	oe_libinstall -so libxapm ${D}${libdir}
	install -d -m 0655 ${D}${includedir}/libxapm
	install -m 0644 ${S}/inc/*.hpp ${D}${includedir}/libxapm/
}

FILES_${PN} = "${libdir}/*.a ${includedir}/*"
FILES_${PN}-dev = "${libdir}/*.a"
