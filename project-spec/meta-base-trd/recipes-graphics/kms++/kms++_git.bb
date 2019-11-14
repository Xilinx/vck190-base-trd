#
# This is the kms++ recipe
#

SUMMARY = "C++ library for kernel mode setting"
HOMEPAGE = "https://github.com/tomba/kmsxx"
LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"

PV = "2.1"
PR = "r0"

BRANCH = "master"
SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
SRCREV = "626edbe2fc845803ffdd25936e21202e4f123b63"

DEPENDS = "drm python3-pybind11"

PACKAGES =+ "${PN}-python"

RDEPENDS_${PN}-python += "python3-core"

FILES_${PN}-python += "${libdir}/python*/site-packages"

S = "${WORKDIR}/git"

inherit python3native cmake update-alternatives

ALTERNATIVE_PRIORITY = "100"
ALTERNATIVE_${PN} = "kmstest"
ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
