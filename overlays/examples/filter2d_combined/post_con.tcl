#Connect accelerator ports to the performance monitor

connect_bd_intf_net [get_bd_intf_pins axi_perf_mon_0/SLOT_3_AXI] [get_bd_intf_pins axi_ic_NOC_0_S13_AXI/M00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_perf_mon_0/SLOT_4_AXI] [get_bd_intf_pins NOC_0/S14_AXI]