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

#ifndef _XF_FILTER2D_AIE_CONFIG_H_
#define _XF_FILTER2D_AIE_CONFIG_H_

#include <iostream>

#include "ap_axi_sdata.h"
#include "hls_stream.h"

#define keepsize(n) (1 << n)
#define keepval(n) (keepsize(n) - 1)

const int DW = 128;            // data width
const ap_uint<64> KW = DW / 8; // keep width

typedef hls::stream<ap_axis<DW, 0, 0, 0> > axi_stream;
typedef hls::stream<ap_uint<64> > axi_stream_uv;

// octuple
typedef ap_uint<256> oint;
// Quadruple
typedef ap_uint<128> qint;
// double
typedef ap_uint<64> dint;

extern "C" void filter2d_aie_accel(qint* frm_in,
                                   qint* frm_out,
                                   int rows,
                                   int cols,
                                   int fourcc_in,
                                   int fourcc_out,
                                   axi_stream& strm_out,
                                   axi_stream& strm_in);

extern "C" void copy_stream_dummy(axi_stream_uv& src, axi_stream_uv& dst, ap_uint<32> pcnt);
extern "C" void write_f2d_output(
    axi_stream& strm_in, axi_stream_uv& uv_in, qint* frm_out, ap_uint<32> fourcc, ap_uint<32> pcnt);
extern "C" void read_f2d_input(
    qint* frm_in, axi_stream& strm_out, axi_stream_uv& uv_out, ap_uint<32> fourcc, ap_uint<32> pcnt);

#endif // end of _XF_FILTER2D_AIE_CONFIG_H_
