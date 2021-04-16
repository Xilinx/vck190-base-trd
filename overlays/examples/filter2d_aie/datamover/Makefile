RM = rm -rf

# Kernel name
KERNEL = filter2d_aie_accel
KERNEL_XO = $(KERNEL)/$(KERNEL).xo

# v++ flags
VPP ?= v++
PLATFORM =
JOBS = 32
KERNEL_XO_FLAGS = -k $(KERNEL) -D__SDSVHLS__
VPP_XO_FLAGS = -c -t hw --platform $(PLATFORM) --save-temps \
	--report_level estimate -j $(JOBS) $(KERNEL_XO_FLAGS)

# Rules
$(KERNEL_XO): xf_filter2d_aie_accel.cpp
	@mkdir -p $(@D)
	-@$(RM) $@
	$(VPP) $(VPP_XO_FLAGS) -o $@ $<
	-@$(RM) .Xil

.PHONY: clean
clean:
	-$(RM) $(KERNEL) *.log _x
