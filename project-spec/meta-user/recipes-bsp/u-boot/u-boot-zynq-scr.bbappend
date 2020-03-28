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
## Load boot.scr at 0xFC0000 -> 15MB of QSPI/NAND Memory
QSPI_KERNEL_OFFSET_zynq = "0x1000000"
QSPI_RAMDISK_OFFSET_zynq = "0x1580000"

NAND_KERNEL_OFFSET_zynq = "0x1000000"
NAND_RAMDISK_OFFSET_zynq = "0x4600000"

QSPI_KERNEL_SIZE_zynq = "0x500000"
QSPI_RAMDISK_SIZE_zynq = "0xA00000"

NAND_KERNEL_SIZE = "0x3200000"
NAND_RAMDISK_SIZE = "0x3200000"

## Below offsets and sizes are based on 128MB QSPI Memory for zynqmp/versal
## For zynqMP
## Load boot.scr at 0x3E80000 -> 62MB of QSPI/NAND Memory
QSPI_KERNEL_OFFSET_zynqmp = "0xF00000"
QSPI_RAMDISK_OFFSET_zynqmp = "0x4000000"

NAND_KERNEL_OFFSET_zynqmp = "0x4100000"
NAND_RAMDISK_OFFSET_zynqmp = "0x7800000"

QSPI_KERNEL_SIZE_zynqmp = "0x1D00000"
QSPI_RAMDISK_SIZE_zynqmp = "0x4000000"

## For versal
## Load boot.scr at 0x7F80000 -> 127MB of QSPI/NAND Memory
QSPI_KERNEL_OFFSET_versal = "0xF00000"
QSPI_RAMDISK_OFFSET_versal = "0x2E00000"

NAND_KERNEL_OFFSET_versal = "0x4100000"
NAND_RAMDISK_OFFSET_versal = "0x8200000"

QSPI_KERNEL_SIZE_versal = "0x1D00000"
QSPI_RAMDISK_SIZE_versal = "0x4000000"

QSPI_KERNEL_IMAGE_zynq = "image.ub"
QSPI_KERNEL_IMAGE_zynqmp = "image.ub"
QSPI_KERNEL_IMAGE_versal = "image.ub"

NAND_KERNEL_IMAGE = "image.ub"

FIT_IMAGE_LOAD_ADDRESS = "0x10000000"

QSPI_FIT_IMAGE_LOAD_ADDRESS = "0x10000000"
QSPI_FIT_IMAGE_SIZE = "0x6400000"
QSPI_FIT_IMAGE_SIZE_zynq = "0xF00000"

NAND_FIT_IMAGE_LOAD_ADDRESS = "0x10000000"
NAND_FIT_IMAGE_SIZE = "0x6400000"

FIT_IMAGE = "image.ub"

do_compile_prepend() {
	sed -e 's/@@QSPI_KERNEL_OFFSET@@/${QSPI_KERNEL_OFFSET}/' \
	    -e 's/@@NAND_KERNEL_OFFSET@@/${NAND_KERNEL_OFFSET}/' \
	    -e 's/@@QSPI_KERNEL_SIZE@@/${QSPI_KERNEL_SIZE}/' \
	    -e 's/@@NAND_KERNEL_SIZE@@/${NAND_KERNEL_SIZE}/' \
	    -e 's/@@QSPI_RAMDISK_OFFSET@@/${QSPI_RAMDISK_OFFSET}/' \
	    -e 's/@@NAND_RAMDISK_OFFSET@@/${NAND_RAMDISK_OFFSET}/' \
	    -e 's/@@QSPI_RAMDISK_SIZE@@/${QSPI_RAMDISK_SIZE}/' \
	    -e 's/@@NAND_RAMDISK_SIZE@@/${NAND_RAMDISK_SIZE}/' \
	    -e 's/@@KERNEL_IMAGE@@/${KERNEL_IMAGE}/' \
	    -e 's/@@QSPI_KERNEL_IMAGE@@/${QSPI_KERNEL_IMAGE}/' \
	    -e 's/@@NAND_KERNEL_IMAGE@@/${NAND_KERNEL_IMAGE}/' \
	    -e 's/@@QSPI_FIT_IMAGE_LOAD_ADDRESS@@/${QSPI_FIT_IMAGE_LOAD_ADDRESS}/' \
	    -e 's/@@FIT_IMAGE_LOAD_ADDRESS@@/${FIT_IMAGE_LOAD_ADDRESS}/' \
	    -e 's/@@QSPI_FIT_IMAGE_SIZE@@/${QSPI_FIT_IMAGE_SIZE}/' \
	    -e 's/@@NAND_FIT_IMAGE_LOAD_ADDRESS@@/${NAND_FIT_IMAGE_LOAD_ADDRESS}/' \
	    -e 's/@@NAND_FIT_IMAGE_SIZE@@/${NAND_FIT_IMAGE_SIZE}/' \
	    -e 's/@@FIT_IMAGE@@/${FIT_IMAGE}/' \
	    "${WORKDIR}/boot.cmd.${BOOTMODE}${BOOTFILE_EXT}" > "${WORKDIR}/boot.cmd.${BOOTMODE}.${SOC_FAMILY}"
}
