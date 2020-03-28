DESCRIPTION = "Base TRD related Packages"

inherit packagegroup

MOVIE_PACKAGES = " \
	bigbuckbunny-360p-vp9-webm \
	bigbuckbunny-480p-vp9-webm \
	"

BASE_TRD_PACKAGES = " \
	packagegroup-core-tools-debug \
	packagegroup-petalinux-display-debug \
	packagegroup-petalinux-gstreamer \
	packagegroup-petalinux-python-modules \
	packagegroup-petalinux-v4lutils \
	packagegroup-petalinux-xrt \
	packagegroup-python3-jupyter \
	base-trd-notebooks \
	e2fsprogs-resize2fs \
	git \
	gst-plugins-xlnx \
	gst-sdx \
	gstreamer1.0-python \
	jupyter-startup \
	kernel-module-hdmi \
	libopencv-imgcodecs3.4 \
	libxapm-python \
	nodejs \
	nodejs-npm \
	ntp \
	parted \
	python3-dev \
	python3-periphery \
	tcf-agent \
	trd-files \
	tree \
	tzdata \
	${MOVIE_PACKAGES} \
	"

BASE_TRD_PACKAGES_append_versal = " \
	ai-engine-driver \
	"

RDEPENDS_${PN} = "${BASE_TRD_PACKAGES}"
