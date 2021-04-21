// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.2
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module AXIVideo2BayerMat (
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
        s_axis_video_TDATA,
        s_axis_video_TVALID,
        s_axis_video_TREADY,
        s_axis_video_TKEEP,
        s_axis_video_TSTRB,
        s_axis_video_TUSER,
        s_axis_video_TLAST,
        s_axis_video_TID,
        s_axis_video_TDEST,
        bayer_mat_rows_dout,
        bayer_mat_rows_empty_n,
        bayer_mat_rows_read,
        bayer_mat_cols_dout,
        bayer_mat_cols_empty_n,
        bayer_mat_cols_read,
        bayer_mat_data_V_V_din,
        bayer_mat_data_V_V_full_n,
        bayer_mat_data_V_V_write,
        bayer_mat_rows_out_din,
        bayer_mat_rows_out_full_n,
        bayer_mat_rows_out_write,
        bayer_mat_cols_out_din,
        bayer_mat_cols_out_full_n,
        bayer_mat_cols_out_write
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_pp1_stage0 = 8'd16;
parameter    ap_ST_fsm_state7 = 8'd32;
parameter    ap_ST_fsm_state8 = 8'd64;
parameter    ap_ST_fsm_state9 = 8'd128;

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
input  [23:0] s_axis_video_TDATA;
input   s_axis_video_TVALID;
output   s_axis_video_TREADY;
input  [2:0] s_axis_video_TKEEP;
input  [2:0] s_axis_video_TSTRB;
input  [0:0] s_axis_video_TUSER;
input  [0:0] s_axis_video_TLAST;
input  [0:0] s_axis_video_TID;
input  [0:0] s_axis_video_TDEST;
input  [15:0] bayer_mat_rows_dout;
input   bayer_mat_rows_empty_n;
output   bayer_mat_rows_read;
input  [15:0] bayer_mat_cols_dout;
input   bayer_mat_cols_empty_n;
output   bayer_mat_cols_read;
output  [19:0] bayer_mat_data_V_V_din;
input   bayer_mat_data_V_V_full_n;
output   bayer_mat_data_V_V_write;
output  [15:0] bayer_mat_rows_out_din;
input   bayer_mat_rows_out_full_n;
output   bayer_mat_rows_out_write;
output  [15:0] bayer_mat_cols_out_din;
input   bayer_mat_cols_out_full_n;
output   bayer_mat_cols_out_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg s_axis_video_TREADY;
reg bayer_mat_rows_read;
reg bayer_mat_cols_read;
reg bayer_mat_data_V_V_write;
reg bayer_mat_rows_out_write;
reg bayer_mat_cols_out_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    s_axis_video_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter0;
wire    ap_block_pp1_stage0;
wire   [0:0] icmp_ln83_fu_321_p2;
wire   [0:0] or_ln90_fu_335_p2;
wire    ap_CS_fsm_state8;
wire   [0:0] ap_phi_mux_last_1_i_phi_fu_275_p4;
reg    bayer_mat_rows_blk_n;
reg    bayer_mat_cols_blk_n;
reg    bayer_mat_data_V_V_blk_n;
reg    ap_enable_reg_pp1_iter1;
reg   [0:0] icmp_ln83_reg_394;
reg    bayer_mat_rows_out_blk_n;
reg    bayer_mat_cols_out_blk_n;
reg   [0:0] axi_last_V_1_i_reg_178;
reg   [23:0] axi_data_V_1_i_reg_189;
reg   [0:0] last_0_i_reg_200;
reg   [14:0] j_0_i_reg_212;
reg   [0:0] last_reg_223;
reg   [23:0] p_Val2_s_reg_236;
reg   [15:0] bayer_mat_rows_read_reg_350;
reg    ap_block_state1;
reg   [15:0] bayer_mat_cols_read_reg_355;
reg   [23:0] tmp_data_V_reg_360;
reg   [0:0] tmp_last_V_reg_368;
reg   [14:0] tmp_reg_380;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln77_fu_310_p2;
wire    ap_CS_fsm_state4;
wire   [15:0] i_fu_315_p2;
reg   [15:0] i_reg_389;
reg    ap_predicate_op63_read_state5;
reg    ap_block_state5_pp1_stage0_iter0;
reg    ap_block_state6_pp1_stage0_iter1;
reg    ap_block_pp1_stage0_11001;
wire   [14:0] j_fu_326_p2;
wire   [19:0] tmp_V_fu_341_p1;
reg   [19:0] tmp_V_reg_407;
reg    ap_block_state8;
reg    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state5;
reg   [0:0] axi_last_V_3_i_reg_248;
reg   [0:0] axi_last_V_0_i_reg_147;
wire    ap_CS_fsm_state9;
reg   [23:0] axi_data_V_3_i_reg_260;
reg   [23:0] axi_data_V_0_i_reg_157;
reg   [15:0] i_0_i_reg_167;
reg   [0:0] ap_phi_mux_axi_last_V_1_i_phi_fu_181_p4;
reg   [23:0] ap_phi_mux_axi_data_V_1_i_phi_fu_192_p4;
reg   [0:0] ap_phi_mux_last_0_i_phi_fu_204_p4;
wire   [0:0] ap_phi_reg_pp1_iter0_last_reg_223;
reg   [23:0] ap_phi_mux_p_Val2_s_phi_fu_240_p4;
wire   [23:0] ap_phi_reg_pp1_iter0_p_Val2_s_reg_236;
wire    ap_CS_fsm_state7;
reg   [0:0] last_1_i_reg_272;
reg   [0:0] start_1_i_fu_90;
reg    ap_block_pp1_stage0_01001;
wire   [0:0] tmp_user_V_fu_292_p1;
reg   [7:0] ap_NS_fsm;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
reg    ap_condition_191;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
end

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
        end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln77_fu_310_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_condition_pp1_exit_iter0_state5))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if (((icmp_ln77_fu_310_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state5))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state5);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if (((icmp_ln77_fu_310_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axi_data_V_0_i_reg_157 <= tmp_data_V_reg_360;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        axi_data_V_0_i_reg_157 <= axi_data_V_3_i_reg_260;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        axi_data_V_1_i_reg_189 <= p_Val2_s_reg_236;
    end else if (((icmp_ln77_fu_310_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        axi_data_V_1_i_reg_189 <= axi_data_V_0_i_reg_157;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        axi_data_V_3_i_reg_260 <= axi_data_V_1_i_reg_189;
    end else if ((~((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0)) & (last_1_i_reg_272 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        axi_data_V_3_i_reg_260 <= s_axis_video_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axi_last_V_0_i_reg_147 <= tmp_last_V_reg_368;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        axi_last_V_0_i_reg_147 <= axi_last_V_3_i_reg_248;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        axi_last_V_1_i_reg_178 <= last_reg_223;
    end else if (((icmp_ln77_fu_310_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        axi_last_V_1_i_reg_178 <= axi_last_V_0_i_reg_147;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        axi_last_V_3_i_reg_248 <= axi_last_V_1_i_reg_178;
    end else if ((~((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0)) & (last_1_i_reg_272 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        axi_last_V_3_i_reg_248 <= s_axis_video_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_0_i_reg_167 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        i_0_i_reg_167 <= i_reg_389;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln83_fu_321_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        j_0_i_reg_212 <= j_fu_326_p2;
    end else if (((icmp_ln77_fu_310_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        j_0_i_reg_212 <= 15'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        last_0_i_reg_200 <= last_reg_223;
    end else if (((icmp_ln77_fu_310_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        last_0_i_reg_200 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        last_1_i_reg_272 <= last_0_i_reg_200;
    end else if ((~((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0)) & (last_1_i_reg_272 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        last_1_i_reg_272 <= s_axis_video_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_191)) begin
        if (((or_ln90_fu_335_p2 == 1'd0) & (icmp_ln83_fu_321_p2 == 1'd0))) begin
            last_reg_223 <= s_axis_video_TLAST;
        end else if (((or_ln90_fu_335_p2 == 1'd1) & (icmp_ln83_fu_321_p2 == 1'd0))) begin
            last_reg_223 <= ap_phi_mux_axi_last_V_1_i_phi_fu_181_p4;
        end else if ((1'b1 == 1'b1)) begin
            last_reg_223 <= ap_phi_reg_pp1_iter0_last_reg_223;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_191)) begin
        if (((or_ln90_fu_335_p2 == 1'd0) & (icmp_ln83_fu_321_p2 == 1'd0))) begin
            p_Val2_s_reg_236 <= s_axis_video_TDATA;
        end else if (((or_ln90_fu_335_p2 == 1'd1) & (icmp_ln83_fu_321_p2 == 1'd0))) begin
            p_Val2_s_reg_236 <= ap_phi_mux_axi_data_V_1_i_phi_fu_192_p4;
        end else if ((1'b1 == 1'b1)) begin
            p_Val2_s_reg_236 <= ap_phi_reg_pp1_iter0_p_Val2_s_reg_236;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln83_fu_321_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        start_1_i_fu_90 <= 1'd0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        start_1_i_fu_90 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_cols_read_reg_355 <= bayer_mat_cols_dout;
        bayer_mat_rows_read_reg_350 <= bayer_mat_rows_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_reg_389 <= i_fu_315_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        icmp_ln83_reg_394 <= icmp_ln83_fu_321_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln83_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        tmp_V_reg_407 <= tmp_V_fu_341_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((s_axis_video_TVALID == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_data_V_reg_360 <= s_axis_video_TDATA;
        tmp_last_V_reg_368 <= s_axis_video_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        tmp_reg_380 <= {{bayer_mat_cols_read_reg_355[15:1]}};
    end
end

always @ (*) begin
    if ((icmp_ln83_fu_321_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln77_fu_310_p2 == 1'd1))) begin
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
    if (((ap_enable_reg_pp1_iter0 == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        ap_phi_mux_axi_data_V_1_i_phi_fu_192_p4 = p_Val2_s_reg_236;
    end else begin
        ap_phi_mux_axi_data_V_1_i_phi_fu_192_p4 = axi_data_V_1_i_reg_189;
    end
end

always @ (*) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        ap_phi_mux_axi_last_V_1_i_phi_fu_181_p4 = last_reg_223;
    end else begin
        ap_phi_mux_axi_last_V_1_i_phi_fu_181_p4 = axi_last_V_1_i_reg_178;
    end
end

always @ (*) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        ap_phi_mux_last_0_i_phi_fu_204_p4 = last_reg_223;
    end else begin
        ap_phi_mux_last_0_i_phi_fu_204_p4 = last_0_i_reg_200;
    end
end

always @ (*) begin
    if ((icmp_ln83_fu_321_p2 == 1'd0)) begin
        if ((or_ln90_fu_335_p2 == 1'd0)) begin
            ap_phi_mux_p_Val2_s_phi_fu_240_p4 = s_axis_video_TDATA;
        end else if ((or_ln90_fu_335_p2 == 1'd1)) begin
            ap_phi_mux_p_Val2_s_phi_fu_240_p4 = ap_phi_mux_axi_data_V_1_i_phi_fu_192_p4;
        end else begin
            ap_phi_mux_p_Val2_s_phi_fu_240_p4 = ap_phi_reg_pp1_iter0_p_Val2_s_reg_236;
        end
    end else begin
        ap_phi_mux_p_Val2_s_phi_fu_240_p4 = ap_phi_reg_pp1_iter0_p_Val2_s_reg_236;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_cols_blk_n = bayer_mat_cols_empty_n;
    end else begin
        bayer_mat_cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_cols_out_blk_n = bayer_mat_cols_out_full_n;
    end else begin
        bayer_mat_cols_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_cols_out_write = 1'b1;
    end else begin
        bayer_mat_cols_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_cols_read = 1'b1;
    end else begin
        bayer_mat_cols_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        bayer_mat_data_V_V_blk_n = bayer_mat_data_V_V_full_n;
    end else begin
        bayer_mat_data_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln83_reg_394 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        bayer_mat_data_V_V_write = 1'b1;
    end else begin
        bayer_mat_data_V_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_rows_blk_n = bayer_mat_rows_empty_n;
    end else begin
        bayer_mat_rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_rows_out_blk_n = bayer_mat_rows_out_full_n;
    end else begin
        bayer_mat_rows_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_rows_out_write = 1'b1;
    end else begin
        bayer_mat_rows_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        bayer_mat_rows_read = 1'b1;
    end else begin
        bayer_mat_rows_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln77_fu_310_p2 == 1'd1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((or_ln90_fu_335_p2 == 1'd0) & (icmp_ln83_fu_321_p2 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0)) | ((last_1_i_reg_272 == 1'd0) & (1'b1 == ap_CS_fsm_state8)))) begin
        s_axis_video_TDATA_blk_n = s_axis_video_TVALID;
    end else begin
        s_axis_video_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_predicate_op63_read_state5 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001)) | ((s_axis_video_TVALID == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0)) & (last_1_i_reg_272 == 1'd0) & (1'b1 == ap_CS_fsm_state8)))) begin
        s_axis_video_TREADY = 1'b1;
    end else begin
        s_axis_video_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_user_V_fu_292_p1 == 1'd0) & (s_axis_video_TVALID == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((s_axis_video_TVALID == 1'b1) & (tmp_user_V_fu_292_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln77_fu_310_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((icmp_ln83_fu_321_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((icmp_ln83_fu_321_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if ((~((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0)) & (last_1_i_reg_272 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else if ((~((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state8) & (ap_phi_mux_last_1_i_phi_fu_275_p4 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd7];

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage0_01001 = (((s_axis_video_TVALID == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_predicate_op63_read_state5 == 1'b1)) | ((icmp_ln83_reg_394 == 1'd0) & (bayer_mat_data_V_V_full_n == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp1_stage0_11001 = (((s_axis_video_TVALID == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_predicate_op63_read_state5 == 1'b1)) | ((icmp_ln83_reg_394 == 1'd0) & (bayer_mat_data_V_V_full_n == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp1_stage0_subdone = (((s_axis_video_TVALID == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_predicate_op63_read_state5 == 1'b1)) | ((icmp_ln83_reg_394 == 1'd0) & (bayer_mat_data_V_V_full_n == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((bayer_mat_cols_out_full_n == 1'b0) | (bayer_mat_rows_out_full_n == 1'b0) | (bayer_mat_cols_empty_n == 1'b0) | (bayer_mat_rows_empty_n == 1'b0) | (real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state5_pp1_stage0_iter0 = ((s_axis_video_TVALID == 1'b0) & (ap_predicate_op63_read_state5 == 1'b1));
end

always @ (*) begin
    ap_block_state6_pp1_stage0_iter1 = ((icmp_ln83_reg_394 == 1'd0) & (bayer_mat_data_V_V_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state8 = ((last_1_i_reg_272 == 1'd0) & (s_axis_video_TVALID == 1'b0));
end

always @ (*) begin
    ap_condition_191 = ((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001));
end

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign ap_phi_mux_last_1_i_phi_fu_275_p4 = last_1_i_reg_272;

assign ap_phi_reg_pp1_iter0_last_reg_223 = 'bx;

assign ap_phi_reg_pp1_iter0_p_Val2_s_reg_236 = 'bx;

always @ (*) begin
    ap_predicate_op63_read_state5 = ((or_ln90_fu_335_p2 == 1'd0) & (icmp_ln83_fu_321_p2 == 1'd0));
end

assign ap_ready = internal_ap_ready;

assign bayer_mat_cols_out_din = bayer_mat_cols_dout;

assign bayer_mat_data_V_V_din = tmp_V_reg_407;

assign bayer_mat_rows_out_din = bayer_mat_rows_dout;

assign i_fu_315_p2 = (i_0_i_reg_167 + 16'd1);

assign icmp_ln77_fu_310_p2 = ((i_0_i_reg_167 == bayer_mat_rows_read_reg_350) ? 1'b1 : 1'b0);

assign icmp_ln83_fu_321_p2 = ((j_0_i_reg_212 == tmp_reg_380) ? 1'b1 : 1'b0);

assign j_fu_326_p2 = (j_0_i_reg_212 + 15'd1);

assign or_ln90_fu_335_p2 = (start_1_i_fu_90 | ap_phi_mux_last_0_i_phi_fu_204_p4);

assign start_out = real_start;

assign tmp_V_fu_341_p1 = ap_phi_mux_p_Val2_s_phi_fu_240_p4[19:0];

assign tmp_user_V_fu_292_p1 = s_axis_video_TUSER;

endmodule //AXIVideo2BayerMat
