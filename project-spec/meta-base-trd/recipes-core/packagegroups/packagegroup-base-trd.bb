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
	packagegroup-petalinux-opencv \
	packagegroup-petalinux-python-modules \
	packagegroup-petalinux-self-hosted \
	packagegroup-petalinux-v4lutils \
	packagegroup-petalinux-xrt \
	packagegroup-python3-jupyter \
	alsa-utils \
	base-trd-notebooks \
	e2fsprogs-resize2fs \
	git \
	gst-sdx \
	gstreamer1.0-python \
	jupyter-startup \
	kernel-module-hdmi \
	ldd \
	libxapm-python \
	mediasrcbin \
	nodejs \
	nodejs-npm \
	ntp \
	parted \
	python3-dev \
	python3-periphery \
	tcf-agent \
	trd-files \
	tree \
	ttf-bitstream-vera \
	tzdata \
	${MOVIE_PACKAGES} \
	"

RDEPENDS_${PN} = "${BASE_TRD_PACKAGES}"
