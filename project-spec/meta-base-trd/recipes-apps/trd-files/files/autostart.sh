#!/bin/sh

# Source environment for init script
source /etc/profile

# Set console loglevel to KERN_INFO
echo "Setting console loglevel to 0 ..."
echo "0" > /proc/sys/kernel/printk

# Install/upgrade python packages for jupyter
echo "Run 'jupyter-setup.sh' to enable jupyter widgets extension"
