// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xisppipeline_accel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XIsppipeline_accel_CfgInitialize(XIsppipeline_accel *InstancePtr, XIsppipeline_accel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XIsppipeline_accel_Start(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL) & 0x80;
    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XIsppipeline_accel_IsDone(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XIsppipeline_accel_IsIdle(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XIsppipeline_accel_IsReady(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XIsppipeline_accel_EnableAutoRestart(XIsppipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL, 0x80);
}

void XIsppipeline_accel_DisableAutoRestart(XIsppipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_AP_CTRL, 0);
}

void XIsppipeline_accel_Set_width(XIsppipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_WIDTH_DATA, Data);
}

u32 XIsppipeline_accel_Get_width(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_WIDTH_DATA);
    return Data;
}

void XIsppipeline_accel_Set_height(XIsppipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_HEIGHT_DATA, Data);
}

u32 XIsppipeline_accel_Get_height(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_HEIGHT_DATA);
    return Data;
}

void XIsppipeline_accel_Set_mode_reg(XIsppipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_MODE_REG_DATA, Data);
}

u32 XIsppipeline_accel_Get_mode_reg(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_MODE_REG_DATA);
    return Data;
}

void XIsppipeline_accel_Set_rgain(XIsppipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_RGAIN_DATA, Data);
}

u32 XIsppipeline_accel_Get_rgain(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_RGAIN_DATA);
    return Data;
}

void XIsppipeline_accel_Set_bgain(XIsppipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_BGAIN_DATA, Data);
}

u32 XIsppipeline_accel_Get_bgain(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_BGAIN_DATA);
    return Data;
}

void XIsppipeline_accel_Set_pawb(XIsppipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_PAWB_DATA, Data);
}

u32 XIsppipeline_accel_Get_pawb(XIsppipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_PAWB_DATA);
    return Data;
}

u32 XIsppipeline_accel_Get_gamma_lut_BaseAddress(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE);
}

u32 XIsppipeline_accel_Get_gamma_lut_HighAddress(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_HIGH);
}

u32 XIsppipeline_accel_Get_gamma_lut_TotalBytes(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_HIGH - XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + 1);
}

u32 XIsppipeline_accel_Get_gamma_lut_BitWidth(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XISPPIPELINE_ACCEL_CTRL_WIDTH_GAMMA_LUT;
}

u32 XIsppipeline_accel_Get_gamma_lut_Depth(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XISPPIPELINE_ACCEL_CTRL_DEPTH_GAMMA_LUT;
}

u32 XIsppipeline_accel_Write_gamma_lut_Words(XIsppipeline_accel *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_HIGH - XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Ctrl_BaseAddress + XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XIsppipeline_accel_Read_gamma_lut_Words(XIsppipeline_accel *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_HIGH - XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Ctrl_BaseAddress + XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + (offset + i)*4);
    }
    return length;
}

u32 XIsppipeline_accel_Write_gamma_lut_Bytes(XIsppipeline_accel *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_HIGH - XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Ctrl_BaseAddress + XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XIsppipeline_accel_Read_gamma_lut_Bytes(XIsppipeline_accel *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_HIGH - XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Ctrl_BaseAddress + XISPPIPELINE_ACCEL_CTRL_ADDR_GAMMA_LUT_BASE + offset + i);
    }
    return length;
}

void XIsppipeline_accel_InterruptGlobalEnable(XIsppipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_GIE, 1);
}

void XIsppipeline_accel_InterruptGlobalDisable(XIsppipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_GIE, 0);
}

void XIsppipeline_accel_InterruptEnable(XIsppipeline_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_IER);
    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_IER, Register | Mask);
}

void XIsppipeline_accel_InterruptDisable(XIsppipeline_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_IER);
    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_IER, Register & (~Mask));
}

void XIsppipeline_accel_InterruptClear(XIsppipeline_accel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIsppipeline_accel_WriteReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_ISR, Mask);
}

u32 XIsppipeline_accel_InterruptGetEnabled(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_IER);
}

u32 XIsppipeline_accel_InterruptGetStatus(XIsppipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XIsppipeline_accel_ReadReg(InstancePtr->Ctrl_BaseAddress, XISPPIPELINE_ACCEL_CTRL_ADDR_ISR);
}

