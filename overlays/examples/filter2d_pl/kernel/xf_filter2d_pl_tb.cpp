/*
 * Copyright 2020 Xilinx, Inc.
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

#include "xf_filter2d_pl_config.h"

#include <assert.h>
#include <iostream>
#include <stdio.h>
#include <string.h>

int main() {
    int i;
    int j;
    int p;

    const int DI = (1280 * 720 * 2) / 16;
    const int DO = (1280 * 720 * 2) / 16;

    ap_uint<128> frm_in_1[DI];
    ap_uint<128> frm_out[DO];

    int16_t kernel[9];

    ap_uint<8> d0 = 0xAD;
    ap_uint<8> d1 = 0x2A;
    ap_uint<8> d2 = 0xAD;
    ap_uint<8> d3 = 0X1A;
    ap_uint<32> mask = 0xFFFFFFFF;
    ap_uint<128> pixs;

    ap_uint<8> dout[16];
    char tmp;
    char tmphex[16];
    char buffer[2048];
    uint tmp1;
    uint tmp2;

    int fourcc_in = 0x56595559;
    int fourcc_out = 0x56595559;

    kernel[0] = 1;
    kernel[1] = 0;
    kernel[2] = 0;
    kernel[3] = 0;
    kernel[4] = 1;
    kernel[5] = 0;
    kernel[6] = 0;
    kernel[7] = 0;
    kernel[8] = 1;


    for (j = 0; j < DI; j++) {
        for (p = 0; p < 4; p++) {
            pixs(31 + p * 32, p * 32) = (d3, d2, d1, d0);
        }
        frm_in_1[j] = pixs;

        if (j < 8) {
            std::cout << "frm_in = " << std::hex << pixs << std::endl;
        }
    }
    // Call the hardware function
    filter2d_pl_accel(frm_in_1, frm_out, kernel, 720, 1280, fourcc_in, fourcc_out);

    for (i = 0; i < DO; i++) {

        if (i < 8) {
             std::cout << "frm_out = " << std::hex << frm_out[i] << std::endl;
         }
    }

}
