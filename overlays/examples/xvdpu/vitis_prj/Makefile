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

ABS_PATH                := $(shell pwd -P)
$(eval FATHER_PATH      := $(realpath $(ABS_PATH)/..))
# PLATFORM                 =  
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
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Build products
AIE_OBJECTS              = $(ABS_PATH)/aie/ip/libadf.a
BINARY_CONTAINERS       += $(BUILD_DIR)/binary_container_1.xclbin
BUILD_SUBDIRS           += $(BUILD_DIR)/binary_container_1
BINARY_CONTAINER_1_OBJS += $(BUILD_DIR)/binary_container_1/DPUCVDX8G.xo $(BUILD_DIR)/binary_container_1/libadf.a v_multi_scaler.xo
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Package RTL kernel 
VIVADO_ROOT             := $(XILINX_VIVADO)
VIVADO                  := $(VIVADO_ROOT)/bin/vivado
xvdpu_TCL                = $(ABS_PATH)/scripts/gen_xvdpu_xo.tcl
DPU_KERN_NAME            = DPUCVDX8G
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.PHONY: all
all:  files xo_multiscaler $(BINARY_CONTAINERS) $(BUILD_DIR)/dpu.xclbin
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Copy AIE's libadf.a to folder $(BUILD_SUBDIRS)
$(BUILD_DIR)/binary_container_1/libadf.a:
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Copying $(notdir $@)..."
	@mkdir -p $(@D)
	@cp aie/ip/libadf.a "$@"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Compile multiscaler kernel as XO file
IVAS_CONFIG    = ivas/ivas-accel-hw/v_multi_scaler_user_config.h
IVAS_MAKEFILE  = ivas/ivas-accel-hw/Makefile

.PHONY: xo_multiscaler
xo_multiscaler: ivas/ivas-accel-hw/xo/v_multi_scaler.xo
ivas/ivas-accel-hw/xo/v_multi_scaler.xo:
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Building $(notdir $@)"
	-@rm -rf v_multi_scaler.xo
	@cp ivas/ivas-examples/Embedded/smart_model_select/v_multi_scaler_user_config.h ivas/ivas-accel-hw
	sed -i "s/#define HSC_SAMPLES_PER_CLOCK       2/#define HSC_SAMPLES_PER_CLOCK       4/g" $(IVAS_CONFIG)
	sed -i "s/#define HSC_MAX_WIDTH               1920/#define HSC_MAX_WIDTH               3840/g" $(IVAS_CONFIG)
	sed -i "s/#define HSC_MAX_HEIGHT              1080/#define HSC_MAX_HEIGHT              2160/g" $(IVAS_CONFIG)
	sed -i "s/PLATFORM_FILE := */#PLATFORM = /g"  $(IVAS_MAKEFILE)
	sed -i "s/PLATFORM_FILE/PLATFORM/g"           $(IVAS_MAKEFILE)
	sed -i "s/MULTISCALER_FLAGS := --kernel v_multi_scaler /MULTISCALER_FLAGS := --kernel v_multi_scaler -DMULTI_SCALER_USER_CONFIG /g"  $(IVAS_MAKEFILE)
	$(MAKE) -C ivas/ivas-accel-hw all PLATFORM=$(PLATFORM)
	@cp ivas/ivas-accel-hw/xo/v_multi_scaler.xo v_multi_scaler.xo
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Compile xvdpu kernel as XO file
.PHONY: xo_xvdpu
xo_xvdpu: $(BUILD_DIR)/binary_container_1/DPUCVDX8G.xo

$(BUILD_DIR)/binary_container_1/DPUCVDX8G.xo:
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Building $(notdir $@) for $(BUILD_DIR)..."
	@mkdir -p $(@D)
	-@rm -rf $@
	$(VIVADO) -mode batch -source $(xvdpu_TCL) -tclargs $@ $(DPU_KERN_NAME) $(XCL_EMULATION_MODE) $(DEVICE)	
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Link kernel and AIE graph with Platform
$(BUILD_DIR)/binary_container_1.xclbin: $(BINARY_CONTAINER_1_OBJS)
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Building $(notdir $@) for $(BUILD_DIR)..."
	@mkdir -p $(@D)
	@$(VXX) $(VXXFLAGS) -l --config scripts/system.cfg --config scripts/xvdpu_aie_noc.cfg \
	  --clock.freqHz $(PL_FREQ):DPUCVDX8G.m_axi_aclk \
	  --clock.freqHz $(PL_FREQ):ai_engine_0.aclk0 \
	  --clock.freqHz 150000000:DPUCVDX8G.s_axi_aclk \
	  --clock.freqHz 150000000:v_multi_scaler_1.ap_clk \
	  -o "$@" $(BINARY_CONTAINER_1_OBJS)   
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Package design
.PHONY: package
package: $(BUILD_DIR)/dpu.xclbin
$(BUILD_DIR)/dpu.xclbin: $(BUILD_DIR)/binary_container_1.xclbin $(BUILD_DIR)/binary_container_1/libadf.a 
	@echo "INFO:- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	@echo "INFO:Packaging $(notdir $@) for $(BUILD_DIR)..."
	-@rm -rf package_out 
	@cd $(BUILD_DIR); $(VXX) -t $(XCL_EMULATION_MODE) --platform $(PLATFORM)  --save-temps --temp_dir binary_container_1 -p binary_container_1.xclbin binary_container_1/libadf.a -o "$@" \
	  --package.out_dir ../package_out \
	  --package.boot_mode sd \
	  --package.no_image  
	cp  $(ABS_PATH)/hw/binary_container_1/link/vivado/vpl/prj/prj.gen/sources_1/bd/*/ip/*_DPUCVDX8G_0/arch.json $(ABS_PATH)/package_out/sd_card
	@cp package_out/sd_card/BOOT.BIN vpl_gen_fixed.pdi
	@cp package_out/sd_card/dpu.xclbin binary_container_1.xclbin
	@zip -u binary_container_1.xsa vpl_gen_fixed.pdi
	@zip -u binary_container_1.xsa binary_container_1.xclbin
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Clean build products
.PHONY: clean
clean:
	-@rm -rf .Xil vivado* *.log .ipcache sample*.ini packaged_kernel_*_hw_* tmp_kernel_pack_*_hw_* 
	-@rm -rf aie scripts/kernel.xml scripts/*xvdpu_aie_noc.cfg xvdpu/hdl xvdpu/inc xvdpu/vitis_cfg xvdpu/ttcl 
	-@rm -rf hw package_out *.xsa *.pdi *.xclbin v_multi_scaler.xo
	$(MAKE) -C ivas/ivas-accel-hw/ clean
	-@rm -rf ivas/ivas-accel-hw/v_multi_scaler_user_config.h