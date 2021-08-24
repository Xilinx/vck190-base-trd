PLATFORM ?=
PFM_LIST = vck190_mipiRxSingle_hdmiTx vck190_mipiRxQuad_hdmiTx
PFM = $(basename $(PLATFORM) .xpfm)
BATCH_N_LIST = 1 3
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

.PHONY: clean
clean:
	$(MAKE) -C vitis_prj clean
