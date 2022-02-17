CP = cp -f
RM = rm -rf
MV = mv
ZIP = zip -u

# v++ flags
VPP ?= v++
PLATFORM ?=
LINK_CFG = link.cfg
PACKAGE_CFG = package.cfg
JOBS = 32

VPP_LINK_FLAGS = -l -t hw --platform $(PLATFORM) --save-temps \
	--report_level estimate -j $(JOBS) --config $(LINK_CFG) \
	--advanced.param compiler.userPostSysLinkOverlayTcl=post_con.tcl

VPP_PACK_FLAGS = -p -t hw --platform $(PLATFORM) --config $(PACKAGE_CFG)
XBU = xclbinutil
XBU_FLAGS = --remove-section BITSTREAM --force

# kernels and xclbin
KERNEL_OBJS += ../filter2d_pl/kernel/filter2d_pl_accel/filter2d_pl_accel.xo
KERNEL_OBJS += ../filter2d_aie/datamover/tiler.xo
KERNEL_OBJS += ../filter2d_aie/datamover/stitcher.xo

AIE_SDF += ../filter2d_aie/kernel/libadf.a
BINARY_CONTAINER = binary_container_1.xclbin
XSA_FILE = binary_container_1.xsa
PACKAGE += BOOT.BIN
PACKAGE += $(BINARY_CONTAINER)

# Rules
.PHONY: all package link
all: package
package: $(PACKAGE)
link: $(XSA_FILE)

$(PACKAGE): $(XSA_FILE) $(AIE_SDF)
	$(VPP) $(VPP_PACK_FLAGS) $(+) -o $(BINARY_CONTAINER)
	$(XBU) $(XBU_FLAGS) --input $(BINARY_CONTAINER) --output strip.xclbin
	-@$(MV) $(BINARY_CONTAINER) tmp.xclbin
	-@$(MV) strip.xclbin $(BINARY_CONTAINER)
	-@$(CP) BOOT.BIN vpl_gen_fixed.pdi
	-@$(ZIP) $(XSA_FILE) vpl_gen_fixed.pdi
	-@$(ZIP) $(XSA_FILE) $(BINARY_CONTAINER)
	-@$(MV) tmp.xclbin $(BINARY_CONTAINER)

$(XSA_FILE): $(KERNEL_OBJS) $(AIE_SDF)
	$(VPP) $(VPP_LINK_FLAGS) -o $@ $(+)
	-@$(RM) .Xil

$(KERNEL_OBJS):
	$(MAKE) -C ../filter2d_pl/kernel
	$(MAKE) -C ../filter2d_aie/kernel

.PHONY: clean clean-subdirs
clean: clean-subdirs
	-$(RM) _xocc* .Xil _x *.o *.xclbin *.BIN *.bif *.pdi
	-$(RM) .Xil _sds *.xml *.dat *.hpfm iprepo *.xtxt *.xsa
	-$(RM) sd_card *.log *.rpt .ipcache
	-$(RM) *.info
	-$(RM) *.link_summary* *.package_summary*

clean-subdirs:
	$(MAKE) -C ../filter2d_pl/kernel clean
	$(MAKE) -C ../filter2d_aie/kernel clean
