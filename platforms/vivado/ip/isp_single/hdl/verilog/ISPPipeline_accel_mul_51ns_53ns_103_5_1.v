// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module ISPPipeline_accel_mul_51ns_53ns_103_5_1(clk, ce, reset, din0, din1, dout);
parameter ID = 1;
parameter NUM_STAGE = 4;
parameter din0_WIDTH = 14;
parameter din1_WIDTH = 12;
parameter dout_WIDTH = 26;
input clk;
input ce;
input reset;
input[din0_WIDTH - 1 : 0] din0; 
input[din1_WIDTH - 1 : 0] din1; 
output[dout_WIDTH - 1 : 0] dout;

reg [din0_WIDTH - 1 : 0] a_reg0;
reg [din1_WIDTH - 1 : 0] b_reg0;
wire [dout_WIDTH - 1 : 0] tmp_product;
reg [dout_WIDTH - 1 : 0] buff0;
reg [dout_WIDTH - 1 : 0] buff1;
reg [dout_WIDTH - 1 : 0] buff2;

assign dout = buff2;
assign tmp_product = a_reg0 * b_reg0;
always @ (posedge clk) begin
    if (ce) begin
        a_reg0 <= din0;
        b_reg0 <= din1;
        buff0 <= tmp_product;
        buff1 <= buff0;
        buff2 <= buff1;
    end
end
endmodule
