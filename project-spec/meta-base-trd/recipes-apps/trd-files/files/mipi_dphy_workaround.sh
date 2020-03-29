#!/bin/sh

echo "Apply MIPI DPHY workaround ..."

# XPIO_DCI_COMPONENT_9
/sbin/devmem  0xf651a00c 32 0xf9e8d7c6
/sbin/devmem  0xf651a000 32 0x0fffffff
/sbin/devmem  0xf651a004 32 0x00000001
/sbin/devmem  0xf651a04c 32 0x107fc000
# XPIO_DCI_COMPONENT_8
/sbin/devmem  0xf64aa00c 32 0xf9e8d7c6
/sbin/devmem  0xf64aa000 32 0x0fffffff
/sbin/devmem  0xf64aa004 32 0x00000001
/sbin/devmem  0xf64aa04c 32 0x107fc000
# XPIO_DCI_COMPONENT_7
/sbin/devmem  0xf644a00c 32 0xf9e8d7c6
/sbin/devmem  0xf644a000 32 0x0fffffff
/sbin/devmem  0xf644a004 32 0x00000001
/sbin/devmem  0xf644a04c 32 0x107fc000
# XPIO_DCI_COMPONENT_6
/sbin/devmem  0xf63aa00c 32 0xf9e8d7c6
/sbin/devmem  0xf63aa000 32 0x0fffffff
/sbin/devmem  0xf63aa004 32 0x00000001
/sbin/devmem  0xf63aa04c 32 0x107fc000
# XPIO_DCI_COMPONENT_5
/sbin/devmem  0xf633a00c 32 0xf9e8d7c6
/sbin/devmem  0xf633a000 32 0x0fffffff
/sbin/devmem  0xf633a004 32 0x00000001
/sbin/devmem  0xf633a04c 32 0x107fc000
# XPIO_DCI_COMPONENT_4
/sbin/devmem  0xf62da00c 32 0xf9e8d7c6
/sbin/devmem  0xf62da000 32 0x0fffffff
/sbin/devmem  0xf62da004 32 0x00000001
/sbin/devmem  0xf62da04c 32 0x107fc000
# XPIO_DCI_COMPONENT_3
/sbin/devmem  0xf623a00c 32 0xf9e8d7c6
/sbin/devmem  0xf623a000 32 0x0fffffff
/sbin/devmem  0xf623a004 32 0x00000001
/sbin/devmem  0xf623a04c 32 0x107fc000
# XPIO_DCI_COMPONENT_2
/sbin/devmem  0xf61ca00c 32 0xf9e8d7c6
/sbin/devmem  0xf61ca000 32 0x0fffffff
/sbin/devmem  0xf61ca004 32 0x00000001
/sbin/devmem  0xf61ca04c 32 0x107fc000
# XPIO_DCI_COMPONENT_11
/sbin/devmem  0xf661a00c 32 0xf9e8d7c6
/sbin/devmem  0xf661a000 32 0x0fffffff
/sbin/devmem  0xf661a004 32 0x00000001
/sbin/devmem  0xf661a04c 32 0x107fc000
# XPIO_DCI_COMPONENT_10
/sbin/devmem  0xf65ba00c 32 0xf9e8d7c6
/sbin/devmem  0xf65ba000 32 0x0fffffff
/sbin/devmem  0xf65ba004 32 0x00000001
/sbin/devmem  0xf65ba04c 32 0x107fc000
# XPIO_DCI_COMPONENT_1
/sbin/devmem  0xf616a00c 32 0xf9e8d7c6
/sbin/devmem  0xf616a000 32 0x0fffffff
/sbin/devmem  0xf616a004 32 0x00000001
/sbin/devmem  0xf616a04c 32 0x107fc000
# XPIO_DCI_COMPONENT_0
/sbin/devmem  0xf609a00c 32 0xf9e8d7c6
/sbin/devmem  0xf609a000 32 0x0fffffff
/sbin/devmem  0xf609a004 32 0x00000001
/sbin/devmem  0xf609a04c 32 0x107fc000
