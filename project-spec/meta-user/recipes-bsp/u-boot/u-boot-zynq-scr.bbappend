FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://boot.cmd.default.initrd \
	file://boot.cmd.default"

BOOTMODE = "default"
BOOTFILE_EXT = ".initrd"

RAMDISK_IMAGE_zynq = "rootfs.cpio.gz.u-boot"
RAMDISK_IMAGE_zynqmp = "rootfs.cpio.gz.u-boot"
RAMDISK_IMAGE_versal = "rootfs.cpio.gz.u-boot"

KERNEL_IMAGE_zynq = "uImage"
KERNEL_IMAGE_zynqmp = "Image"
KERNEL_IMAGE_versal = "Image"

KERNEL_BOOTCMD_zynq = "bootm"
KERNEL_BOOTCMD_zynqmp = "booti"
KERNEL_BOOTCMD_versal = "booti"

DEVICETREE_ADDRESS_zynq = "0x100000"
DEVICETREE_ADDRESS_zynqmp = "0x100000"
DEVICETREE_ADDRESS_versal = "0x1000"

KERNEL_LOAD_ADDRESS_zynq = "0x200000"
KERNEL_LOAD_ADDRESS_zynqmp = "0x200000"
KERNEL_LOAD_ADDRESS_versal = "0x80000"

RAMDISK_IMAGE_ADDRESS_zynq = "0x4000000"
RAMDISK_IMAGE_ADDRESS_zynqmp = "0x4000000"
RAMDISK_IMAGE_ADDRESS_versal = "0x4000000"

## Below offsets and sizes are based on 32MB QSPI Memory for zynq
## For zynq
## Load boot.scr at 0xFC0000 -> 15MB of QSPI Memory
QSPI_KERNEL_OFFSET_zynq = "0x1000000"
QSPI_DEVICETREE_OFFSET_zynq = "0x1500000"
QSPI_RAMDISK_OFFSET_zynq = "0x1580000"

KERNEL_SIZE_zynq = "0x500000"
DEVICETREE_SIZE_zynq = "0x60000"
RAMDISK_SIZE_zynq = "0xA00000"

## Below offsets and sizes are based on 128MB QSPI Memory for zynqmp/versal
## For zynqMP
## Load boot.scr at 0x3E80000 -> 62MB of QSPI Memory
QSPI_KERNEL_OFFSET_zynqmp = "0xF00000"
QSPI_DEVICETREE_OFFSET_zynqmp = "0x2D00000"
QSPI_RAMDISK_OFFSET_zynqmp = "0x4000000"

KERNEL_SIZE_zynqmp = "0x1D00000"
DEVICETREE_SIZE_zynqmp = "0x60000"
RAMDISK_SIZE_zynqmp = "0x4000000"

## For versal
## Load boot.scr at 0x7F80000 -> 127MB of QSPI Memory
QSPI_KERNEL_OFFSET_versal = "0xF00000"
QSPI_DEVICETREE_OFFSET_versal = "0x2D00000"
QSPI_RAMDISK_OFFSET_versal = "0x2E00000"

KERNEL_SIZE_versal = "0x1D00000"
DEVICETREE_SIZE_versal = "0x60000"
RAMDISK_SIZE_versal = "0x4000000"

QSPI_KERNEL_IMAGE_zynq = "image.ub"
QSPI_KERNEL_IMAGE_zynqmp = "image.ub"
QSPI_KERNEL_IMAGE_versal = "image.ub"


FIT_IMAGE_LOAD_ADDRESS = "0x10000000"
FIT_IMAGE_SIZE = "0x6400000"
FIT_IMAGE_SIZE_zynq = "0xF00000"
FIT_IMAGE = "image.ub"

do_compile_prepend() {
	sed -e 's/@@QSPI_KERNEL_OFFSET@@/${QSPI_KERNEL_OFFSET}/' \
	    -e 's/@@KERNEL_SIZE@@/${KERNEL_SIZE}/' \
	    -e 's/@@QSPI_DEVICETREE_OFFSET@@/${QSPI_DEVICETREE_OFFSET}/' \
	    -e 's/@@DEVICETREE_SIZE@@/${DEVICETREE_SIZE}/' \
	    -e 's/@@QSPI_RAMDISK_OFFSET@@/${QSPI_RAMDISK_OFFSET}/' \
	    -e 's/@@RAMDISK_SIZE@@/${RAMDISK_SIZE}/' \
	    -e 's/@@KERNEL_IMAGE@@/${KERNEL_IMAGE}/' \
	    -e 's/@@QSPI_KERNEL_IMAGE@@/${QSPI_KERNEL_IMAGE}/' \
	    -e 's/@@FIT_IMAGE_LOAD_ADDRESS@@/${FIT_IMAGE_LOAD_ADDRESS}/' \
	    -e 's/@@FIT_IMAGE_SIZE@@/${FIT_IMAGE_SIZE}/' \
	    -e 's/@@FIT_IMAGE@@/${FIT_IMAGE}/' \
	    "${WORKDIR}/boot.cmd.${BOOTMODE}${BOOTFILE_EXT}" > "${WORKDIR}/boot.cmd.${BOOTMODE}.${SOC_FAMILY}"
}
