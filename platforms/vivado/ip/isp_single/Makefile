# (C) Copyright 2020 - 2021 Xilinx, Inc.
# (C) Copyright 2022 Advanced Micro Devices, Inc.
# SPDX-License-Identifier: Apache-2.0

RM = rm -rf
HLS = vitis_hls
CLKP ?= 5.0
XPART ?= xcvc1902-vsva2197-1LP-e-S-es1


.PHONY: help
help:
	@echo 'Usage:'
	@echo ''
	@echo '  make ip'
	@echo '    Generate IP for Single Sensor ISP'
	@echo ''

.PHONY: all
all: ip

ip:
	@echo 'set CLKP $(CLKP)' >> ./settings.tcl
	@echo 'set XPART $(XPART)' >> ./settings.tcl
	$(HLS) -f run_hls_isp.tcl
	$(HLS) -f run_hls_extract.tcl
	$(HLS) -f run_hls_merge.tcl

.PHONY: clean
clean:
	$(RM) settings.tcl *.prj *.log

