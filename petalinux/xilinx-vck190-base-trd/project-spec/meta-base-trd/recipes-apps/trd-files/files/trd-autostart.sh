#!/bin/sh

# update xclbin filename for VART
echo "Updating xclbin fileanme for /etc/vart.conf ..."
sed -i 's|/run/media/mmcblk0p1/dpu.xclbin|/boot/binary_container_1.xclbin|g' /etc/vart.conf

# Generate graphviz config file
/usr/bin/dot -c
