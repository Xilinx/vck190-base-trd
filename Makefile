# (C) Copyright 2020 - 2021 Xilinx, Inc.
# SPDX-License-Identifier: Apache-2.0

CP = cp -f

PWD = $(shell readlink -f .)

# the platform directory has to be an absolute path when passed to v++
PFM_DIR = $(PWD)/platforms
PFM_VER = 202110_1

# valid platforms / overlays
PFM_LIST = vck190_es1_mipiRxSingle_hdmiTx vck190_es1_mipiRxQuad_hdmiTx vck190_es1_hdmiRx_hdmiTx vck190_mipiRxSingle_hdmiTx vck190_mipiRxQuad_hdmiTx vck190_hdmiRx_hdmiTx
OVERLAY_LIST = filter2d_combined xvdpu

PFM_XPFM = $(PFM_DIR)/xilinx_$(PFM)_$(PFM_VER)/$(PFM).xpfm

PLNX_DIR = petalinux/xilinx-vck190-base-trd
PLNX_WIC = $(PLNX_DIR)/images/linux/petalinux-sdimage.wic.xz

VITIS_DIR = overlays/examples
VITIS_OVERLAY_DIR = $(VITIS_DIR)/$(OVERLAY)
VITIS_OVERLAY_XCLBIN = $(VITIS_OVERLAY_DIR)/binary_container_1.xclbin
VITIS_OVERLAY_XSA = $(VITIS_OVERLAY_DIR)/binary_container_1.xsa

.PHONY: help
help:
	@echo 'Usage:'
	@echo ''
	@echo '  make sdcard PFM=<val> OVERLAY=<val> YES=<val>'
	@echo '    Generate an SD card wic image using PetaLinux.'
	@echo ''
	@echo '    Valid options for PFM: ${PFM_LIST}'
	@echo '    Valid options for OVERLAY: ${OVERLAY_LIST}'
	@echo '    YES: optional param to accept SDK changes if set to 1 (default: 0)'
	@echo ''
	@echo '  make overlay PFM=<val> OVERLAY=<val>'
	@echo '    Build the Vitis application overlay.'
	@echo ''
	@echo '    Valid options for PFM: ${PFM_LIST}'
	@echo '    Valid options for OVERLAY: ${OVERLAY_LIST}'
	@echo ''
	@echo '  make platform PFM=<val> JOBS=<n>'
	@echo '    Build the Vitis platform.'
	@echo ''
	@echo '    Valid options for PFM: ${PFM_LIST}'
	@echo '    JOBS: optional param to set number of synthesis jobs (default 8)'
	@echo ''
	@echo '  make docs'
	@echo '    Generate html documentation using sphinx'
	@echo ''
	@echo '  make clean'
	@echo '    Clean runs'
	@echo ''

.PHONY: all
all: sdcard

.PHONY: sdcard
sdcard: $(PLNX_WIC)
$(PLNX_WIC): $(PLNX_DIR) $(VITIS_OVERLAY_XSA) $(VITIS_OVERLAY_XCLBIN)
	@echo 'Build PetaLinux wic image for $(PFM) - $(OVERLAY)'
	@cp $(VITIS_OVERLAY_XSA) $(PLNX_DIR)/project-spec/hw-description/system.xsa
	@mkdir -p $(PLNX_DIR)/images/linux
	@cp $(VITIS_OVERLAY_XCLBIN) $(PLNX_DIR)/images/linux
	$(MAKE) -C $(PLNX_DIR) wic PFM=$(PFM)

$(PLNX_DIR):
	$(MAKE) -C petalinux project

.PHONY: overlay
overlay: $(VITIS_OVERLAY_XCLBIN)
$(VITIS_OVERLAY_XCLBIN): $(PFM_XPFM)
	@valid=0; \
	for o in $(OVERLAY_LIST); do \
	  if [ "$$o" = "$(OVERLAY)" ]; then \
	    valid=1; \
	    break; \
	  fi \
	done; \
	if [ "$$valid" -ne 1 ]; then \
	  echo 'Invalid parameter OVERLAY=$(OVERLAY). Choose one of: $(OVERLAY_LIST)'; \
	  exit 1; \
	fi; \
	echo 'Build $(OVERLAY) Vitis overlay using platform $(PFM)'; \
	$(MAKE) -C $(VITIS_OVERLAY_DIR) all PLATFORM=$(PFM_XPFM)

.PHONY: platform
platform: $(PFM_XPFM)
$(PFM_XPFM):
	@valid=0; \
	for p in $(PFM_LIST); do \
	  if [ "$$p" = "$(PFM)" ]; then \
	    valid=1; \
	    break; \
	  fi \
	done; \
	if [ "$$valid" -ne 1 ]; then \
	  echo 'Invalid parameter PFM=$(PFM). Choose one of: $(PFM_LIST)'; \
	  exit 1; \
	fi; \
	echo 'Create Vitis platform $(PFM)'; \
	$(MAKE) -C $(PFM_DIR) platform PLATFORM=$(PFM) VERSION=$(PFM_VER)

.PHONY: docs
docs:
	$(MAKE) -C docs html

.PHONY: clean
clean:
	$(MAKE) -C docs clean
	$(MAKE) -C $(PLNX_DIR) clean
	$(foreach o, $(OVERLAY_LIST), $(MAKE) -C $(VITIS_DIR)/$(o) clean;)
	$(foreach p, $(PFM_LIST), $(MAKE) -C $(PFM_DIR) clean PLATFORM=$(p) VERSION=$(PFM_VER);)
