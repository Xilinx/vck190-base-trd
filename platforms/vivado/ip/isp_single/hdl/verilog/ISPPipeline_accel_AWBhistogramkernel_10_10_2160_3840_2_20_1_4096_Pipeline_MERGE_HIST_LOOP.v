// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ISPPipeline_accel_AWBhistogramkernel_10_10_2160_3840_2_20_1_4096_Pipeline_MERGE_HIST_LOOP (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        tmp_hist_V_0_address0,
        tmp_hist_V_0_ce0,
        tmp_hist_V_0_q0,
        tmp_hist1_V_0_address0,
        tmp_hist1_V_0_ce0,
        tmp_hist1_V_0_q0,
        tmp_hist_V_3_address0,
        tmp_hist_V_3_ce0,
        tmp_hist_V_3_q0,
        tmp_hist1_V_3_address0,
        tmp_hist1_V_3_ce0,
        tmp_hist1_V_3_q0,
        hist_address0,
        hist_ce0,
        hist_we0,
        hist_d0,
        tmp_hist_V_1_address0,
        tmp_hist_V_1_ce0,
        tmp_hist_V_1_q0,
        tmp_hist1_V_1_address0,
        tmp_hist1_V_1_ce0,
        tmp_hist1_V_1_q0,
        tmp_hist_V_4_address0,
        tmp_hist_V_4_ce0,
        tmp_hist_V_4_q0,
        tmp_hist1_V_4_address0,
        tmp_hist1_V_4_ce0,
        tmp_hist1_V_4_q0,
        hist1_address0,
        hist1_ce0,
        hist1_we0,
        hist1_d0,
        tmp_hist_V_2_address0,
        tmp_hist_V_2_ce0,
        tmp_hist_V_2_q0,
        tmp_hist1_V_2_address0,
        tmp_hist1_V_2_ce0,
        tmp_hist1_V_2_q0,
        tmp_hist_V_5_address0,
        tmp_hist_V_5_ce0,
        tmp_hist_V_5_q0,
        tmp_hist1_V_5_address0,
        tmp_hist1_V_5_ce0,
        tmp_hist1_V_5_q0,
        hist2_address0,
        hist2_ce0,
        hist2_we0,
        hist2_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [11:0] tmp_hist_V_0_address0;
output   tmp_hist_V_0_ce0;
input  [31:0] tmp_hist_V_0_q0;
output  [11:0] tmp_hist1_V_0_address0;
output   tmp_hist1_V_0_ce0;
input  [31:0] tmp_hist1_V_0_q0;
output  [11:0] tmp_hist_V_3_address0;
output   tmp_hist_V_3_ce0;
input  [31:0] tmp_hist_V_3_q0;
output  [11:0] tmp_hist1_V_3_address0;
output   tmp_hist1_V_3_ce0;
input  [31:0] tmp_hist1_V_3_q0;
output  [11:0] hist_address0;
output   hist_ce0;
output   hist_we0;
output  [31:0] hist_d0;
output  [11:0] tmp_hist_V_1_address0;
output   tmp_hist_V_1_ce0;
input  [31:0] tmp_hist_V_1_q0;
output  [11:0] tmp_hist1_V_1_address0;
output   tmp_hist1_V_1_ce0;
input  [31:0] tmp_hist1_V_1_q0;
output  [11:0] tmp_hist_V_4_address0;
output   tmp_hist_V_4_ce0;
input  [31:0] tmp_hist_V_4_q0;
output  [11:0] tmp_hist1_V_4_address0;
output   tmp_hist1_V_4_ce0;
input  [31:0] tmp_hist1_V_4_q0;
output  [11:0] hist1_address0;
output   hist1_ce0;
output   hist1_we0;
output  [31:0] hist1_d0;
output  [11:0] tmp_hist_V_2_address0;
output   tmp_hist_V_2_ce0;
input  [31:0] tmp_hist_V_2_q0;
output  [11:0] tmp_hist1_V_2_address0;
output   tmp_hist1_V_2_ce0;
input  [31:0] tmp_hist1_V_2_q0;
output  [11:0] tmp_hist_V_5_address0;
output   tmp_hist_V_5_ce0;
input  [31:0] tmp_hist_V_5_q0;
output  [11:0] tmp_hist1_V_5_address0;
output   tmp_hist1_V_5_ce0;
input  [31:0] tmp_hist1_V_5_q0;
output  [11:0] hist2_address0;
output   hist2_ce0;
output   hist2_we0;
output  [31:0] hist2_d0;

reg ap_idle;
reg tmp_hist_V_0_ce0;
reg tmp_hist1_V_0_ce0;
reg tmp_hist_V_3_ce0;
reg tmp_hist1_V_3_ce0;
reg hist_ce0;
reg hist_we0;
reg tmp_hist_V_1_ce0;
reg tmp_hist1_V_1_ce0;
reg tmp_hist_V_4_ce0;
reg tmp_hist1_V_4_ce0;
reg hist1_ce0;
reg hist1_we0;
reg tmp_hist_V_2_ce0;
reg tmp_hist1_V_2_ce0;
reg tmp_hist_V_5_ce0;
reg tmp_hist1_V_5_ce0;
reg hist2_ce0;
reg hist2_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1057_fu_277_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln1057_fu_283_p1;
reg   [63:0] zext_ln1057_reg_363;
reg   [63:0] zext_ln1057_reg_363_pp0_iter1_reg;
reg   [31:0] tmp_hist_V_0_load_reg_430;
reg   [31:0] tmp_hist1_V_0_load_reg_435;
wire   [31:0] add_ln601_1_fu_304_p2;
reg   [31:0] add_ln601_1_reg_440;
reg   [31:0] tmp_hist_V_1_load_reg_445;
reg   [31:0] tmp_hist1_V_1_load_reg_450;
wire   [31:0] add_ln601_4_fu_310_p2;
reg   [31:0] add_ln601_4_reg_455;
reg   [31:0] tmp_hist_V_2_load_reg_460;
reg   [31:0] tmp_hist1_V_2_load_reg_465;
wire   [31:0] add_ln601_7_fu_316_p2;
reg   [31:0] add_ln601_7_reg_470;
wire    ap_block_pp0_stage0;
reg   [12:0] i_V_5_fu_64;
wire    ap_loop_init;
reg   [12:0] ap_sig_allocacmp_i_V;
wire   [12:0] add_ln870_4_fu_271_p2;
wire   [31:0] add_ln601_fu_322_p2;
wire   [31:0] add_ln601_3_fu_332_p2;
wire   [31:0] add_ln601_6_fu_342_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

ISPPipeline_accel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1057_fu_277_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_V_5_fu_64 <= add_ln870_4_fu_271_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_V_5_fu_64 <= 13'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln601_1_reg_440 <= add_ln601_1_fu_304_p2;
        add_ln601_4_reg_455 <= add_ln601_4_fu_310_p2;
        add_ln601_7_reg_470 <= add_ln601_7_fu_316_p2;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        tmp_hist1_V_0_load_reg_435 <= tmp_hist1_V_0_q0;
        tmp_hist1_V_1_load_reg_450 <= tmp_hist1_V_1_q0;
        tmp_hist1_V_2_load_reg_465 <= tmp_hist1_V_2_q0;
        tmp_hist_V_0_load_reg_430 <= tmp_hist_V_0_q0;
        tmp_hist_V_1_load_reg_445 <= tmp_hist_V_1_q0;
        tmp_hist_V_2_load_reg_460 <= tmp_hist_V_2_q0;
        zext_ln1057_reg_363_pp0_iter1_reg[12 : 0] <= zext_ln1057_reg_363[12 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1057_fu_277_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln1057_reg_363[12 : 0] <= zext_ln1057_fu_283_p1[12 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln1057_fu_277_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_V = 13'd0;
    end else begin
        ap_sig_allocacmp_i_V = i_V_5_fu_64;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        hist1_ce0 = 1'b1;
    end else begin
        hist1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        hist1_we0 = 1'b1;
    end else begin
        hist1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        hist2_ce0 = 1'b1;
    end else begin
        hist2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        hist2_we0 = 1'b1;
    end else begin
        hist2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        hist_ce0 = 1'b1;
    end else begin
        hist_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        hist_we0 = 1'b1;
    end else begin
        hist_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist1_V_0_ce0 = 1'b1;
    end else begin
        tmp_hist1_V_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist1_V_1_ce0 = 1'b1;
    end else begin
        tmp_hist1_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist1_V_2_ce0 = 1'b1;
    end else begin
        tmp_hist1_V_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist1_V_3_ce0 = 1'b1;
    end else begin
        tmp_hist1_V_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist1_V_4_ce0 = 1'b1;
    end else begin
        tmp_hist1_V_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist1_V_5_ce0 = 1'b1;
    end else begin
        tmp_hist1_V_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist_V_0_ce0 = 1'b1;
    end else begin
        tmp_hist_V_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist_V_1_ce0 = 1'b1;
    end else begin
        tmp_hist_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist_V_2_ce0 = 1'b1;
    end else begin
        tmp_hist_V_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist_V_3_ce0 = 1'b1;
    end else begin
        tmp_hist_V_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist_V_4_ce0 = 1'b1;
    end else begin
        tmp_hist_V_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_hist_V_5_ce0 = 1'b1;
    end else begin
        tmp_hist_V_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln601_1_fu_304_p2 = (tmp_hist_V_3_q0 + tmp_hist1_V_3_q0);

assign add_ln601_3_fu_332_p2 = (tmp_hist1_V_1_load_reg_450 + tmp_hist_V_1_load_reg_445);

assign add_ln601_4_fu_310_p2 = (tmp_hist_V_4_q0 + tmp_hist1_V_4_q0);

assign add_ln601_6_fu_342_p2 = (tmp_hist1_V_2_load_reg_465 + tmp_hist_V_2_load_reg_460);

assign add_ln601_7_fu_316_p2 = (tmp_hist_V_5_q0 + tmp_hist1_V_5_q0);

assign add_ln601_fu_322_p2 = (tmp_hist1_V_0_load_reg_435 + tmp_hist_V_0_load_reg_430);

assign add_ln870_4_fu_271_p2 = (ap_sig_allocacmp_i_V + 13'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign hist1_address0 = zext_ln1057_reg_363_pp0_iter1_reg;

assign hist1_d0 = (add_ln601_4_reg_455 + add_ln601_3_fu_332_p2);

assign hist2_address0 = zext_ln1057_reg_363_pp0_iter1_reg;

assign hist2_d0 = (add_ln601_7_reg_470 + add_ln601_6_fu_342_p2);

assign hist_address0 = zext_ln1057_reg_363_pp0_iter1_reg;

assign hist_d0 = (add_ln601_1_reg_440 + add_ln601_fu_322_p2);

assign icmp_ln1057_fu_277_p2 = ((ap_sig_allocacmp_i_V == 13'd4096) ? 1'b1 : 1'b0);

assign tmp_hist1_V_0_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist1_V_1_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist1_V_2_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist1_V_3_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist1_V_4_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist1_V_5_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist_V_0_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist_V_1_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist_V_2_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist_V_3_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist_V_4_address0 = zext_ln1057_fu_283_p1;

assign tmp_hist_V_5_address0 = zext_ln1057_fu_283_p1;

assign zext_ln1057_fu_283_p1 = ap_sig_allocacmp_i_V;

always @ (posedge ap_clk) begin
    zext_ln1057_reg_363[63:13] <= 51'b000000000000000000000000000000000000000000000000000;
    zext_ln1057_reg_363_pp0_iter1_reg[63:13] <= 51'b000000000000000000000000000000000000000000000000000;
end

endmodule //ISPPipeline_accel_AWBhistogramkernel_10_10_2160_3840_2_20_1_4096_Pipeline_MERGE_HIST_LOOP
