// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.2
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Core_Process (
        ap_clk,
        ap_rst,
        imgblock_0_0_V_read,
        imgblock_0_1_V_read,
        imgblock_0_2_V_read,
        imgblock_0_3_V_read,
        imgblock_0_4_V_read,
        imgblock_0_5_V_read,
        imgblock_1_0_V_read,
        imgblock_1_1_V_read,
        imgblock_1_2_V_read,
        imgblock_1_3_V_read,
        imgblock_1_4_V_read,
        imgblock_1_5_V_read,
        imgblock_2_0_V_read,
        imgblock_2_1_V_read,
        imgblock_2_2_V_read,
        imgblock_2_3_V_read,
        imgblock_2_4_V_read,
        imgblock_2_5_V_read,
        imgblock_3_0_V_read,
        imgblock_3_1_V_read,
        imgblock_3_2_V_read,
        imgblock_3_3_V_read,
        imgblock_3_4_V_read,
        imgblock_3_5_V_read,
        imgblock_4_0_V_read,
        imgblock_4_1_V_read,
        imgblock_4_2_V_read,
        imgblock_4_3_V_read,
        imgblock_4_4_V_read,
        imgblock_4_5_V_read,
        row,
        col,
        loop_r,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [9:0] imgblock_0_0_V_read;
input  [9:0] imgblock_0_1_V_read;
input  [9:0] imgblock_0_2_V_read;
input  [9:0] imgblock_0_3_V_read;
input  [9:0] imgblock_0_4_V_read;
input  [9:0] imgblock_0_5_V_read;
input  [9:0] imgblock_1_0_V_read;
input  [9:0] imgblock_1_1_V_read;
input  [9:0] imgblock_1_2_V_read;
input  [9:0] imgblock_1_3_V_read;
input  [9:0] imgblock_1_4_V_read;
input  [9:0] imgblock_1_5_V_read;
input  [9:0] imgblock_2_0_V_read;
input  [9:0] imgblock_2_1_V_read;
input  [9:0] imgblock_2_2_V_read;
input  [9:0] imgblock_2_3_V_read;
input  [9:0] imgblock_2_4_V_read;
input  [9:0] imgblock_2_5_V_read;
input  [9:0] imgblock_3_0_V_read;
input  [9:0] imgblock_3_1_V_read;
input  [9:0] imgblock_3_2_V_read;
input  [9:0] imgblock_3_3_V_read;
input  [9:0] imgblock_3_4_V_read;
input  [9:0] imgblock_3_5_V_read;
input  [9:0] imgblock_4_0_V_read;
input  [9:0] imgblock_4_1_V_read;
input  [9:0] imgblock_4_2_V_read;
input  [9:0] imgblock_4_3_V_read;
input  [9:0] imgblock_4_4_V_read;
input  [9:0] imgblock_4_5_V_read;
input  [15:0] row;
input  [15:0] col;
input  [0:0] loop_r;
output  [31:0] ap_return_0;
output  [31:0] ap_return_1;
output  [31:0] ap_return_2;
input   ap_ce;

reg[31:0] ap_return_0;
reg[31:0] ap_return_1;
reg[31:0] ap_return_2;

wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] trunc_ln189_fu_597_p1;
reg   [0:0] trunc_ln189_reg_1019;
reg   [0:0] trunc_ln189_reg_1019_pp0_iter1_reg;
reg   [0:0] trunc_ln189_reg_1019_pp0_iter2_reg;
wire   [0:0] trunc_ln190_fu_601_p1;
reg   [0:0] trunc_ln190_reg_1023;
reg   [0:0] trunc_ln190_reg_1023_pp0_iter1_reg;
reg   [0:0] trunc_ln190_reg_1023_pp0_iter2_reg;
wire   [9:0] tmp_60_fu_617_p8;
reg   [9:0] tmp_60_reg_1027;
reg   [9:0] tmp_60_reg_1027_pp0_iter1_reg;
reg   [9:0] tmp_60_reg_1027_pp0_iter2_reg;
wire   [9:0] tmp_59_fu_647_p8;
reg   [9:0] tmp_59_reg_1032;
reg   [9:0] tmp_59_reg_1032_pp0_iter1_reg;
reg   [9:0] tmp_59_reg_1032_pp0_iter2_reg;
wire   [9:0] tmp_58_fu_677_p8;
reg   [9:0] tmp_58_reg_1037;
reg   [9:0] tmp_58_reg_1037_pp0_iter1_reg;
reg   [9:0] tmp_58_reg_1037_pp0_iter2_reg;
wire   [9:0] tmp_57_fu_707_p8;
reg   [9:0] tmp_57_reg_1042;
reg   [9:0] tmp_57_reg_1042_pp0_iter1_reg;
reg   [9:0] tmp_57_reg_1042_pp0_iter2_reg;
wire   [13:0] grp_rgb_bgr_kernel_fu_325_ap_return;
reg    grp_rgb_bgr_kernel_fu_325_ap_ce;
reg    ap_predicate_op42_call_state1;
reg    ap_predicate_op62_call_state1;
wire    ap_block_state1_pp0_stage0_iter0_ignore_call0;
wire    ap_block_state2_pp0_stage0_iter1_ignore_call0;
wire    ap_block_state3_pp0_stage0_iter2_ignore_call0;
wire    ap_block_state4_pp0_stage0_iter3_ignore_call0;
wire    ap_block_pp0_stage0_11001_ignoreCallOp42;
wire   [13:0] grp_rgr_bgb_kernel_fu_393_ap_return;
reg    grp_rgr_bgb_kernel_fu_393_ap_ce;
reg    ap_predicate_op46_call_state1;
reg    ap_predicate_op58_call_state1;
wire    ap_block_state1_pp0_stage0_iter0_ignore_call5;
wire    ap_block_state2_pp0_stage0_iter1_ignore_call5;
wire    ap_block_state3_pp0_stage0_iter2_ignore_call5;
wire    ap_block_state4_pp0_stage0_iter3_ignore_call5;
wire    ap_block_pp0_stage0_11001_ignoreCallOp46;
wire   [13:0] grp_rb_kernel_fu_461_ap_return;
reg    grp_rb_kernel_fu_461_ap_ce;
reg    ap_predicate_op51_call_state1;
reg    ap_predicate_op57_call_state1;
wire    ap_block_pp0_stage0_11001_ignoreCallOp51;
wire   [13:0] grp_g_kernel_ap_uint_6_s_fu_529_ap_return;
reg    grp_g_kernel_ap_uint_6_s_fu_529_ap_ce;
reg    ap_predicate_op50_call_state1;
reg    ap_predicate_op56_call_state1;
wire    ap_block_state1_pp0_stage0_iter0_ignore_call4;
wire    ap_block_state2_pp0_stage0_iter1_ignore_call4;
wire    ap_block_state3_pp0_stage0_iter2_ignore_call4;
wire    ap_block_state4_pp0_stage0_iter3_ignore_call4;
wire    ap_block_pp0_stage0_11001_ignoreCallOp50;
reg   [13:0] ap_phi_mux_b_write_assign_phi_fu_289_p8;
wire   [13:0] ap_phi_reg_pp0_iter3_b_write_assign_reg_286;
wire   [13:0] zext_ln202_fu_733_p1;
reg   [13:0] ap_phi_mux_g_write_assign_phi_fu_302_p8;
wire   [13:0] zext_ln193_fu_725_p1;
wire   [13:0] ap_phi_reg_pp0_iter3_g_write_assign_reg_299;
wire   [13:0] zext_ln207_fu_737_p1;
reg   [13:0] ap_phi_mux_r_write_assign_phi_fu_315_p8;
wire   [13:0] ap_phi_reg_pp0_iter3_r_write_assign_reg_312;
wire   [13:0] zext_ln196_fu_729_p1;
wire    ap_block_pp0_stage0;
wire   [1:0] or_ln544_3_fu_605_p3;
wire   [2:0] tmp_60_fu_617_p7;
wire   [1:0] or_ln544_2_fu_635_p3;
wire   [2:0] tmp_59_fu_647_p7;
wire   [1:0] or_ln544_1_fu_665_p3;
wire   [2:0] tmp_58_fu_677_p7;
wire   [1:0] or_ln_fu_695_p3;
wire   [2:0] tmp_57_fu_707_p7;
wire  signed [31:0] sext_ln121_fu_741_p1;
wire  signed [31:0] sext_ln121_1_fu_745_p1;
wire  signed [31:0] sext_ln121_2_fu_749_p1;
reg    ap_ce_reg;
reg   [9:0] imgblock_0_0_V_read_int_reg;
reg   [9:0] imgblock_0_1_V_read_int_reg;
reg   [9:0] imgblock_0_2_V_read_int_reg;
reg   [9:0] imgblock_0_3_V_read_int_reg;
reg   [9:0] imgblock_0_4_V_read_int_reg;
reg   [9:0] imgblock_0_5_V_read_int_reg;
reg   [9:0] imgblock_1_0_V_read_int_reg;
reg   [9:0] imgblock_1_1_V_read_int_reg;
reg   [9:0] imgblock_1_2_V_read_int_reg;
reg   [9:0] imgblock_1_3_V_read_int_reg;
reg   [9:0] imgblock_1_4_V_read_int_reg;
reg   [9:0] imgblock_1_5_V_read_int_reg;
reg   [9:0] imgblock_2_0_V_read_int_reg;
reg   [9:0] imgblock_2_1_V_read_int_reg;
reg   [9:0] imgblock_2_2_V_read_int_reg;
reg   [9:0] imgblock_2_3_V_read_int_reg;
reg   [9:0] imgblock_2_4_V_read_int_reg;
reg   [9:0] imgblock_2_5_V_read_int_reg;
reg   [9:0] imgblock_3_0_V_read_int_reg;
reg   [9:0] imgblock_3_1_V_read_int_reg;
reg   [9:0] imgblock_3_2_V_read_int_reg;
reg   [9:0] imgblock_3_3_V_read_int_reg;
reg   [9:0] imgblock_3_4_V_read_int_reg;
reg   [9:0] imgblock_3_5_V_read_int_reg;
reg   [9:0] imgblock_4_0_V_read_int_reg;
reg   [9:0] imgblock_4_1_V_read_int_reg;
reg   [9:0] imgblock_4_2_V_read_int_reg;
reg   [9:0] imgblock_4_3_V_read_int_reg;
reg   [9:0] imgblock_4_4_V_read_int_reg;
reg   [9:0] imgblock_4_5_V_read_int_reg;
reg   [15:0] row_int_reg;
reg   [15:0] col_int_reg;
reg   [0:0] loop_r_int_reg;
reg   [31:0] ap_return_0_int_reg;
reg   [31:0] ap_return_1_int_reg;
reg   [31:0] ap_return_2_int_reg;

rgb_bgr_kernel grp_rgb_bgr_kernel_fu_325(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .imgblock_0_0_V_read(imgblock_0_0_V_read_int_reg),
    .imgblock_0_1_V_read(imgblock_0_1_V_read_int_reg),
    .imgblock_0_2_V_read(imgblock_0_2_V_read_int_reg),
    .imgblock_0_3_V_read(imgblock_0_3_V_read_int_reg),
    .imgblock_0_4_V_read(imgblock_0_4_V_read_int_reg),
    .imgblock_0_5_V_read(imgblock_0_5_V_read_int_reg),
    .imgblock_1_0_V_read(imgblock_1_0_V_read_int_reg),
    .imgblock_1_1_V_read(imgblock_1_1_V_read_int_reg),
    .imgblock_1_2_V_read(imgblock_1_2_V_read_int_reg),
    .imgblock_1_3_V_read(imgblock_1_3_V_read_int_reg),
    .imgblock_1_4_V_read(imgblock_1_4_V_read_int_reg),
    .imgblock_1_5_V_read(imgblock_1_5_V_read_int_reg),
    .imgblock_2_0_V_read(imgblock_2_0_V_read_int_reg),
    .imgblock_2_1_V_read(imgblock_2_1_V_read_int_reg),
    .imgblock_2_2_V_read(imgblock_2_2_V_read_int_reg),
    .imgblock_2_3_V_read(imgblock_2_3_V_read_int_reg),
    .imgblock_2_4_V_read(imgblock_2_4_V_read_int_reg),
    .imgblock_2_5_V_read(imgblock_2_5_V_read_int_reg),
    .imgblock_3_0_V_read(imgblock_3_0_V_read_int_reg),
    .imgblock_3_1_V_read(imgblock_3_1_V_read_int_reg),
    .imgblock_3_2_V_read(imgblock_3_2_V_read_int_reg),
    .imgblock_3_3_V_read(imgblock_3_3_V_read_int_reg),
    .imgblock_3_4_V_read(imgblock_3_4_V_read_int_reg),
    .imgblock_3_5_V_read(imgblock_3_5_V_read_int_reg),
    .imgblock_4_0_V_read(imgblock_4_0_V_read_int_reg),
    .imgblock_4_1_V_read(imgblock_4_1_V_read_int_reg),
    .imgblock_4_2_V_read(imgblock_4_2_V_read_int_reg),
    .imgblock_4_3_V_read(imgblock_4_3_V_read_int_reg),
    .imgblock_4_4_V_read(imgblock_4_4_V_read_int_reg),
    .imgblock_4_5_V_read(imgblock_4_5_V_read_int_reg),
    .loop_r(loop_r_int_reg),
    .ap_return(grp_rgb_bgr_kernel_fu_325_ap_return),
    .ap_ce(grp_rgb_bgr_kernel_fu_325_ap_ce)
);

rgr_bgb_kernel grp_rgr_bgb_kernel_fu_393(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .imgblock_0_0_V_read(imgblock_0_0_V_read_int_reg),
    .imgblock_0_1_V_read(imgblock_0_1_V_read_int_reg),
    .imgblock_0_2_V_read(imgblock_0_2_V_read_int_reg),
    .imgblock_0_3_V_read(imgblock_0_3_V_read_int_reg),
    .imgblock_0_4_V_read(imgblock_0_4_V_read_int_reg),
    .imgblock_0_5_V_read(imgblock_0_5_V_read_int_reg),
    .imgblock_1_0_V_read(imgblock_1_0_V_read_int_reg),
    .imgblock_1_1_V_read(imgblock_1_1_V_read_int_reg),
    .imgblock_1_2_V_read(imgblock_1_2_V_read_int_reg),
    .imgblock_1_3_V_read(imgblock_1_3_V_read_int_reg),
    .imgblock_1_4_V_read(imgblock_1_4_V_read_int_reg),
    .imgblock_1_5_V_read(imgblock_1_5_V_read_int_reg),
    .imgblock_2_0_V_read(imgblock_2_0_V_read_int_reg),
    .imgblock_2_1_V_read(imgblock_2_1_V_read_int_reg),
    .imgblock_2_2_V_read(imgblock_2_2_V_read_int_reg),
    .imgblock_2_3_V_read(imgblock_2_3_V_read_int_reg),
    .imgblock_2_4_V_read(imgblock_2_4_V_read_int_reg),
    .imgblock_2_5_V_read(imgblock_2_5_V_read_int_reg),
    .imgblock_3_0_V_read(imgblock_3_0_V_read_int_reg),
    .imgblock_3_1_V_read(imgblock_3_1_V_read_int_reg),
    .imgblock_3_2_V_read(imgblock_3_2_V_read_int_reg),
    .imgblock_3_3_V_read(imgblock_3_3_V_read_int_reg),
    .imgblock_3_4_V_read(imgblock_3_4_V_read_int_reg),
    .imgblock_3_5_V_read(imgblock_3_5_V_read_int_reg),
    .imgblock_4_0_V_read(imgblock_4_0_V_read_int_reg),
    .imgblock_4_1_V_read(imgblock_4_1_V_read_int_reg),
    .imgblock_4_2_V_read(imgblock_4_2_V_read_int_reg),
    .imgblock_4_3_V_read(imgblock_4_3_V_read_int_reg),
    .imgblock_4_4_V_read(imgblock_4_4_V_read_int_reg),
    .imgblock_4_5_V_read(imgblock_4_5_V_read_int_reg),
    .loop_r(loop_r_int_reg),
    .ap_return(grp_rgr_bgb_kernel_fu_393_ap_return),
    .ap_ce(grp_rgr_bgb_kernel_fu_393_ap_ce)
);

rb_kernel grp_rb_kernel_fu_461(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .imgblock_0_0_V_read(imgblock_0_0_V_read_int_reg),
    .imgblock_0_1_V_read(imgblock_0_1_V_read_int_reg),
    .imgblock_0_2_V_read(imgblock_0_2_V_read_int_reg),
    .imgblock_0_3_V_read(imgblock_0_3_V_read_int_reg),
    .imgblock_0_4_V_read(imgblock_0_4_V_read_int_reg),
    .imgblock_0_5_V_read(imgblock_0_5_V_read_int_reg),
    .imgblock_1_0_V_read(imgblock_1_0_V_read_int_reg),
    .imgblock_1_1_V_read(imgblock_1_1_V_read_int_reg),
    .imgblock_1_2_V_read(imgblock_1_2_V_read_int_reg),
    .imgblock_1_3_V_read(imgblock_1_3_V_read_int_reg),
    .imgblock_1_4_V_read(imgblock_1_4_V_read_int_reg),
    .imgblock_1_5_V_read(imgblock_1_5_V_read_int_reg),
    .imgblock_2_0_V_read(imgblock_2_0_V_read_int_reg),
    .imgblock_2_1_V_read(imgblock_2_1_V_read_int_reg),
    .imgblock_2_2_V_read(imgblock_2_2_V_read_int_reg),
    .imgblock_2_3_V_read(imgblock_2_3_V_read_int_reg),
    .imgblock_2_4_V_read(imgblock_2_4_V_read_int_reg),
    .imgblock_2_5_V_read(imgblock_2_5_V_read_int_reg),
    .imgblock_3_0_V_read(imgblock_3_0_V_read_int_reg),
    .imgblock_3_1_V_read(imgblock_3_1_V_read_int_reg),
    .imgblock_3_2_V_read(imgblock_3_2_V_read_int_reg),
    .imgblock_3_3_V_read(imgblock_3_3_V_read_int_reg),
    .imgblock_3_4_V_read(imgblock_3_4_V_read_int_reg),
    .imgblock_3_5_V_read(imgblock_3_5_V_read_int_reg),
    .imgblock_4_0_V_read(imgblock_4_0_V_read_int_reg),
    .imgblock_4_1_V_read(imgblock_4_1_V_read_int_reg),
    .imgblock_4_2_V_read(imgblock_4_2_V_read_int_reg),
    .imgblock_4_3_V_read(imgblock_4_3_V_read_int_reg),
    .imgblock_4_4_V_read(imgblock_4_4_V_read_int_reg),
    .imgblock_4_5_V_read(imgblock_4_5_V_read_int_reg),
    .loop_r(loop_r_int_reg),
    .ap_return(grp_rb_kernel_fu_461_ap_return),
    .ap_ce(grp_rb_kernel_fu_461_ap_ce)
);

g_kernel_ap_uint_6_s grp_g_kernel_ap_uint_6_s_fu_529(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .imgblock_0_0_V_read(imgblock_0_0_V_read_int_reg),
    .imgblock_0_1_V_read(imgblock_0_1_V_read_int_reg),
    .imgblock_0_2_V_read(imgblock_0_2_V_read_int_reg),
    .imgblock_0_3_V_read(imgblock_0_3_V_read_int_reg),
    .imgblock_0_4_V_read(imgblock_0_4_V_read_int_reg),
    .imgblock_0_5_V_read(imgblock_0_5_V_read_int_reg),
    .imgblock_1_0_V_read(imgblock_1_0_V_read_int_reg),
    .imgblock_1_1_V_read(imgblock_1_1_V_read_int_reg),
    .imgblock_1_2_V_read(imgblock_1_2_V_read_int_reg),
    .imgblock_1_3_V_read(imgblock_1_3_V_read_int_reg),
    .imgblock_1_4_V_read(imgblock_1_4_V_read_int_reg),
    .imgblock_1_5_V_read(imgblock_1_5_V_read_int_reg),
    .imgblock_2_0_V_read(imgblock_2_0_V_read_int_reg),
    .imgblock_2_1_V_read(imgblock_2_1_V_read_int_reg),
    .imgblock_2_2_V_read(imgblock_2_2_V_read_int_reg),
    .imgblock_2_3_V_read(imgblock_2_3_V_read_int_reg),
    .imgblock_2_4_V_read(imgblock_2_4_V_read_int_reg),
    .imgblock_2_5_V_read(imgblock_2_5_V_read_int_reg),
    .imgblock_3_0_V_read(imgblock_3_0_V_read_int_reg),
    .imgblock_3_1_V_read(imgblock_3_1_V_read_int_reg),
    .imgblock_3_2_V_read(imgblock_3_2_V_read_int_reg),
    .imgblock_3_3_V_read(imgblock_3_3_V_read_int_reg),
    .imgblock_3_4_V_read(imgblock_3_4_V_read_int_reg),
    .imgblock_3_5_V_read(imgblock_3_5_V_read_int_reg),
    .imgblock_4_0_V_read(imgblock_4_0_V_read_int_reg),
    .imgblock_4_1_V_read(imgblock_4_1_V_read_int_reg),
    .imgblock_4_2_V_read(imgblock_4_2_V_read_int_reg),
    .imgblock_4_3_V_read(imgblock_4_3_V_read_int_reg),
    .imgblock_4_4_V_read(imgblock_4_4_V_read_int_reg),
    .imgblock_4_5_V_read(imgblock_4_5_V_read_int_reg),
    .loop_r(loop_r_int_reg),
    .ap_return(grp_g_kernel_ap_uint_6_s_fu_529_ap_return),
    .ap_ce(grp_g_kernel_ap_uint_6_s_fu_529_ap_ce)
);

ISPPipeline_accelkbM #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 10 ),
    .din3_WIDTH( 10 ),
    .din4_WIDTH( 10 ),
    .din5_WIDTH( 10 ),
    .din6_WIDTH( 3 ),
    .dout_WIDTH( 10 ))
ISPPipeline_accelkbM_U263(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(tmp_60_fu_617_p7),
    .dout(tmp_60_fu_617_p8)
);

ISPPipeline_accelkbM #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 10 ),
    .din3_WIDTH( 10 ),
    .din4_WIDTH( 10 ),
    .din5_WIDTH( 10 ),
    .din6_WIDTH( 3 ),
    .dout_WIDTH( 10 ))
ISPPipeline_accelkbM_U264(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(tmp_59_fu_647_p7),
    .dout(tmp_59_fu_647_p8)
);

ISPPipeline_accelkbM #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 10 ),
    .din3_WIDTH( 10 ),
    .din4_WIDTH( 10 ),
    .din5_WIDTH( 10 ),
    .din6_WIDTH( 3 ),
    .dout_WIDTH( 10 ))
ISPPipeline_accelkbM_U265(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(tmp_58_fu_677_p7),
    .dout(tmp_58_fu_677_p8)
);

ISPPipeline_accelkbM #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 10 ),
    .din3_WIDTH( 10 ),
    .din4_WIDTH( 10 ),
    .din5_WIDTH( 10 ),
    .din6_WIDTH( 3 ),
    .dout_WIDTH( 10 ))
ISPPipeline_accelkbM_U266(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(tmp_57_fu_707_p7),
    .dout(tmp_57_fu_707_p8)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_0_int_reg <= sext_ln121_fu_741_p1;
        ap_return_1_int_reg <= sext_ln121_1_fu_745_p1;
        ap_return_2_int_reg <= sext_ln121_2_fu_749_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        col_int_reg <= col;
        imgblock_0_0_V_read_int_reg <= imgblock_0_0_V_read;
        imgblock_0_1_V_read_int_reg <= imgblock_0_1_V_read;
        imgblock_0_2_V_read_int_reg <= imgblock_0_2_V_read;
        imgblock_0_3_V_read_int_reg <= imgblock_0_3_V_read;
        imgblock_0_4_V_read_int_reg <= imgblock_0_4_V_read;
        imgblock_0_5_V_read_int_reg <= imgblock_0_5_V_read;
        imgblock_1_0_V_read_int_reg <= imgblock_1_0_V_read;
        imgblock_1_1_V_read_int_reg <= imgblock_1_1_V_read;
        imgblock_1_2_V_read_int_reg <= imgblock_1_2_V_read;
        imgblock_1_3_V_read_int_reg <= imgblock_1_3_V_read;
        imgblock_1_4_V_read_int_reg <= imgblock_1_4_V_read;
        imgblock_1_5_V_read_int_reg <= imgblock_1_5_V_read;
        imgblock_2_0_V_read_int_reg <= imgblock_2_0_V_read;
        imgblock_2_1_V_read_int_reg <= imgblock_2_1_V_read;
        imgblock_2_2_V_read_int_reg <= imgblock_2_2_V_read;
        imgblock_2_3_V_read_int_reg <= imgblock_2_3_V_read;
        imgblock_2_4_V_read_int_reg <= imgblock_2_4_V_read;
        imgblock_2_5_V_read_int_reg <= imgblock_2_5_V_read;
        imgblock_3_0_V_read_int_reg <= imgblock_3_0_V_read;
        imgblock_3_1_V_read_int_reg <= imgblock_3_1_V_read;
        imgblock_3_2_V_read_int_reg <= imgblock_3_2_V_read;
        imgblock_3_3_V_read_int_reg <= imgblock_3_3_V_read;
        imgblock_3_4_V_read_int_reg <= imgblock_3_4_V_read;
        imgblock_3_5_V_read_int_reg <= imgblock_3_5_V_read;
        imgblock_4_0_V_read_int_reg <= imgblock_4_0_V_read;
        imgblock_4_1_V_read_int_reg <= imgblock_4_1_V_read;
        imgblock_4_2_V_read_int_reg <= imgblock_4_2_V_read;
        imgblock_4_3_V_read_int_reg <= imgblock_4_3_V_read;
        imgblock_4_4_V_read_int_reg <= imgblock_4_4_V_read;
        imgblock_4_5_V_read_int_reg <= imgblock_4_5_V_read;
        loop_r_int_reg <= loop_r;
        row_int_reg <= row;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001) & (trunc_ln190_fu_601_p1 == 1'd1) & (trunc_ln189_fu_597_p1 == 1'd1))) begin
        tmp_57_reg_1042 <= tmp_57_fu_707_p8;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_57_reg_1042_pp0_iter1_reg <= tmp_57_reg_1042;
        tmp_57_reg_1042_pp0_iter2_reg <= tmp_57_reg_1042_pp0_iter1_reg;
        tmp_58_reg_1037_pp0_iter1_reg <= tmp_58_reg_1037;
        tmp_58_reg_1037_pp0_iter2_reg <= tmp_58_reg_1037_pp0_iter1_reg;
        tmp_59_reg_1032_pp0_iter1_reg <= tmp_59_reg_1032;
        tmp_59_reg_1032_pp0_iter2_reg <= tmp_59_reg_1032_pp0_iter1_reg;
        tmp_60_reg_1027_pp0_iter1_reg <= tmp_60_reg_1027;
        tmp_60_reg_1027_pp0_iter2_reg <= tmp_60_reg_1027_pp0_iter1_reg;
        trunc_ln189_reg_1019 <= trunc_ln189_fu_597_p1;
        trunc_ln189_reg_1019_pp0_iter1_reg <= trunc_ln189_reg_1019;
        trunc_ln189_reg_1019_pp0_iter2_reg <= trunc_ln189_reg_1019_pp0_iter1_reg;
        trunc_ln190_reg_1023 <= trunc_ln190_fu_601_p1;
        trunc_ln190_reg_1023_pp0_iter1_reg <= trunc_ln190_reg_1023;
        trunc_ln190_reg_1023_pp0_iter2_reg <= trunc_ln190_reg_1023_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001) & (trunc_ln190_fu_601_p1 == 1'd0) & (trunc_ln189_fu_597_p1 == 1'd1))) begin
        tmp_58_reg_1037 <= tmp_58_fu_677_p8;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001) & (trunc_ln190_fu_601_p1 == 1'd1) & (trunc_ln189_fu_597_p1 == 1'd0))) begin
        tmp_59_reg_1032 <= tmp_59_fu_647_p8;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001) & (trunc_ln190_fu_601_p1 == 1'd0) & (trunc_ln189_fu_597_p1 == 1'd0))) begin
        tmp_60_reg_1027 <= tmp_60_fu_617_p8;
    end
end

always @ (*) begin
    if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd1) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd1))) begin
        ap_phi_mux_b_write_assign_phi_fu_289_p8 = grp_rgr_bgb_kernel_fu_393_ap_return;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd0) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd1))) begin
        ap_phi_mux_b_write_assign_phi_fu_289_p8 = zext_ln202_fu_733_p1;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd1) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_b_write_assign_phi_fu_289_p8 = grp_rb_kernel_fu_461_ap_return;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd0) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_b_write_assign_phi_fu_289_p8 = grp_rgb_bgr_kernel_fu_325_ap_return;
    end else begin
        ap_phi_mux_b_write_assign_phi_fu_289_p8 = ap_phi_reg_pp0_iter3_b_write_assign_reg_286;
    end
end

always @ (*) begin
    if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd1) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd1))) begin
        ap_phi_mux_g_write_assign_phi_fu_302_p8 = zext_ln207_fu_737_p1;
    end else if ((((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd0) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd1)) | ((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd1) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_g_write_assign_phi_fu_302_p8 = grp_g_kernel_ap_uint_6_s_fu_529_ap_return;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd0) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_g_write_assign_phi_fu_302_p8 = zext_ln193_fu_725_p1;
    end else begin
        ap_phi_mux_g_write_assign_phi_fu_302_p8 = ap_phi_reg_pp0_iter3_g_write_assign_reg_299;
    end
end

always @ (*) begin
    if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd1) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd1))) begin
        ap_phi_mux_r_write_assign_phi_fu_315_p8 = grp_rgb_bgr_kernel_fu_325_ap_return;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd0) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd1))) begin
        ap_phi_mux_r_write_assign_phi_fu_315_p8 = grp_rb_kernel_fu_461_ap_return;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd1) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_r_write_assign_phi_fu_315_p8 = zext_ln196_fu_729_p1;
    end else if (((trunc_ln190_reg_1023_pp0_iter2_reg == 1'd0) & (trunc_ln189_reg_1019_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_r_write_assign_phi_fu_315_p8 = grp_rgr_bgb_kernel_fu_393_ap_return;
    end else begin
        ap_phi_mux_r_write_assign_phi_fu_315_p8 = ap_phi_reg_pp0_iter3_r_write_assign_reg_312;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_0 = ap_return_0_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_0 = sext_ln121_fu_741_p1;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_1 = ap_return_1_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_1 = sext_ln121_1_fu_745_p1;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_2 = ap_return_2_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_2 = sext_ln121_2_fu_749_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp50) & (1'b1 == ap_ce_reg))) begin
        grp_g_kernel_ap_uint_6_s_fu_529_ap_ce = 1'b1;
    end else begin
        grp_g_kernel_ap_uint_6_s_fu_529_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp51) & (1'b1 == ap_ce_reg))) begin
        grp_rb_kernel_fu_461_ap_ce = 1'b1;
    end else begin
        grp_rb_kernel_fu_461_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp42) & (1'b1 == ap_ce_reg))) begin
        grp_rgb_bgr_kernel_fu_325_ap_ce = 1'b1;
    end else begin
        grp_rgb_bgr_kernel_fu_325_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp46) & (1'b1 == ap_ce_reg))) begin
        grp_rgr_bgb_kernel_fu_393_ap_ce = 1'b1;
    end else begin
        grp_rgr_bgb_kernel_fu_393_ap_ce = 1'b0;
    end
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001_ignoreCallOp42 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001_ignoreCallOp46 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001_ignoreCallOp50 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001_ignoreCallOp51 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0_ignore_call0 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0_ignore_call4 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0_ignore_call5 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1_ignore_call0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1_ignore_call4 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1_ignore_call5 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2_ignore_call0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2_ignore_call4 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2_ignore_call5 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3_ignore_call0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3_ignore_call4 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3_ignore_call5 = ~(1'b1 == 1'b1);

assign ap_phi_reg_pp0_iter3_b_write_assign_reg_286 = 'bx;

assign ap_phi_reg_pp0_iter3_g_write_assign_reg_299 = 'bx;

assign ap_phi_reg_pp0_iter3_r_write_assign_reg_312 = 'bx;

always @ (*) begin
    ap_predicate_op42_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd0) & (trunc_ln189_fu_597_p1 == 1'd0));
end

always @ (*) begin
    ap_predicate_op46_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd0) & (trunc_ln189_fu_597_p1 == 1'd0));
end

always @ (*) begin
    ap_predicate_op50_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd1) & (trunc_ln189_fu_597_p1 == 1'd0));
end

always @ (*) begin
    ap_predicate_op51_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd1) & (trunc_ln189_fu_597_p1 == 1'd0));
end

always @ (*) begin
    ap_predicate_op56_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd0) & (trunc_ln189_fu_597_p1 == 1'd1));
end

always @ (*) begin
    ap_predicate_op57_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd0) & (trunc_ln189_fu_597_p1 == 1'd1));
end

always @ (*) begin
    ap_predicate_op58_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd1) & (trunc_ln189_fu_597_p1 == 1'd1));
end

always @ (*) begin
    ap_predicate_op62_call_state1 = ((trunc_ln190_fu_601_p1 == 1'd1) & (trunc_ln189_fu_597_p1 == 1'd1));
end

assign or_ln544_1_fu_665_p3 = {{1'd1}, {loop_r_int_reg}};

assign or_ln544_2_fu_635_p3 = {{1'd1}, {loop_r_int_reg}};

assign or_ln544_3_fu_605_p3 = {{1'd1}, {loop_r_int_reg}};

assign or_ln_fu_695_p3 = {{1'd1}, {loop_r_int_reg}};

assign sext_ln121_1_fu_745_p1 = $signed(ap_phi_mux_g_write_assign_phi_fu_302_p8);

assign sext_ln121_2_fu_749_p1 = $signed(ap_phi_mux_r_write_assign_phi_fu_315_p8);

assign sext_ln121_fu_741_p1 = $signed(ap_phi_mux_b_write_assign_phi_fu_289_p8);

assign tmp_57_fu_707_p7 = or_ln_fu_695_p3;

assign tmp_58_fu_677_p7 = or_ln544_1_fu_665_p3;

assign tmp_59_fu_647_p7 = or_ln544_2_fu_635_p3;

assign tmp_60_fu_617_p7 = or_ln544_3_fu_605_p3;

assign trunc_ln189_fu_597_p1 = row_int_reg[0:0];

assign trunc_ln190_fu_601_p1 = col_int_reg[0:0];

assign zext_ln193_fu_725_p1 = tmp_60_reg_1027_pp0_iter2_reg;

assign zext_ln196_fu_729_p1 = tmp_59_reg_1032_pp0_iter2_reg;

assign zext_ln202_fu_733_p1 = tmp_58_reg_1037_pp0_iter2_reg;

assign zext_ln207_fu_737_p1 = tmp_57_reg_1042_pp0_iter2_reg;

endmodule //Core_Process