// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ISPPipeline_accel_function_awb_10_10_2160_3840_2_s (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        p_read,
        p_read1,
        demosaic_out_data_dout,
        demosaic_out_data_empty_n,
        demosaic_out_data_read,
        p_read2,
        p_read13,
        ltm_in_data_din,
        ltm_in_data_full_n,
        ltm_in_data_write,
        hist0_address0,
        hist0_ce0,
        hist0_we0,
        hist0_d0,
        hist01_address0,
        hist01_ce0,
        hist01_we0,
        hist01_d0,
        hist02_address0,
        hist02_ce0,
        hist02_we0,
        hist02_d0,
        hist1_address0,
        hist1_ce0,
        hist1_q0,
        hist13_address0,
        hist13_ce0,
        hist13_q0,
        hist14_address0,
        hist14_ce0,
        hist14_q0,
        height,
        width,
        mode_reg,
        p_read24,
        ltm_in_rows_c_din,
        ltm_in_rows_c_full_n,
        ltm_in_rows_c_write,
        ltm_in_cols_c_din,
        ltm_in_cols_c_full_n,
        ltm_in_cols_c_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [11:0] p_read;
input  [11:0] p_read1;
input  [95:0] demosaic_out_data_dout;
input   demosaic_out_data_empty_n;
output   demosaic_out_data_read;
input  [11:0] p_read2;
input  [11:0] p_read13;
output  [95:0] ltm_in_data_din;
input   ltm_in_data_full_n;
output   ltm_in_data_write;
output  [11:0] hist0_address0;
output   hist0_ce0;
output   hist0_we0;
output  [31:0] hist0_d0;
output  [11:0] hist01_address0;
output   hist01_ce0;
output   hist01_we0;
output  [31:0] hist01_d0;
output  [11:0] hist02_address0;
output   hist02_ce0;
output   hist02_we0;
output  [31:0] hist02_d0;
output  [11:0] hist1_address0;
output   hist1_ce0;
input  [31:0] hist1_q0;
output  [11:0] hist13_address0;
output   hist13_ce0;
input  [31:0] hist13_q0;
output  [11:0] hist14_address0;
output   hist14_ce0;
input  [31:0] hist14_q0;
input  [11:0] height;
input  [11:0] width;
input  [0:0] mode_reg;
input  [31:0] p_read24;
output  [11:0] ltm_in_rows_c_din;
input   ltm_in_rows_c_full_n;
output   ltm_in_rows_c_write;
output  [11:0] ltm_in_cols_c_din;
input   ltm_in_cols_c_full_n;
output   ltm_in_cols_c_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg demosaic_out_data_read;
reg[95:0] ltm_in_data_din;
reg ltm_in_data_write;
reg ltm_in_rows_c_write;
reg ltm_in_cols_c_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    ltm_in_rows_c_blk_n;
reg    ltm_in_cols_c_blk_n;
wire    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start;
wire    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_done;
wire    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_idle;
wire    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_ready;
wire    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_demosaic_out_4198_read;
wire   [95:0] grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ltm_in_4199_din;
wire    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ltm_in_4199_write;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_demosaic_out_4198_read;
wire   [95:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_din;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_write;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_address0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_ce0;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_d0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_we0;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_address1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_ce1;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_d1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_we1;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_address0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_ce0;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_d0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_we0;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_address1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_ce1;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_d1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_we1;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_address0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_ce0;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_d0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_we0;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_address1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_ce1;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_d1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_we1;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_address0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_ce0;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_d0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_we0;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_address1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_ce1;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_d1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_we1;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_address0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_ce0;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_d0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_we0;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_address1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_ce1;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_d1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_we1;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_address0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_ce0;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_d0;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_we0;
wire   [11:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_address1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_ce1;
wire   [31:0] grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_d1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_we1;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready;
wire    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_idle;
reg    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_continue;
reg    grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start_reg;
reg    ap_block_state1_ignore_call0;
wire    ap_CS_fsm_state2;
reg    grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start_reg;
wire    ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready;
wire    ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done;
reg    ap_block_state2_on_subcall_done;
reg    ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready;
reg    ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done;
reg    ap_block_state1;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start_reg = 1'b0;
#0 grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start_reg = 1'b0;
#0 ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready = 1'b0;
#0 ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done = 1'b0;
end

ISPPipeline_accel_fifo_copy_10_10_2160_3840_2_s grp_fifo_copy_10_10_2160_3840_2_s_fu_178(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start),
    .ap_done(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_done),
    .ap_idle(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_idle),
    .ap_ready(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_ready),
    .demosaic_out_4198_dout(demosaic_out_data_dout),
    .demosaic_out_4198_empty_n(demosaic_out_data_empty_n),
    .demosaic_out_4198_read(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_demosaic_out_4198_read),
    .ltm_in_4199_din(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ltm_in_4199_din),
    .ltm_in_4199_full_n(ltm_in_data_full_n),
    .ltm_in_4199_write(grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ltm_in_4199_write),
    .height(height),
    .width(width)
);

ISPPipeline_accel_fifo_awb_10_10_2160_3840_2_s grp_fifo_awb_10_10_2160_3840_2_s_fu_190(
    .p_read(p_read),
    .p_read1(p_read1),
    .demosaic_out_4198_dout(demosaic_out_data_dout),
    .demosaic_out_4198_empty_n(demosaic_out_data_empty_n),
    .demosaic_out_4198_read(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_demosaic_out_4198_read),
    .p_read2(p_read2),
    .p_read3(p_read13),
    .ltm_in_4199_din(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_din),
    .ltm_in_4199_full_n(ltm_in_data_full_n),
    .ltm_in_4199_write(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_write),
    .hist0_address0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_address0),
    .hist0_ce0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_ce0),
    .hist0_d0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_d0),
    .hist0_q0(32'd0),
    .hist0_we0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_we0),
    .hist0_address1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_address1),
    .hist0_ce1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_ce1),
    .hist0_d1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_d1),
    .hist0_q1(32'd0),
    .hist0_we1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_we1),
    .hist01_address0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_address0),
    .hist01_ce0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_ce0),
    .hist01_d0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_d0),
    .hist01_q0(32'd0),
    .hist01_we0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_we0),
    .hist01_address1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_address1),
    .hist01_ce1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_ce1),
    .hist01_d1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_d1),
    .hist01_q1(32'd0),
    .hist01_we1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_we1),
    .hist02_address0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_address0),
    .hist02_ce0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_ce0),
    .hist02_d0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_d0),
    .hist02_q0(32'd0),
    .hist02_we0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_we0),
    .hist02_address1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_address1),
    .hist02_ce1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_ce1),
    .hist02_d1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_d1),
    .hist02_q1(32'd0),
    .hist02_we1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_we1),
    .hist1_address0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_address0),
    .hist1_ce0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_ce0),
    .hist1_d0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_d0),
    .hist1_q0(hist1_q0),
    .hist1_we0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_we0),
    .hist1_address1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_address1),
    .hist1_ce1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_ce1),
    .hist1_d1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_d1),
    .hist1_q1(32'd0),
    .hist1_we1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_we1),
    .hist13_address0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_address0),
    .hist13_ce0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_ce0),
    .hist13_d0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_d0),
    .hist13_q0(hist13_q0),
    .hist13_we0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_we0),
    .hist13_address1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_address1),
    .hist13_ce1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_ce1),
    .hist13_d1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_d1),
    .hist13_q1(32'd0),
    .hist13_we1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_we1),
    .hist14_address0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_address0),
    .hist14_ce0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_ce0),
    .hist14_d0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_d0),
    .hist14_q0(hist14_q0),
    .hist14_we0(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_we0),
    .hist14_address1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_address1),
    .hist14_ce1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_ce1),
    .hist14_d1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_d1),
    .hist14_q1(32'd0),
    .hist14_we1(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_we1),
    .thresh(p_read24),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .p_read_ap_vld(1'b1),
    .p_read1_ap_vld(1'b1),
    .ap_start(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start),
    .ap_done(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done),
    .p_read2_ap_vld(1'b1),
    .p_read3_ap_vld(1'b1),
    .thresh_ap_vld(1'b1),
    .ap_ready(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready),
    .ap_idle(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_idle),
    .ap_continue(grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_continue)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2) & (mode_reg == 1'd1))) begin
            ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done <= 1'b0;
        end else if ((grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done == 1'b1)) begin
            ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2) & (mode_reg == 1'd1))) begin
            ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready <= 1'b0;
        end else if ((grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready == 1'b1)) begin
            ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start_reg <= 1'b0;
    end else begin
        if ((((ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready == 1'b0) & (1'b1 == ap_CS_fsm_state2) & (mode_reg == 1'd1)) | (~((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (mode_reg == 1'd1)))) begin
            grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start_reg <= 1'b1;
        end else if ((grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready == 1'b1)) begin
            grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (mode_reg == 1'd0))) begin
            grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start_reg <= 1'b1;
        end else if ((grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_ready == 1'b1)) begin
            grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if (((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state2_on_subcall_done)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((mode_reg == 1'd1)) begin
            demosaic_out_data_read = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_demosaic_out_4198_read;
        end else if ((mode_reg == 1'd0)) begin
            demosaic_out_data_read = grp_fifo_copy_10_10_2160_3840_2_s_fu_178_demosaic_out_4198_read;
        end else begin
            demosaic_out_data_read = 1'b0;
        end
    end else begin
        demosaic_out_data_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2) & (mode_reg == 1'd1))) begin
        grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_continue = 1'b1;
    end else begin
        grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_continue = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ltm_in_cols_c_blk_n = ltm_in_cols_c_full_n;
    end else begin
        ltm_in_cols_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ltm_in_cols_c_write = 1'b1;
    end else begin
        ltm_in_cols_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((mode_reg == 1'd1)) begin
            ltm_in_data_din = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_din;
        end else if ((mode_reg == 1'd0)) begin
            ltm_in_data_din = grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ltm_in_4199_din;
        end else begin
            ltm_in_data_din = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_din;
        end
    end else begin
        ltm_in_data_din = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_din;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((mode_reg == 1'd1)) begin
            ltm_in_data_write = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ltm_in_4199_write;
        end else if ((mode_reg == 1'd0)) begin
            ltm_in_data_write = grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ltm_in_4199_write;
        end else begin
            ltm_in_data_write = 1'b0;
        end
    end else begin
        ltm_in_data_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ltm_in_rows_c_blk_n = ltm_in_rows_c_full_n;
    end else begin
        ltm_in_rows_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ltm_in_rows_c_write = 1'b1;
    end else begin
        ltm_in_rows_c_write = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call0 = ((ltm_in_cols_c_full_n == 1'b0) | (ltm_in_rows_c_full_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2_on_subcall_done = ((((ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready & ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done) == 1'b0) & (mode_reg == 1'd1)) | ((grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_done == 1'b0) & (mode_reg == 1'd0)));
end

assign ap_ready = internal_ap_ready;

assign ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done = (grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done | ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_done);

assign ap_sync_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready = (grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready | ap_sync_reg_grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_ready);

assign grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_ap_start_reg;

assign grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start = grp_fifo_copy_10_10_2160_3840_2_s_fu_178_ap_start_reg;

assign hist01_address0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_address0;

assign hist01_ce0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_ce0;

assign hist01_d0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_d0;

assign hist01_we0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist01_we0;

assign hist02_address0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_address0;

assign hist02_ce0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_ce0;

assign hist02_d0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_d0;

assign hist02_we0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist02_we0;

assign hist0_address0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_address0;

assign hist0_ce0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_ce0;

assign hist0_d0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_d0;

assign hist0_we0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist0_we0;

assign hist13_address0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_address0;

assign hist13_ce0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist13_ce0;

assign hist14_address0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_address0;

assign hist14_ce0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist14_ce0;

assign hist1_address0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_address0;

assign hist1_ce0 = grp_fifo_awb_10_10_2160_3840_2_s_fu_190_hist1_ce0;

assign ltm_in_cols_c_din = p_read13;

assign ltm_in_rows_c_din = p_read2;

assign start_out = real_start;

endmodule //ISPPipeline_accel_function_awb_10_10_2160_3840_2_s
