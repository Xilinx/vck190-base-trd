DESCRIPTION = "Base TRD related Packages"

COMPATIBLE_MACHINE:versal = ".*"

inherit packagegroup

MOVIE_PACKAGES = " \
	bigbuckbunny-360p-vp9-webm \
	bigbuckbunny-480p-vp9-webm \
	"

BASE_TRD_PACKAGES = " \
	packagegroup-core-tools-debug \
	packagegroup-petalinux-display-debug \
	packagegroup-petalinux-gstreamer \
	packagegroup-petalinux-jupyter \
	packagegroup-petalinux-opencv \
	packagegroup-petalinux-python-modules \
	packagegroup-petalinux-self-hosted \
	packagegroup-petalinux-vitisai \
	packagegroup-petalinux-vvas \
	packagegroup-petalinux-v4lutils \
	alsa-utils \
	cmake \
	custom-edid \
	gstreamer1.0-python \
	kernel-module-hdmi \
	ldd \
	libxperfmon-python \
	ntp \
	python3-dev \
	python3-periphery \
	resize-part \
	tcf-agent \
	trd-dashboard \
	trd-files \
	tree \
	ttf-bitstream-vera \
	tzdata \
	xrt \
	${MOVIE_PACKAGES} \
	"

RDEPENDS:${PN} = "${BASE_TRD_PACKAGES}"
