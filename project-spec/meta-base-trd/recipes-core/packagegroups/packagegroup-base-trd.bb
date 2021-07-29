DESCRIPTION = "Base TRD related Packages"

COMPATIBLE_MACHINE_versal = ".*"

inherit packagegroup

MOVIE_PACKAGES = " \
	bigbuckbunny-360p-vp9-webm \
	bigbuckbunny-480p-vp9-webm \
	"

BASE_TRD_PACKAGES = " \
	packagegroup-core-tools-debug \
	packagegroup-petalinux-display-debug \
	packagegroup-petalinux-gstreamer \
	packagegroup-petalinux-ivas \
	packagegroup-petalinux-jupyter \
	packagegroup-petalinux-opencv \
	packagegroup-petalinux-python-modules \
	packagegroup-petalinux-self-hosted \
	packagegroup-petalinux-vitisai \
	packagegroup-petalinux-v4lutils \
	alsa-utils \
	base-trd \
	cmake \
	custom-edid \
	git \
	gstreamer1.0-python \
	kernel-module-hdmi \
	ldd \
	libxapm-python \
	nodejs \
	nodejs-npm \
	ntp \
	python3-dev \
	python3-periphery \
	resize-part \
	tcf-agent \
	trd-files \
	tree \
	ttf-bitstream-vera \
	tzdata \
	xrt \
	${MOVIE_PACKAGES} \
	"

RDEPENDS_${PN} = "${BASE_TRD_PACKAGES}"
