PLATFORM ?=
PFM_LIST = vck190_mipiRxSingle_hdmiTx vck190_mipiRxQuad_hdmiTx vck190_hdmiRx_hdmiTx
PFM = $(basename $(PLATFORM) .xpfm)

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
	$(MAKE) -C filter2d_combined all PLATFORM=$(PLATFORM)
	-@cp filter2d_combined/binary_container_1.xclbin binary_container_1.xclbin
	-@cp filter2d_combined/binary_container_1.xsa binary_container_1.xsa

.PHONY: clean
clean:
	$(MAKE) -C filter2d_combined clean
	-@rm -rf *.xsa *.xclbin
