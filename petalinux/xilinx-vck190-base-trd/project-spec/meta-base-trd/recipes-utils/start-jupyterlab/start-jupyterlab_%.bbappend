FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-recipes-utils-Add-jupyter-server-config-file.patch"

do_install:append() {
     install -d ${D}${datadir}/notebooks
     install -d ${D}${sysconfdir}/jupyter/
     install -m 0644 ${WORKDIR}/jupyter_server_config.py ${D}${sysconfdir}/jupyter
}

FILES:${PN} += "${datadir}/notebooks"
