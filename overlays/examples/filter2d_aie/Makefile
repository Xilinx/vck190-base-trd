CP = cp -f
RM = rm -rf
MV = mv
ZIP = zip -u

# v++ flags
PLATFORM ?=
LINK_CFG = link.cfg
PACKAGE_CFG = package.cfg
JOBS = 32

VPP ?= v++
VPP_LINK_FLAGS = -l -t hw --platform $(PLATFORM) --save-temps \
	--report_level estimate -j $(JOBS) --config $(LINK_CFG)
VPP_PACK_FLAGS = -p -t hw --platform $(PLATFORM) --config $(PACKAGE_CFG)
XBU = xclbinutil
XBU_FLAGS = --remove-section BITSTREAM --force

# kernels and xclbin
KERNEL_OBJS += datamover/tiler.xo
KERNEL_OBJS += datamover/stitcher.xo

AIE_ADF += kernel/libadf.a
BINARY_CONTAINER = binary_container_1.xclbin
XSA_FILE = binary_container_1.xsa
PACKAGE += BOOT.BIN
PACKAGE += a.xclbin

# Rules
.PHONY: all package link
all: package
package: $(PACKAGE)
link: $(BINARY_CONTAINER)

$(PACKAGE): $(BINARY_CONTAINER) $(AIE_ADF)
	$(VPP) $(VPP_PACK_FLAGS) $(+)
	$(XBU) $(XBU_FLAGS) --input $(BINARY_CONTAINER) --output strip.xclbin
	-@$(MV) $(BINARY_CONTAINER) tmp.xclbin
	-@$(MV) strip.xclbin $(BINARY_CONTAINER)
	-@$(CP) BOOT.BIN vpl_gen_fixed.pdi
	-@$(ZIP) $(XSA_FILE) vpl_gen_fixed.pdi
	-@$(ZIP) $(XSA_FILE) $(BINARY_CONTAINER)
	-@$(MV) tmp.xclbin $(BINARY_CONTAINER)

$(BINARY_CONTAINER): $(KERNEL_OBJS) $(AIE_ADF)
	$(VPP) $(VPP_LINK_FLAGS) -o $@ $(+)
	-@$(RM) .Xil

$(AIE_ADF):
	$(MAKE) -C kernel

.PHONY: clean clean-subdirs
clean: clean-subdirs
	-$(RM) _xocc* .Xil _x *.o *.xclbin *.BIN *.bif *.pdi
	-$(RM) .Xil _sds *.xml *.dat *.hpfm iprepo *.xtxt *.xsa
	-$(RM) sd_card *.log *.rpt .ipcache
	-$(RM) *.info
	-$(RM) *.link_summary* *.package_summary*

clean-subdirs:
	$(MAKE) -C kernel clean
