FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
dirs755 += "/media/card"

do_install_append () {
	echo "/dev/mmcblk0p1 /media/card auto defaults,sync  0  0" >> ${D}${sysconfdir}/fstab
	echo "alias ls='ls --color=auto'" >> ${D}${sysconfdir}/profile
	echo "alias ll='ls --color=auto -l'" >> ${D}${sysconfdir}/profile
	echo "alias la='ls --color=auto -la'" >> ${D}${sysconfdir}/profile
	echo "alias modetest='modetest -M xlnx'" >> ${D}${sysconfdir}/profile
	echo "alias modetest-dp='modetest -D fd4a0000.zynqmp-display'" >> ${D}${sysconfdir}/profile
	echo "alias modetest-hdmi='modetest -D b00c0000.v_mix'" >> ${D}${sysconfdir}/profile
	echo "export XILINX_XRT=/usr" >> ${D}${sysconfdir}/profile
	echo "export XCL_BINDIR=/media/card" >> ${D}${sysconfdir}/profile
}
