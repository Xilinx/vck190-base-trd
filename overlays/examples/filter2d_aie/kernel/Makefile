WORKDIR = ./Work

TARGET_SDF = libsdf.a

PL_FREQ ?= 150
PHYDEVICE ?= xcvc1902-vsva2197-1LP-e-S-es1
CARDANO_ELF_FLAGS ?= -dataflow \
		     -genArchive=true \
		     -phydevice=$(PHYDEVICE) \
		     -pl-freq=$(PL_FREQ) \
		     -Xchess=main:backend.mist2.xargs="+NOdra" \
		     -v

IMAGE_WIDTH ?= 1280
IMAGE_HEIGHT ?= 720

CARDANO_ELF_FLAGS += -Xpreproc=-DIMAGE_WIDTH=$(IMAGE_WIDTH) \
		     -Xpreproc=-DIMAGE_HEIGHT=$(IMAGE_HEIGHT)

GRAPH = src/graph.cpp
SOURCES = $(GRAPH) src/kernels/filter2d.cc
INCLUDE_DIRS = -include="src/kernels" -include="include"
SIM_DATA = data/input.txt

.NOTPARALLEL:
$(TARGET_SDF): $(SOURCES)
	aiecompiler $(CARDANO_ELF_FLAGS) $(INCLUDE_DIRS) $(GRAPH)

.PHONY: sim
sim: $(TARGET_SDF) $(SIM_DATA)
	aiesimulator --pkg-dir=$(WORKDIR)

.PHONY: clean
clean:
	rm -rf $(WORKDIR) xnwOut *.log *.lp *.db aiesimulator_output *.xpe .Xil
	rm -rf $(notdir $(TARGET_SDF))
