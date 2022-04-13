SUMMARY = "Python bindings to libsensors (via ctypes)"
LICENSE = "LGPLv2+"
LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=941237435011992c09eed6cf8a289686"

SRC_URI[sha256sum] = "beb0def410d29ee46fe196a7811124772abf84cbe3a0d8b01d80b81fba31dae5"

inherit pypi setuptools3

PYPI_PACKAGE = "PySensors"

RDEPENDS:${PN} += "lmsensors"
