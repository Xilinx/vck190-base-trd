DESCRIPTION = "Versal Base TRD related Packages"

inherit packagegroup

APP_PACKAGES = " \
	gst-interpipes \
	gst-plugins-xlnx \
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

RDEPENDS_${PN}_append += " \
	packagegroup-core-tools-debug \
	packagegroup-petalinux-display-debug \
	packagegroup-petalinux-gstreamer \
	packagegroup-petalinux-opencv \
	packagegroup-petalinux-self-hosted \
	packagegroup-petalinux-v4lutils \
	ai-engine-driver \
	dnf \
	git \
	kernel-module-hdmi \
	tcf-agent \
	${APP_PACKAGES} \
	${PYTHON_PACKAGES} \
	${XRT_PACKAGES} \
	"
