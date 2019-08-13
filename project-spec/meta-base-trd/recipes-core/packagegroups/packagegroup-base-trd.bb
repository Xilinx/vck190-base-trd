DESCRIPTION = "Base TRD related Packages"

inherit packagegroup

APP_PACKAGES = " \
	base-trd-notebooks \
	gst-plugins-xlnx \
	gst-sdx \
	trd-files \
	"

MOVIE_PACKAGES = " \
	bigbuckbunny-360p-vp9-webm \
	bigbuckbunny-480p-vp9-webm \
	"

PYTHON_PACKAGES = " \
	gstreamer1.0-python \
	nodejs \
	nodejs-npm \
	python3-dev \
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
	packagegroup-petalinux-jupyter \
	packagegroup-petalinux-opencv \
	packagegroup-petalinux-self-hosted \
	packagegroup-petalinux-v4lutils \
	haveged \
	git \
	jupyter-startup \
	kernel-module-hdmi \
	tcf-agent \
	${APP_PACKAGES} \
	${MOVIE_PACKAGES} \
	${PYTHON_PACKAGES} \
	${XRT_PACKAGES} \
	"

BASE_TRD_PACKAGES_append_versal = " \
	ai-engine-driver \
	"

RDEPENDS_${PN} = "${BASE_TRD_PACKAGES}"
