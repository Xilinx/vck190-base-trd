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

#include "xf_filter2d_aie_config.h"

#include <assert.h>
#include <iostream>
#include <stdio.h>
#include <string.h>

int main() {
    int i;
    int j;
    int p;
    int count;

    const int DI = (1280 * 720 * 2) / 16;
    const int DO = (1280 * 720 * 2) / 16; // 16 bytes/128 bits per clock
    const int scnt = (1280 *  720) / 4; // 4 pixels per clock

    ap_uint<128> frm_in_1[DI];
    ap_uint<128> frm_out[DO];

    ap_uint<8> d0 = 0xAD;
    ap_uint<8> d1 = 0x2A;
    ap_uint<8> d2 = 0xAD;
    ap_uint<8> d3 = 0X1A;
    ap_uint<32> sd0 = 0xAD;
    ap_uint<32> mask = 0xFFFFFFFF;
    ap_uint<128> pixs;

    ap_uint<8> dout[16];
    char tmp;
    char tmphex[16];
    FILE* infile;
    FILE* fp1;
    FILE* fp2;
    char buffer[2048];
    uint tmp1;
    uint tmp2;

    int fourcc_in = 0x56595559;
    int fourcc_out = 0x56595559;
    axi_stream strm_out;
    axi_stream strm_in;
    ap_axis<128, 0, 0, 0> data_strm2;
    count = 0;



    for (j = 0; j < DI; j++) {
        for (p = 0; p < 4; p++) {
            pixs(31 + p * 32, p * 32) = (d3, d2, d1, d0);
        }
        frm_in_1[j] = pixs;

        if (j < 8) {
            std::cout << "frm_in = " << std::hex << pixs << std::endl;
        }
    }

    data_strm2.data = (sd0, sd0, sd0, sd0);
    data_strm2.keep = 0xffff;
    data_strm2.strb = 0xffff;
    data_strm2.last = 0;


   for (j = 0;  j < scnt; j++){
	   	   if (j == scnt-1)
	   		   data_strm2.last = 1;
           strm_in.write(data_strm2);
    	   	   if (j < 8) {
    	   		   std::cout << "strm_in = " << std::hex << data_strm2.data << std::endl;
               }
   }


    // Call the hardware function
    filter2d_aie_accel(frm_in_1, frm_out, 720, 1280, fourcc_in, fourcc_out, strm_out, strm_in);

    for (i = 0; i < DO; i++) {

        if (i < 8) {
             std::cout << "frm_out = " << std::hex << frm_out[i] << std::endl;
         }
    }

 }


