SUMMARY = "TRD dashboard including dashboard and daemon"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f8fde4ef1244228cea4e84888b84c05c"

S = "${WORKDIR}"

SRC_URI = " \
	file://LICENSE \
	file://main.py \
	file://sensors_config.py \
	file://templates \
	file://trd-dashboard-init \
	"

RDEPENDS_${PN} += " \
	python3-bokeh \
	python3-hazelnut \
	python3-psutil \
	python3-pysensors \
	python3 \
	"

inherit python3-dir update-rc.d

do_configure[noexec]="1"
do_compile[noexec]="1"

INITSCRIPT_NAME = "trd-dashboard-init"
INITSCRIPT_PARAMS = "start 98 3 5 . stop 20 0 1 2 6 ."

do_install() {
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
	cp -r ${S}/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/
	cp -r ${S}/templates ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/

	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/trd-dashboard-init ${D}${sysconfdir}/init.d/trd-dashboard-init
}

FILES_${PN} += "\
	${sysconfdir} \
	${PYTHON_SITEPACKAGES_DIR} \
	"