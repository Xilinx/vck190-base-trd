WORKDIR = ./Work

TARGET_ADF = libadf.a

PL_FREQ ?= 400
PHYDEVICE ?= xcvc1902-vsva2197-1LP-e-S-es1
CARDANO_ELF_FLAGS ?= -dataflow \
		     -genArchive=true \
		     -phydevice=$(PHYDEVICE) \
		     -pl-freq=$(PL_FREQ) \
		     -v


VITIS_LIB = ../../../Vitis_Libraries/vision/
GRAPH = $(VITIS_LIB)/L2/tests/aie/Filter2D/16bit_aie_8bit_pl/graph.cpp
SOURCES = $(GRAPH) $(VITIS_LIB)/L2/tests/aie/Filter2D/16bit_aie_8bit_pl/xf_filter2d.cc
INCLUDE_DIRS = -include="$(VITIS_LIB)/L2/tests/aie/Filter2D/16bit_aie_8bit_pl" \
               -include="$(VITIS_LIB)/L1/include/aie" \
               
.NOTPARALLEL:
$(TARGET_ADF): $(SOURCES)
	aiecompiler $(CARDANO_ELF_FLAGS) $(INCLUDE_DIRS) $(GRAPH)

.PHONY: clean
clean:
	rm -rf $(WORKDIR) xnwOut *.log *.lp *.db aiesimulator_output *.xpe .Xil
	rm -rf $(notdir $(TARGET_ADF))
