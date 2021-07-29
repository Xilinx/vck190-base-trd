// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.2
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module badpixelcorrection (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_src_rows_dout,
        p_src_rows_empty_n,
        p_src_rows_read,
        p_src_cols_dout,
        p_src_cols_empty_n,
        p_src_cols_read,
        p_src_data_V_V_dout,
        p_src_data_V_V_empty_n,
        p_src_data_V_V_read,
        p_dst_data_V_V_din,
        p_dst_data_V_V_full_n,
        p_dst_data_V_V_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] p_src_rows_dout;
input   p_src_rows_empty_n;
output   p_src_rows_read;
input  [15:0] p_src_cols_dout;
input   p_src_cols_empty_n;
output   p_src_cols_read;
input  [19:0] p_src_data_V_V_dout;
input   p_src_data_V_V_empty_n;
output   p_src_data_V_V_read;
output  [19:0] p_dst_data_V_V_din;
input   p_dst_data_V_V_full_n;
output   p_dst_data_V_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_src_rows_read;
reg p_src_cols_read;
reg p_src_data_V_V_read;
reg p_dst_data_V_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    p_src_rows_blk_n;
reg    p_src_cols_blk_n;
reg   [15:0] p_src_rows_read_reg_94;
reg    ap_block_state1;
reg   [15:0] p_src_cols_read_reg_99;
wire   [19:0] bpc_buff_val_V_0_i_q0;
wire   [19:0] bpc_buff_val_V_1_i_q0;
wire   [19:0] bpc_buff_val_V_2_i_q0;
wire   [19:0] bpc_buff_val_V_3_i_q0;
wire   [19:0] bpc_buff_val_V_4_i_q0;
wire    grp_process_image_fu_72_ap_start;
wire    grp_process_image_fu_72_ap_done;
wire    grp_process_image_fu_72_ap_idle;
wire    grp_process_image_fu_72_ap_ready;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address0;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce0;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_we1;
wire   [19:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_d1;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address0;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce0;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_we1;
wire   [19:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_d1;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address0;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce0;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_we1;
wire   [19:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_d1;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address0;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce0;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_we1;
wire   [19:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_d1;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address0;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce0;
wire   [9:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce1;
wire    grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_we1;
wire   [19:0] grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_d1;
wire    grp_process_image_fu_72_p_src_data_V_V_read;
wire   [19:0] grp_process_image_fu_72_p_dst_data_V_V_din;
wire    grp_process_image_fu_72_p_dst_data_V_V_write;
reg    grp_process_image_fu_72_ap_start_reg;
reg    ap_block_state1_ignore_call14;
wire    ap_CS_fsm_state2;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 grp_process_image_fu_72_ap_start_reg = 1'b0;
end

badpixelcorrectioeOg #(
    .DataWidth( 20 ),
    .AddressRange( 960 ),
    .AddressWidth( 10 ))
bpc_buff_val_V_0_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address0),
    .ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce0),
    .q0(bpc_buff_val_V_0_i_q0),
    .address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address1),
    .ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce1),
    .we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_we1),
    .d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_d1)
);

badpixelcorrectioeOg #(
    .DataWidth( 20 ),
    .AddressRange( 960 ),
    .AddressWidth( 10 ))
bpc_buff_val_V_1_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address0),
    .ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce0),
    .q0(bpc_buff_val_V_1_i_q0),
    .address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address1),
    .ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce1),
    .we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_we1),
    .d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_d1)
);

badpixelcorrectioeOg #(
    .DataWidth( 20 ),
    .AddressRange( 960 ),
    .AddressWidth( 10 ))
bpc_buff_val_V_2_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address0),
    .ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce0),
    .q0(bpc_buff_val_V_2_i_q0),
    .address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address1),
    .ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce1),
    .we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_we1),
    .d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_d1)
);

badpixelcorrectioeOg #(
    .DataWidth( 20 ),
    .AddressRange( 960 ),
    .AddressWidth( 10 ))
bpc_buff_val_V_3_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address0),
    .ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce0),
    .q0(bpc_buff_val_V_3_i_q0),
    .address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address1),
    .ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce1),
    .we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_we1),
    .d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_d1)
);

badpixelcorrectioeOg #(
    .DataWidth( 20 ),
    .AddressRange( 960 ),
    .AddressWidth( 10 ))
bpc_buff_val_V_4_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address0),
    .ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce0),
    .q0(bpc_buff_val_V_4_i_q0),
    .address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address1),
    .ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce1),
    .we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_we1),
    .d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_d1)
);

process_image grp_process_image_fu_72(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_process_image_fu_72_ap_start),
    .ap_done(grp_process_image_fu_72_ap_done),
    .ap_idle(grp_process_image_fu_72_ap_idle),
    .ap_ready(grp_process_image_fu_72_ap_ready),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_q0(bpc_buff_val_V_0_i_q0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_address1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_ce1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_we1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_0_V_d1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_q0(bpc_buff_val_V_1_i_q0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_address1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_ce1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_we1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_1_V_d1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_q0(bpc_buff_val_V_2_i_q0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_address1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_ce1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_we1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_2_V_d1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_q0(bpc_buff_val_V_3_i_q0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_address1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_ce1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_we1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_3_V_d1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce0(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_q0(bpc_buff_val_V_4_i_q0),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_address1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_ce1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_we1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_we1),
    .GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_d1(grp_process_image_fu_72_GenericBPC_xf_cv_BPC_13_2_13_1080_1920_5_5_2_0_0_buff_val_4_V_d1),
    .p_src_rows_read(p_src_rows_read_reg_94),
    .p_src_cols_read(p_src_cols_read_reg_99),
    .p_src_data_V_V_dout(p_src_data_V_V_dout),
    .p_src_data_V_V_empty_n(p_src_data_V_V_empty_n),
    .p_src_data_V_V_read(grp_process_image_fu_72_p_src_data_V_V_read),
    .p_dst_data_V_V_din(grp_process_image_fu_72_p_dst_data_V_V_din),
    .p_dst_data_V_V_full_n(p_dst_data_V_V_full_n),
    .p_dst_data_V_V_write(grp_process_image_fu_72_p_dst_data_V_V_write)
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
        end else if (((1'b1 == ap_CS_fsm_state2) & (grp_process_image_fu_72_ap_done == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_process_image_fu_72_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_process_image_fu_72_ap_start_reg <= 1'b1;
        end else if ((grp_process_image_fu_72_ap_ready == 1'b1)) begin
            grp_process_image_fu_72_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_read_reg_99 <= p_src_cols_dout;
        p_src_rows_read_reg_94 <= p_src_rows_dout;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (grp_process_image_fu_72_ap_done == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (grp_process_image_fu_72_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_dst_data_V_V_write = grp_process_image_fu_72_p_dst_data_V_V_write;
    end else begin
        p_dst_data_V_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_blk_n = p_src_cols_empty_n;
    end else begin
        p_src_cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_read = 1'b1;
    end else begin
        p_src_cols_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_src_data_V_V_read = grp_process_image_fu_72_p_src_data_V_V_read;
    end else begin
        p_src_data_V_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_rows_blk_n = p_src_rows_empty_n;
    end else begin
        p_src_rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_rows_read = 1'b1;
    end else begin
        p_src_rows_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (grp_process_image_fu_72_ap_done == 1'b1))) begin
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
    ap_block_state1 = ((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call14 = ((ap_start == 1'b0) | (p_src_cols_empty_n == 1'b0) | (p_src_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_process_image_fu_72_ap_start = grp_process_image_fu_72_ap_start_reg;

assign p_dst_data_V_V_din = grp_process_image_fu_72_p_dst_data_V_V_din;

endmodule //badpixelcorrection
