DESCRIPTION = "Base TRD related Packages"

inherit packagegroup

APP_PACKAGES = " \
	gst-interpipes \
	gst-perf \
	gst-plugins-xlnx \
	gst-sdx \
	trd-files \
	"

PYTHON_PACKAGES = " \
	gstreamer1.0-python \
	nodejs \
	nodejs-npm \
	packagegroup-petalinux-python-modules \
	python3-dev \
	python3-ipywidgets \
	python3-jupyterlab \
	python3-matplotlib \
	python3-numpy \
	python3-pandas \
	python3-pillow \
	python3-psutil \
	python3-pydot \
	"

XRT_PACKAGES = " \
	opencl-clhpp-dev \
	opencl-headers-dev \
	xrt \
	xrt-dev \
	zocl \
	"

BASE_TRD_PACKAGES = " \
	packagegroup-core-tools-debug \
	packagegroup-petalinux-display-debug \
	packagegroup-petalinux-gstreamer \
	packagegroup-petalinux-opencv \
	packagegroup-petalinux-self-hosted \
	packagegroup-petalinux-v4lutils \
	git \
	jupyter-startup \
	kernel-module-hdmi \
	tcf-agent \
	${APP_PACKAGES} \
	${PYTHON_PACKAGES} \
	${XRT_PACKAGES} \
	"

BASE_TRD_PACKAGES_append_versal = " \
	ai-engine-driver \
	"

RDEPENDS_${PN} = "${BASE_TRD_PACKAGES}"
