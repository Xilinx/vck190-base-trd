FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://system-user.dtsi \
	file://pl-custom.dtsi \
	file://quad-capture.dtsi \
	file://display.dtsi \
	file://ina226-power-monitor.dtsi \
"
