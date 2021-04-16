RM = rm -rf
MV = mv

# v++ flags
VPP ?= v++
PLATFORM ?=
LINK_CFG ?= vck190.cfg
JOBS = 32
VPP_LINK_FLAGS = -l -t hw --platform $(PLATFORM) --save-temps \
	--report_level estimate -j $(JOBS) --config $(LINK_CFG)
XBU = xclbinutil
XBU_FLAGS = --remove-section BITSTREAM --force

# kernels and xclbin
KERNEL_OBJS += kernel/filter2d_pl_accel/filter2d_pl_accel.xo
BINARY_CONTAINER = binary_container_1.xclbin

# Rules
.PHONY: all link
all: link
link: $(BINARY_CONTAINER)

$(BINARY_CONTAINER): $(KERNEL_OBJS)
	$(VPP) $(VPP_LINK_FLAGS) -o $@ $(+)
	$(XBU) $(XBU_FLAGS) --input $(BINARY_CONTAINER) --output tmp.xclbin
	-@$(MV) tmp.xclbin $(BINARY_CONTAINER)
	-@$(RM) .Xil

$(KERNEL_OBJS):
	$(MAKE) -C kernel

.PHONY: clean clean-subdirs
clean: clean-subdirs
	-$(RM) $(BINARY_CONTAINER)
	-$(RM) _xocc* .Xil _x
	-$(RM) .Xil _sds *.xml *.dat *.hpfm iprepo *.xtxt *.xsa
	-$(RM) sd_card *.log *.rpt
	-$(RM) *.info
	-$(RM) *.link_summary*

clean-subdirs:
	$(MAKE) -C kernel clean
