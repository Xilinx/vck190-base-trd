FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = " \
	git://github.com/Xilinx/XRT.git;protocol=https;branch=2019.1 \
	file://0001-allow-user-map-dma-buf-1623.patch \
	"

SRCREV = "${AUTOREV}"

LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=fa343562af4b9b922b8d7fe7b0b6d000 \
                    file://runtime_src/driver/xclng/drm/xocl/LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    file://runtime_src/driver/xclng/xrt/user_gem/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://runtime_src/driver/xclng/tools/xbutil/LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
