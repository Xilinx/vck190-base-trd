RM = rm -rf

# Kernel name
KERNEL = filter2d_pl_accel
KERNEL_XO = $(KERNEL)/$(KERNEL).xo

# v++ flags
VPP ?= v++
PPC ?= XF_NPPC8
FILTER2D_PL_XO_FLAGS ?= -DPPC=$(PPC)
XFOPENCV_INCDIR = ../../../Vitis_Libraries/vision/L1/include
KERNEL_XO_FLAGS = -k $(KERNEL) -I$(XFOPENCV_INCDIR) $(FILTER2D_PL_XO_FLAGS) \
	-D__SDSVHLS__
PLATFORM =
JOBS = 32
VPP_XO_FLAGS = -c -t hw --platform $(PLATFORM) --save-temps \
	--report_level estimate -j $(JOBS) $(KERNEL_XO_FLAGS)

# Rules
$(KERNEL_XO): xf_filter2d_pl_accel.cpp
	@mkdir -p $(@D)
	-@$(RM) $@
	$(VPP) $(VPP_XO_FLAGS) -o $@ $<
	-@$(RM) .Xil

.PHONY: clean
clean:
	-$(RM) $(KERNEL) *.log _x
