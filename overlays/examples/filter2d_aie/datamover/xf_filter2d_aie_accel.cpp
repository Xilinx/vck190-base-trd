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

#define V4L2_PIX_FMT_YUYV 0x56595559
#define WIDTH 3840
#define HEIGHT 2160
#define PPC 8

extern "C" {
void read_f2d_input(qint* frm_in, axi_stream& strm_out, axi_stream_uv& uv_out, ap_uint<32> fourcc, ap_uint<32> pcnt) {
    ap_axis<DW, 0, 0, 0> inLuma;
    ap_uint<64> inUV;

    ap_uint<16> lumamask = (V4L2_PIX_FMT_YUYV == fourcc) ? 0x00FF : 0xFF00;
    ap_uint<16> lumashift = (V4L2_PIX_FMT_YUYV == fourcc) ? 0 : 8;
    ap_uint<16> chromamask = (V4L2_PIX_FMT_YUYV == fourcc) ? 0xFF00 : 0x00FF;
    ap_uint<16> chromashift = (V4L2_PIX_FMT_YUYV == fourcc) ? 8 : 0;
    ap_uint<32> steps = pcnt / PPC;

read_loop:
    for (ap_uint<32> i = 0; i < steps; i++) {
// clang-format off
#pragma HLS pipeline II = 1
// clang-format on

        qint pixels = frm_in[i];
        oint ytmp = 0;
        dint uvtmp = 0;

    read_loop_inner:
        for (ap_uint<4> j = 0; j < PPC; j++) {
            oint ypix = (pixels & lumamask) >> lumashift;
            dint uvpix = (pixels & chromamask) >> chromashift;
            // padding ypix upto 32 bits as AIE kernel needs 32-bits per pixel
            ytmp |= ypix << (32 * j);
            uvtmp |= uvpix << (8 * j);

            pixels >>= 16;
        }

        // Converting 256-bit data to 128-bit as max axi stream width on AIE is 128-bit
        inLuma.data = ytmp;
        inLuma.keep = keepval(KW);
        inLuma.last = 0;
        strm_out.write(inLuma);

        ytmp >>= 128;
        inLuma.data = ytmp;
        inLuma.keep = keepval(KW);
        if (i == steps - 1)
            inLuma.last = 1;
        else
            inLuma.last = 0;
        strm_out.write(inLuma);

        inUV = uvtmp;
        uv_out.write(inUV);
    }
}

void write_f2d_output(axi_stream& strm_in, axi_stream_uv& uv_in, qint* frm_out, ap_uint<32> fourcc, ap_uint<32> pcnt) {
    ap_axis<DW, 0, 0, 0> outLuma;
    ap_uint<64> outUV;

    ap_uint<16> lumashift = (V4L2_PIX_FMT_YUYV == fourcc) ? 0 : 8;
    ap_uint<16> chromashift = (V4L2_PIX_FMT_YUYV == fourcc) ? 8 : 0;
    ap_uint<32> steps = pcnt / PPC;

write_loop:
    for (ap_uint<32> i = 0; i < steps; i++) {
// clang-format off
#pragma HLS pipeline II = 1
// clang-format on
        // Converting 128-bit to 256-bit
        outLuma = strm_in.read();
        oint ypixels = outLuma.data;
        outLuma = strm_in.read();
        oint ypixels2 = outLuma.data;
        ypixels |= ypixels2 << 128;

        outUV = uv_in.read();
        qint uvpixels = outUV;
        qint pixels = 0;

    write_loop_inner:
        for (ap_uint<4> j = 0; j < PPC; j++) {
            qint ytmp = (ypixels & 0xFF) << lumashift;
            qint uvtmp = (uvpixels & 0xFF) << chromashift;

            pixels |= ((ytmp | uvtmp) << (16 * j));

            ypixels >>= 32;
            uvpixels >>= 8;
        }

        frm_out[i] = pixels;
    }

}

void copy_stream_dummy(axi_stream_uv& src, axi_stream_uv& dst, ap_uint<32> pcnt) {
    ap_uint<64> copy;
    ap_uint<32> steps = pcnt / PPC;

copy_stream_loop:
    for (ap_uint<32> i = 0; i < steps; i++) {
// clang-format off
#pragma HLS pipeline II = 1
// clang-format on
        copy = src.read();
        dst.write(copy);
    }
}

void filter2d_aie_accel(qint* frm_in,
                        qint* frm_out,
                        int rows,
                        int cols,
                        int fourcc_in,
                        int fourcc_out,
                        axi_stream& strm_out,
                        axi_stream& strm_in) {

// clang-format off
#pragma HLS INTERFACE m_axi port = frm_in offset = slave bundle = gmem1 depth = 115200 max_read_burst_length = 256
#pragma HLS INTERFACE m_axi port = frm_out offset = slave bundle = gmem2 depth = 115200 max_read_burst_length = 256

#pragma HLS INTERFACE axis port = strm_in
#pragma HLS INTERFACE axis port = strm_out

#pragma HLS INTERFACE s_axilite port = frm_in bundle = control
#pragma HLS INTERFACE s_axilite port = frm_out bundle = control

#pragma HLS INTERFACE s_axilite port = rows bundle = control
#pragma HLS INTERFACE s_axilite port = cols bundle = control
#pragma HLS INTERFACE s_axilite port = fourcc_in bundle = control
#pragma HLS INTERFACE s_axilite port = fourcc_out bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control
// clang-format on


    const int pCOLS = WIDTH / PPC;
    const int pCOLSD = (WIDTH * 2) / PPC;

    ap_uint<32> pcnt = rows * cols;
    axi_stream_uv uv("uv");
    axi_stream_uv uv_copy("uv_copy");

// clang-format off
#pragma HLS stream variable = uv depth = pCOLSD
#pragma HLS stream variable = uv_copy depth = pCOLSD
#pragma HLS stream variable = strm_in depth = pCOLS
#pragma HLS stream variable = strm_out depth = pCOLS
#pragma HLS DATAFLOW
// clang-format on

    // Frame in - Split into Luma(strm_out) and Chroma(uv)
    // strm_out goes to AIE filter
    read_f2d_input((qint*)frm_in, strm_out, uv, fourcc_in, pcnt);

    // Create a FIFO for Chroma
    copy_stream_dummy(uv, uv_copy, pcnt);

    // Frame out - Merge Luma(strm_in) and Chroma(uv_copy)
    // strm_in from AIE filter
    write_f2d_output(strm_in, uv_copy, (qint*)frm_out, fourcc_out, pcnt);
}
}
