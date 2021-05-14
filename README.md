# Clone this Repo
This repo uses git submodules. After cloning the repo, run the following command
to initialize the submodules recursively and update them to the respective
remote tracking branches.
```bash
% git submodule update --init --remote --recursive
```

# VCK190 PetaLinux BSP
This README describes the steps to configure and build this PetaLinux project.

## Prerequisites
*   Source the PetaLinux tool `settings.sh` script.

## Configuration
The project can be configured to build designs targeting vck190
platform. To list the available platforms and designs, run:
```bash
% ./trd-pl-cfg -l
```
**Example:**
To configure the project for vck190, es1 silicon and platform 'mipiRxSingle_hdmiTx',
run:
```bash
% ./trd-pl-cfg -p vck190_es1_mipiRxSingle_hdmiTx 
```
Next the project needs to be configured with the xsa file from the Vivado
project.
```bash
% petalinux-config --get-hw-description=<path/to/xsa/> --silentconfig
```
**Note:** The xsa needs to match the platform and design selected in the
previous step.

## Linux Image Build
The first step generates all the binaries for the Linux image which can be found
`images/linux` directory.
```bash
% petalinux-build
```
The second step generates a boot image (BOOT.bin) using some of the binaries of
the previous step.
```bash
% petalinux-package --boot --u-boot --qemu-rootfs no --force
```
The third step generates a bootable SD card image. The .wic file will be placed
in the images/linux folder
```bash
% petalinux-package --wic -w project-spec/configs/sdimage.wks --force
```
## Makefile flow
Makefile with the specified platform name can build all the above components in one go.
Use make help for more info

**Example:**
To generate final wic image for the project 'vck190', 'es1' silicon and 'mipiRxQuad_hdmiTx' platform,
run:
```bash
% make all PFM=vck190_es1_mipiRxQuad_hdmiTx

