// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module ISPPipeline_accel_mul_48s_50ns_97_2_1(clk, ce, reset, din0, din1, dout);
parameter ID = 1;
parameter NUM_STAGE = 1;
parameter din0_WIDTH = 14;
parameter din1_WIDTH = 12;
parameter dout_WIDTH = 26;
input clk;
input ce;
input reset;
input signed [din0_WIDTH - 1 : 0] din0;
input [din1_WIDTH - 1 : 0] din1;
output[dout_WIDTH - 1 : 0] dout;
reg signed [dout_WIDTH - 1 : 0] dout;
wire signed [dout_WIDTH - 1 : 0] tmp_product;

assign tmp_product = $signed(din0) * $signed({1'b0, din1});
always @ (posedge clk) begin
    if (ce) begin
        dout <= tmp_product;
    end
end
endmodule
