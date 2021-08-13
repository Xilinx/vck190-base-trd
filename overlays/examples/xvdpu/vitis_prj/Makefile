############################## Help ##############################
.PHONY: help
help:
	@echo "Makefile Usage:"
	@echo ""
	@echo "  make all PLATFORM=<VCK190 platform> BATCH_N=<>"
	@echo "      Command to generate all design"
	@echo "      Support platform 'vck190_mipiRxSingle_hdmiTx' and 'vck190_mipiRxQuad_hdmiTx'"
	@echo "      Support 'BATCH_N=1' and 'BATCH_N=3'"
	@echo ""
	@echo "  make clean "
	@echo "      Command to remove IP files from vitis_prj folder and all the generated files"
	@echo ""
############################ Project Variables #####################
#Included files:
include xvdpu_config.mk
include scripts/makefile

#Absolute path of this makefile
ABS_PATH                := $(shell pwd -P)
$(eval FATHER_PATH      := $(realpath $(ABS_PATH)/..))
TIME                     = $(shell date +"%Y%m%d%H%M")
#Platform to build for
# PLATFORM                 = /group/dphi_edge/vck190-platform/xilinx_vck190_mipiRxSingle_hdmiTx_202110_1/vck190_mipiRxSingle_hdmiTx.xpfm 
DEVICE                  ?= vck190
XCL_EMULATION_MODE      ?= hw
unexport XCL_EMULATION_MODE

#Build directory
BUILD_DIR                = $(XCL_EMULATION_MODE)

#Default v++ compiler flags
VXXFLAGS                += -t $(XCL_EMULATION_MODE) --platform $(PLATFORM) --save-temps --temp_dir $(BUILD_DIR)/binary_container_1 -g
VXXFLAGS                += --xp vivado_prop:run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=$(ABS_PATH)/scripts/pre_place.tcl
VXXFLAGS                += --xp vivado_prop:run.impl_1.STEPS.PLACE_DESIGN.TCL.POST=$(ABS_PATH)/scripts/post_place.tcl
VXXFLAGS                += --xp param:compiler.userPostSysLinkOverlayTcl=$(ABS_PATH)/scripts/post_linker.tcl
VXXFLAGS                += --xp vivado_prop:run.impl_1.GEN_FULL_BITSTREAM=1
VXXFLAGS                += --log_dir $(BUILD_DIR)/binary_container_1/logs
VXXFLAGS                += --report_dir $(BUILD_DIR)/binary_container_1/reports
VXXFLAGS                += --xp vivado_prop:run.impl_1.STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED=false

VXX                      = $(XILINX_VITIS)/bin/v++
EMCONFIGUTIL             = $(XILINX_VITIS)/bin/emconfigutil
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Build products
AIE_OBJECTS              = $(ABS_PATH)/aie/ip/libadf.a
BINARY_CONTAINERS       += $(BUILD_DIR)/binary_container_1.xclbin
BUILD_SUBDIRS           += $(BUILD_DIR)/binary_container_1
BINARY_CONTAINER_1_OBJS += $(BUILD_DIR)/binary_container_1/DPUCVDX8G.xo $(BUILD_DIR)/binary_container_1/libadf.a

COSIM_PKG_DIR            = $(ABS_PATH)/aie/ip/Work
export COSIM_PKG_DIR

JSON_DEVICE_FILE_PATH    = ${XILINX_VITIS}/cardano/data/devices/VC1902.json
export JSON_DEVICE_FILE_PATH
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build AIE graph 
aie_sourcefile          += $(ABS_PATH)/aie/src/* 
aie_sourcefile          += $(ABS_PATH)/aie/scripts/* 
aie_sourcefile          += $(ABS_PATH)/aie/genStream/*
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Package RTL kernel 
VIVADO_ROOT             := $(XILINX_VIVADO)
VIVADO                  := $(VIVADO_ROOT)/bin/vivado

xvdpu_HDLSRCS	    	+= $(ABS_PATH)/scripts/kernel.xml
xvdpu_HDLSRCS	       	+= $(ABS_PATH)/scripts/package_xvdpu_kernel.tcl
xvdpu_HDLSRCS	       	+= $(ABS_PATH)/scripts/gen_xvdpu_xo.tcl
xvdpu_HDLSRCS	       	+= $(ABS_PATH)/xvdpu/hdl/*.sv
xvdpu_HDLSRCS	      	+= $(ABS_PATH)/xvdpu/inc/*.vh

xvdpu_TCL                = $(ABS_PATH)/scripts/gen_xvdpu_xo.tcl
# Kernel name must match kernel name in kernel.xml
DPU_KERN_NAME            = DPUCVDX8G

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.PHONY: all
all:  files $(BINARY_CONTAINERS) $(BUILD_DIR)/xrt.ini $(BUILD_DIR)/dpu.xclbin

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Clean build products
.PHONY: clean
.NOTPARALLEL: clean
clean:
	-@rm -rf .Xil vivado* *.xpe *.txt *.log hw.o *.xsa .ipcache .run sample*.ini packaged_kernel_*_hw_* tmp_kernel_pack_*_hw_*
	-@rm -rf aie hw scripts/kernel.xml scripts/*xvdpu_aie_noc.cfg xvdpu/hdl xvdpu/inc xvdpu/vitis_cfg xvdpu/ttcl package_out 
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Prepare AIE definition for Vitis
$(BUILD_DIR)/binary_container_1/libadf.a:
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Copying $(notdir $@)..."
	@mkdir -p $(@D)
	@cp aie/ip/libadf.a "$@"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Compile xvdpu kernel
.PHONY: xo
xo: $(BUILD_DIR)/binary_container_1/DPUCVDX8G.xo

$(BUILD_DIR)/binary_container_1/DPUCVDX8G.xo:
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Building $(notdir $@) for $(BUILD_DIR)..."
	@mkdir -p $(@D)
	-@rm -rf $@
	$(VIVADO) -mode batch -source $(xvdpu_TCL) -tclargs $@ $(DPU_KERN_NAME) $(XCL_EMULATION_MODE) $(DEVICE)
	
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Link xvdpu kernel and AIE graph
$(BUILD_DIR)/binary_container_1.xclbin: $(BINARY_CONTAINER_1_OBJS)
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Building $(notdir $@) for $(BUILD_DIR)..."
	@mkdir -p $(@D)
	@$(VXX) $(VXXFLAGS) -l --config scripts/system.cfg --config scripts/xvdpu_aie_noc.cfg \
	  --clock.freqHz $(PL_FREQ):DPUCVDX8G.m_axi_aclk \
	  --clock.freqHz $(PL_FREQ):ai_engine_0.aclk0 \
	  --clock.freqHz 150000000:DPUCVDX8G.s_axi_aclk \
	  -o "$@" $(BINARY_CONTAINER_1_OBJS) 
	  
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Create default xrt.ini file
$(BUILD_DIR)/xrt.ini:
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Creating default $(notdir $@) for $(BUILD_DIR)..."
	@echo "[Emulation]" > $@
	@echo "keep_run_dir=true" >> $@
	@echo "launch_waveform=off" >> $@
	@echo "[Runtime]" >> $@
	@echo "pdi_load=false" >> $@
	@echo "ert=false" >> $@

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Package design
.PHONY: package
package: $(BUILD_DIR)/dpu.xclbin
$(BUILD_DIR)/dpu.xclbin: $(BUILD_DIR)/binary_container_1.xclbin $(BUILD_DIR)/binary_container_1/libadf.a $(BUILD_DIR)/xrt.ini
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Packaging $(notdir $@) for $(BUILD_DIR)..."
	-@rm -rf package_out
	@cd $(BUILD_DIR); rm -rf dpu.xclbin binary_container_1.xsa BOOT_bh.bin BOOT.BIN boot_image.bif emulation_data launch_hw_emu.sh libsdf plm.bin pmc_args.txt pmc_cdo.bin qemu_args.txt qemu_ospi.bin sim
	@cd $(BUILD_DIR); $(VXX) -t $(XCL_EMULATION_MODE) --platform $(PLATFORM)  --save-temps --temp_dir binary_container_1 -p binary_container_1.xclbin binary_container_1/libadf.a -o "$@" \
	  --package.out_dir ../package_out \
	  --package.boot_mode sd  \
	  --package.rootfs $(dir $(PLATFORM))sw/*/xrt/filesystem/rootfs.ext4 \
	  --package.sd_file $(dir $(PLATFORM))sw/*/xrt/image/Image \
	  --package.sd_file xrt.ini	
	cp  $(ABS_PATH)/hw/binary_container_1/link/vivado/vpl/prj/prj.gen/sources_1/bd/*/ip/*_DPUCVDX8G_0/arch.json $(ABS_PATH)/package_out/sd_card
	gzip package_out/sd_card.img
	-@rm -rf .ipcache .Xil packaged_kernel_*_hw_* tmp_kernel_pack_*_hw_* vivado* *.xsa *.log hw.o sample*.ini