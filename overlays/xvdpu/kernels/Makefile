# (C) Copyright 2020 - 2021 Xilinx, Inc.
# SPDX-License-Identifier: Apache-2.0

PLATFORM ?=
PFM_LIST = vck190_mipiRxSingle_hdmiTx vck190_mipiRxQuad_hdmiTx
PFM = $(basename $(PLATFORM) .xpfm)
BATCH_N_LIST = 1
# hardcode value for now
BATCH_N = 1

.PHONY: all
all:
	@valid=0; \
	for p in $(PFM_LIST); do \
	  if [ "$$p" = "$(PFM)" ]; then \
	    valid=1; \
	    break; \
	  fi \
	done; \
	if [ "$$valid" -ne 1 ]; then \
	  echo 'Invalid platform $(PFM). Choose one of: $(PFM_LIST)'; \
	  exit 1; \
	fi; \
	$(MAKE) -C vitis_prj all PLATFORM=$(PLATFORM) BATCH_N=$(BATCH_N)
	-@cp vitis_prj/binary_container_1.xclbin binary_container_1.xclbin
	-@cp vitis_prj/binary_container_1.xsa binary_container_1.xsa
	-@cp vitis_prj/package_out/sd_card/arch.json arch.json
	
.PHONY: clean
clean:
	$(MAKE) -C vitis_prj clean
	-@rm -rf *.xsa *.xclbin