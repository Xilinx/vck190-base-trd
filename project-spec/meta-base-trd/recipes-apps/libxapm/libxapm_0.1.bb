#
# This is the libxapm recipe
#

SUMMARY = "AXI performance monitor library with python bindings"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7124841280fe439e1e022aaf7958a7f3"

SRCBRANCH ?= "master"
SRCREV = "${AUTOREV}"
SRC_URI = "git://gitenterprise.xilinx.com/nayyala/libxapm.git;protocol=https;branch=${SRCBRANCH}"

TARGET_CC_ARCH += "${LDFLAGS}"
TARGET_CFLAGS += "-I${STAGING_DIR_TARGET}/${includedir}/python3.5m -I${s}/inc"

DEPENDS += " \
	boost \
	python3 \
	"

inherit python3-dir

S = "${WORKDIR}/git"

do_install() {
	install -d ${D}${includedir}
	install -d -m 0655 ${D}${includedir}/libxapm
	install -m 0644 ${S}/inc/*.hpp ${D}${includedir}/libxapm/

	install -d ${D}${libdir}
	oe_libinstall -so libxapm ${D}${libdir}

	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
	install -m 755 libxapm.so.1.0.1 ${D}${PYTHON_SITEPACKAGES_DIR}/libxapm.so
}

PACKAGES =+ "${PN}-python"
FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
