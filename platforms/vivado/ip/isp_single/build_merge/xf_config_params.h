// Copyright (C) 2022, Advanced Micro Devices, Inc.

#define NO 1 // Normal Operation
#define RO 0 // Resource Optimized

#define T_8U 0
#define T_16U 0
#define T_10U 1
#define T_12U 0

// Set the input and output pixel depth:
#if T_16U
#define IN_TYPE XF_16UC1
#define OUT_TYPE XF_16UC1
#define SIN_CHANNEL_TYPE XF_16UC1
#endif

#if T_10U
#define IN_TYPE XF_10UC1
#define OUT_TYPE XF_10UC1
#define SIN_CHANNEL_TYPE XF_10UC1
#endif

#if T_8U
#define IN_TYPE XF_8UC1
#define OUT_TYPE XF_8UC1
#define SIN_CHANNEL_TYPE XF_8UC1
#endif

#if T_12U
#define IN_TYPE XF_12UC1
#define OUT_TYPE XF_12UC1
#define SIN_CHANNEL_TYPE XF_12UC1
#endif

#define INPUT_PTR_WIDTH 64
#define OUTPUT_PTR_WIDTH 64

#define HEIGHT 2160
#define WIDTH 3840

#define NO_EXPS 2

#define NPIX XF_NPPC4
#define XF_CV_DEPTH_IN_1 3
#define XF_CV_DEPTH_IN_2 3
#define XF_CV_DEPTH_OUT 3
