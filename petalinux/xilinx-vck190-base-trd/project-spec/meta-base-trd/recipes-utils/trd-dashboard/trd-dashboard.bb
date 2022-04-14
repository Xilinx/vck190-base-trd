SUMMARY = "TRD dashboard including dashboard and daemon"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f8fde4ef1244228cea4e84888b84c05c"

S = "${WORKDIR}"

SRC_URI = " \
	file://LICENSE \
	file://main.py \
	file://sensors_config.py \
	file://templates \
	file://trd-dashboard.service \
	file://trd-dashboard.sh \
	"

RDEPENDS:${PN} += " \
	bash \
	python3-bokeh \
	python3-hazelnut \
	python3-psutil \
	python3-pysensors \
	python3 \
	"

inherit python3-dir systemd

do_configure[noexec]="1"
do_compile[noexec]="1"

SYSTEMD_PACKAGES="${PN}"
SYSTEMD_SERVICE:${PN}="trd-dashboard.service"
SYSTEMD_AUTO_ENABLE:${PN}="enable"

do_install() {
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
	cp -r ${S}/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/
	cp -r ${S}/templates ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/

	install -d ${D}${bindir}
	install -m 0755 ${WORKDIR}/trd-dashboard.sh ${D}${bindir}/trd-dashboard.sh

	install -d ${D}${systemd_system_unitdir}
	install -m 0644 ${WORKDIR}/trd-dashboard.service ${D}${systemd_system_unitdir}
}

FILES:${PN} += "\
	${systemd_system_unitdir} \
	${PYTHON_SITEPACKAGES_DIR} \
	"
