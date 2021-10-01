# Use latest version
BRANCH= "2021.2"
SRCREV= "0fedb0d6730445888d247e7053e557a3a1f23fbe"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
            file://0001-patch-to-enable-64-bit-addressing-on-zocl-dma.patch \
           "
