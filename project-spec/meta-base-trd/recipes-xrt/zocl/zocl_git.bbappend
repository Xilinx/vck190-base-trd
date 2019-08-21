SRC_URI = "\
    git://github.com/Xilinx/XRT.git;protocol=https;branch=2019.1 \
    file://0001-xrt-enable-scheduler-debug.patch \
    "

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git/src/runtime_src/driver/zynq/drm/zocl"
