/*
 * Copyright 2020 - 2021 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __VVAS_XFILTER2D_H__
#define __VVAS_XFILTER2D_H__

#ifdef __cplusplus
extern "C"
{
#endif

#include <vvas/vvas_kernel.h>
#include <string.h>

#define VVAS_FOURCC_YUY2 0x56595559

typedef enum
{
    VVAS_FILTER2D_PRESET_BLUR,
    VVAS_FILTER2D_PRESET_EDGE,
    VVAS_FILTER2D_PRESET_HEDGE,
    VVAS_FILTER2D_PRESET_VEDGE,
    VVAS_FILTER2D_PRESET_EMBOSS,
    VVAS_FILTER2D_PRESET_HGRAD,
    VVAS_FILTER2D_PRESET_VGRAD,
    VVAS_FILTER2D_PRESET_IDENTITY,
    VVAS_FILTER2D_PRESET_SHARPEN,
    VVAS_FILTER2D_PRESET_HSOBEL,
    VVAS_FILTER2D_PRESET_VSOBEL,
} VVASFilter2dFilterPreset;

typedef struct {
    int value;
    const char *nick;
} EnumValue;

static const EnumValue filter_presets[] = {
    {VVAS_FILTER2D_PRESET_BLUR, "blur"},
    {VVAS_FILTER2D_PRESET_EDGE, "edge"},
    {VVAS_FILTER2D_PRESET_HEDGE, "horizontal edge"},
    {VVAS_FILTER2D_PRESET_VEDGE, "vertical edge"},
    {VVAS_FILTER2D_PRESET_EMBOSS, "emboss"},
    {VVAS_FILTER2D_PRESET_HGRAD, "horizontal gradient"},
    {VVAS_FILTER2D_PRESET_VGRAD, "vertical gradient"},
    {VVAS_FILTER2D_PRESET_IDENTITY, "identity"},
    {VVAS_FILTER2D_PRESET_SHARPEN, "sharpen"},
    {VVAS_FILTER2D_PRESET_HSOBEL, "horizontal sobel"},
    {VVAS_FILTER2D_PRESET_VSOBEL, "vertical sobel"},
    {0, NULL}
};

#define KSIZE 3
typedef short int coeff_t[KSIZE][KSIZE];

static const coeff_t coeffs[] = {
    [VVAS_FILTER2D_PRESET_BLUR] = {
        {1, 1, 1},
        {1, -7, 1},
        {1, 1, 1}
    },
    [VVAS_FILTER2D_PRESET_EDGE] = {
        {0, 1, 0},
        {1, -4, 1},
        {0, 1, 0}
    },
    [VVAS_FILTER2D_PRESET_HEDGE] = {
        {0, -1, 0},
        {0, 2, 0},
        {0, -1, 0}
    },
    [VVAS_FILTER2D_PRESET_VEDGE] = {
        {0, 0, 0},
        {-1, 2, -1},
        {0, 0, 0}
    },
    [VVAS_FILTER2D_PRESET_EMBOSS] = {
        {-2, -1, 0},
        {-1, 1, 1},
        {0, 1, 2}
    },
    [VVAS_FILTER2D_PRESET_HGRAD] = {
        {-1, -1, -1},
        {0, 0, 0},
        {1, 1, 1}
    },
    [VVAS_FILTER2D_PRESET_VGRAD] = {
        {-1, 0, 1},
        {-1, 0, 1},
        {-1, 0, 1}
    },
    [VVAS_FILTER2D_PRESET_IDENTITY] = {
        {0, 0, 0},
        {0, 1, 0},
        {0, 0, 0}
    },
    [VVAS_FILTER2D_PRESET_SHARPEN] = {
        {0, -1, 0},
        {-1, 5, -1},
        {0, -1, 0}
    },
    [VVAS_FILTER2D_PRESET_HSOBEL] = {
        {1, 2, 1},
        {0, 0, 0},
        {-1, -2, -1}
    },
    [VVAS_FILTER2D_PRESET_VSOBEL] = {
        {1, 0, -1},
        {2, 0, -2},
        {1, 0, -1}
    }
};

typedef struct _kern_priv
{
    int log_level;
    uint32_t in_fourcc;
    uint32_t out_fourcc;
    const char *filter_preset;
    VVASFrame *params;
} Filter2dKernelPriv;

static inline const coeff_t *get_coeff_by_preset(const char *preset) {
    int i = 0;
    while (filter_presets[i].nick != NULL) {
        if (strcmp(preset, filter_presets[i].nick) == 0)
            return &coeffs[filter_presets[i].value];
        i++;
    }
    /* return identity if preset not matched */
    return &coeffs[VVAS_FILTER2D_PRESET_IDENTITY];
}

#define eos(s) ((s)+strlen(s))
static inline void coeff_to_str(char *s, const coeff_t c) {
    s[0] = '\0';
    sprintf(eos(s), "coeffs = ");
    for (int i=0; i<KSIZE; i++) {
        sprintf(eos(s), "[ ");
        for (int j=0; j<KSIZE; j++) {
            sprintf(eos(s), "%d ", c[i][j]);
        }
        sprintf(eos(s), "] ");
    }
}

int32_t xlnx_kernel_init(VVASKernel *handle);
uint32_t xlnx_kernel_deinit(VVASKernel *handle);
int32_t xlnx_kernel_start(VVASKernel *handle, int start, \
    VVASFrame *input[MAX_NUM_OBJECT], VVASFrame *output[MAX_NUM_OBJECT]);
int32_t xlnx_kernel_done(VVASKernel *handle);

#ifdef __cplusplus
} // extern "C"
#endif

#endif //__VVAS_XFILTER2D_H__
