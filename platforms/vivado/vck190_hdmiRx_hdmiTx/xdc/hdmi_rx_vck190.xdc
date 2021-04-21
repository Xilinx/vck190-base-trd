# HDMI RX
#HDMI_RX_CLK_C_P
set_property PACKAGE_PIN G39 [get_ports RX_CLK_IN_clk_p]

#HDMI DRU_CLK
set_property PACKAGE_PIN J39 [get_ports {DRU_CLK_IN_clk_p}]

#HDMI_RX_HPD
set_property PACKAGE_PIN J20 [get_ports {RX_HPD_OUT}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_HPD_OUT}]
#HDMI_RX_SNK_SCL
set_property PACKAGE_PIN H17 [get_ports RX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports RX_DDC_OUT_scl_io]
#HDMI_RX_SNK_SDA
set_property PACKAGE_PIN J19 [get_ports RX_DDC_OUT_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports RX_DDC_OUT_sda_io]
#HDMI_REC_CLK_OUT
set_property PACKAGE_PIN L19 [get_ports RX_REFCLK_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports RX_REFCLK_OUT]
#HDMI_RX_PWR_DET
set_property PACKAGE_PIN H18 [get_ports RX_DET_IN]
set_property IOSTANDARD LVCMOS33 [get_ports RX_DET_IN]
                               
