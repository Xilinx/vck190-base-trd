Build the PetaLinux Image
=========================

Prerequisites
-------------

* Reference Design zip file

* PetaLinux Tools 2019.2

* Linux host machine

Build Flow Tutorial
-------------------

**Download Reference Design Files**

Skip the following steps if the design zip file has already been downloaded and
extracted to a working directory

#. Download the VCK190 Base Targeted Reference Design ZIP file

#. Unzip Contents

The directory structure is described in the Introduction Section.

**Generate PetaLinux Image**

#. Create a new PetaLinux project from the provided BSP::

    cd petalinux
    petalinux-create -t project -s xilinx-vck190-qspi-base-trd-2019.2-v0.1.bsp


#. Configure and build the PetaLinux project.

   **Note:** The xsa file used for project configuration is included with this
   BSP. The build step performs the configuration step implicitly. The xsa file
   can be generated through Vivado following the Vivado build steps::

    cd xilinx-vck190-qspi-base-trd-2019.2-v0.1
    petalinux-build

#. Create a boot image::

    petalinux-package --boot --u-boot

The resulting build artifacts will be available in the *petalinux/images/linux/*
folder. The relevant files for the next step are:

* **BOOT.BIN**: This is the boot image which includes:

  * Platform Loader and Manager (PLM)

  * PS Management (PSM) firmware

  * Platform Device Image (PDI)

  * ARM trusted firmware

  * u-boot

  * Device tree blob

* **boot.scr**: A u-boot boot script

* **image.ub**: U-boot wrapped Linux kernel image

* **rootfs.tar.gz**: Compressed root file system tar ball

Create an SD Card Image
-----------------------

#. Create two primary partitions on your SD card:

   * The first partition is the boot partition in FAT32 format.

   * The second partition is the root file system in EXT4 format.

   Use the fdisk utility to partition your SD card. The below steps assume your
   SD card is device */dev/sdb*::

    sudo fdisk /dev/sdb

   * Delete all existing partitions using the *d* command.

   * Create the first primary partition using the *n* command followed by *p*.
     Set the size to *+100M*.

   * Change the partition type of partition 1 with the *t* command. Select type
     *c* which is *W95 FAT32 (LBA)*.

   * Create a second primary partition again using *n* followed by *p* and set
     the size to *+2G*.

   * Use the *w* command to write the partition table.

#. Format the file systems of the two partitions. The first partition should be
   FAT32, the second partition ext4::

    sudo mkfs -t vfat -F 32 /dev/sdb1
    sudo mkfs -t ext4 /dev/sdb2

#. Copy the required boot files to partition 1::

    sudo mount /dev/sdb1 /media/card
    cd image/linux
    sudo cp BOOT.BIN boot.scr image.ub /media/card
    sudo umount /media/card

#. Copy and extract the root file system to partition 2::

    sudo mount /dev/sdb2 /media/card
    sudo cp rootfs.tar.gz /media/card
    cd /media/card
    sudo tar xfv rootfs.tar.gz
    sudo rm rootfs.tar.gz
    cd -
    sudo umount /media/card

The SD card image is now ready to be used to boot the device into Linux, see
Section *Run the Prebuilt Image* for details.

