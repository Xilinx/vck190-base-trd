set_property -dict [list CONFIG.CONNECTIONS {MC_2 { read_bw {1782} write_bw {1782} read_avg_burst {4} write_avg_burst {4}} }] [get_bd_intf_pins /NOC_0/S13_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_1 { read_bw {1782} write_bw {5} read_avg_burst {4} write_avg_burst {4}} }] [get_bd_intf_pins /NOC_0/S14_AXI]
set_property -dict [list CONFIG.CONNECTIONS {MC_2 { read_bw {5} write_bw {1782} read_avg_burst {4} write_avg_burst {4}} }] [get_bd_intf_pins /NOC_0/S15_AXI]

#Connect accelerator ports to the performance monitor
connect_bd_intf_net [get_bd_intf_pins axi_perf_mon_0/SLOT_3_AXI] [get_bd_intf_pins NOC_0/S13_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_perf_mon_0/SLOT_4_AXI] [get_bd_intf_pins NOC_0/S14_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_perf_mon_0/SLOT_6_AXI] [get_bd_intf_pins NOC_0/S15_AXI]

