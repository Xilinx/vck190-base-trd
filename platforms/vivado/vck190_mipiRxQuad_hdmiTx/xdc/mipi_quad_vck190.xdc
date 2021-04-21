# MIPI CSI

#Sensor IIC

set_property PACKAGE_PIN BF14 [get_ports IIC_sensor_scl_io]
set_property PACKAGE_PIN BG13 [get_ports IIC_sensor_sda_io]
set_property PULLUP true [get_ports IIC_sensor_scl_io]
set_property PULLUP true [get_ports IIC_sensor_sda_io]
set_property IOSTANDARD LVCMOS12 [get_ports IIC_sensor_scl_io]
set_property IOSTANDARD LVCMOS12 [get_ports IIC_sensor_sda_io]
set_property DRIVE 8 [get_ports IIC_sensor_scl_io]
set_property DRIVE 8 [get_ports IIC_sensor_sda_io]

set_property PACKAGE_PIN BE11 [get_ports {fmc_multicam_iic_mux_rst_n[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {fmc_multicam_iic_mux_rst_n[0]}]

#POC1 CONTROL

set_property PACKAGE_PIN BG15 [get_ports {fmc_multicam_poc1_en[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {fmc_multicam_poc1_en[0]}]

set_property PACKAGE_PIN BG11 [get_ports fmc_multicam_poc1_int]
set_property IOSTANDARD LVCMOS12 [get_ports fmc_multicam_poc1_int]

#POC2 CONTROL

set_property PACKAGE_PIN BC12 [get_ports {fmc_multicam_poc2_en[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {fmc_multicam_poc2_en[0]}]

set_property PACKAGE_PIN BG14 [get_ports fmc_multicam_poc2_int]
set_property IOSTANDARD LVCMOS12 [get_ports fmc_multicam_poc2_int]

#GMSL CONTROL

set_property PACKAGE_PIN BF11 [get_ports {fmc_multicam_max9286_pwdn_n[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {fmc_multicam_max9286_pwdn_n[0]}]

#set_property PACKAGE_PIN BF12 [get_ports {fmc_multicam_max9286_fsync}]
#set_property IOSTANDARD LVCMOS12 [get_ports {fmc_multicam_max9286_fsync}]

#GMSL2 CONTROL

set_property PACKAGE_PIN BD12 [get_ports {fmc_multicam_max9296_pwdn_n[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {fmc_multicam_max9296_pwdn_n[0]}]


# MIPI
set_property PACKAGE_PIN BC13 [get_ports mipi_phy_csi_clk_p]
set_property PACKAGE_PIN BD13 [get_ports mipi_phy_csi_clk_n]
set_property PACKAGE_PIN AW12 [get_ports {mipi_phy_csi_data_p[0]}]
set_property PACKAGE_PIN AW13 [get_ports {mipi_phy_csi_data_n[0]}]
set_property PACKAGE_PIN BD15 [get_ports {mipi_phy_csi_data_p[1]}]
set_property PACKAGE_PIN BD14 [get_ports {mipi_phy_csi_data_n[1]}]
set_property PACKAGE_PIN BB11 [get_ports {mipi_phy_csi_data_p[2]}]
set_property PACKAGE_PIN BC11 [get_ports {mipi_phy_csi_data_n[2]}]
set_property PACKAGE_PIN BB15 [get_ports {mipi_phy_csi_data_p[3]}]
set_property PACKAGE_PIN Bc15 [get_ports {mipi_phy_csi_data_n[3]}]


set_property IOSTANDARD MIPI_DPHY [get_ports mipi_phy_csi_clk_p]
set_property IOSTANDARD MIPI_DPHY [get_ports mipi_phy_csi_clk_n]
set_property IOSTANDARD MIPI_DPHY [get_ports {mipi_phy_csi_data_p[*]}]
set_property IOSTANDARD MIPI_DPHY [get_ports {mipi_phy_csi_data_n[*]}]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_csi_clk*]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_csi_data_p[*]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_csi_data_n[*]}]
