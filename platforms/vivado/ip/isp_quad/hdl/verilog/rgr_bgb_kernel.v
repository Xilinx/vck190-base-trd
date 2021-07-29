// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.2
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rgr_bgb_kernel (
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
        loop_r,
        ap_return,
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
input  [0:0] loop_r;
output  [13:0] ap_return;
input   ap_ce;

wire   [12:0] ret_V_3_fu_558_p2;
reg   [12:0] ret_V_3_reg_788;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [9:0] lshr_ln_reg_793;
wire   [13:0] add_ln96_fu_680_p2;
reg   [13:0] add_ln96_reg_798;
reg   [13:0] add_ln96_reg_798_pp0_iter1_reg;
wire   [13:0] sub_ln96_fu_692_p2;
reg   [13:0] sub_ln96_reg_803;
wire    ap_block_pp0_stage0;
wire   [1:0] or_ln_fu_300_p3;
wire   [2:0] zext_ln215_fu_308_p1;
wire   [9:0] tmp_s_fu_312_p8;
wire   [9:0] tmp_19_fu_334_p8;
wire   [10:0] rhs_V_fu_352_p1;
wire   [10:0] lhs_V_fu_330_p1;
wire   [2:0] select_ln215_fu_362_p3;
wire   [9:0] tmp_20_fu_370_p8;
wire   [2:0] select_ln215_1_fu_392_p3;
wire   [9:0] tmp_21_fu_400_p8;
wire   [10:0] rhs_V_1_fu_418_p1;
wire   [10:0] lhs_V_1_fu_388_p1;
wire   [10:0] ret_V_1_fu_422_p2;
wire   [2:0] tmp_22_fu_432_p7;
wire   [9:0] tmp_22_fu_432_p8;
wire   [2:0] tmp_23_fu_462_p7;
wire   [9:0] tmp_23_fu_462_p8;
wire   [10:0] zext_ln215_6_fu_450_p1;
wire   [10:0] zext_ln1353_12_fu_480_p1;
wire   [10:0] add_ln1353_fu_484_p2;
wire   [11:0] zext_ln1353_13_fu_490_p1;
wire   [11:0] lhs_V_2_fu_428_p1;
wire   [11:0] ret_V_2_fu_494_p2;
wire   [9:0] tmp_fu_504_p8;
wire   [9:0] tmp_24_fu_526_p8;
wire   [10:0] zext_ln215_7_fu_522_p1;
wire   [10:0] zext_ln1353_14_fu_544_p1;
wire   [10:0] add_ln1353_4_fu_548_p2;
wire   [12:0] zext_ln1353_15_fu_554_p1;
wire   [12:0] zext_ln1353_fu_500_p1;
wire   [9:0] tmp_25_fu_564_p8;
wire   [9:0] tmp_26_fu_586_p8;
wire   [10:0] rhs_V_2_fu_604_p1;
wire   [10:0] lhs_V_3_fu_582_p1;
wire   [10:0] ret_V_4_fu_608_p2;
wire   [12:0] t3_fu_614_p3;
wire   [9:0] tmp_27_fu_626_p8;
wire   [11:0] shl_ln_fu_648_p3;
wire   [12:0] zext_ln95_1_fu_656_p1;
wire   [12:0] zext_ln95_fu_644_p1;
wire   [12:0] t4_fu_660_p2;
wire   [10:0] ret_V_fu_356_p2;
wire   [13:0] zext_ln94_fu_622_p1;
wire   [13:0] zext_ln95_2_fu_666_p1;
wire   [13:0] zext_ln96_fu_689_p1;
wire   [13:0] zext_ln91_fu_686_p1;
wire   [14:0] zext_ln96_1_fu_701_p1;
wire  signed [14:0] sext_ln96_fu_698_p1;
wire   [14:0] res_fu_704_p2;
wire   [14:0] sub_ln97_fu_718_p2;
wire   [11:0] trunc_ln97_3_fu_724_p4;
wire  signed [12:0] sext_ln97_fu_734_p1;
wire   [13:0] zext_ln97_fu_738_p1;
wire   [11:0] trunc_ln97_4_fu_748_p4;
wire  signed [12:0] sext_ln97_1_fu_758_p1;
wire   [0:0] tmp_65_fu_710_p3;
wire   [13:0] sub_ln97_1_fu_742_p2;
wire   [13:0] zext_ln97_1_fu_762_p1;
wire   [0:0] icmp_ln98_fu_774_p2;
wire   [13:0] select_ln97_fu_766_p3;
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
reg   [0:0] loop_r_int_reg;

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
ISPPipeline_accelkbM_U141(
    .din0(imgblock_0_0_V_read_int_reg),
    .din1(imgblock_0_1_V_read_int_reg),
    .din2(imgblock_0_2_V_read_int_reg),
    .din3(imgblock_0_3_V_read_int_reg),
    .din4(imgblock_0_4_V_read_int_reg),
    .din5(imgblock_0_5_V_read_int_reg),
    .din6(zext_ln215_fu_308_p1),
    .dout(tmp_s_fu_312_p8)
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
ISPPipeline_accelkbM_U142(
    .din0(imgblock_4_0_V_read_int_reg),
    .din1(imgblock_4_1_V_read_int_reg),
    .din2(imgblock_4_2_V_read_int_reg),
    .din3(imgblock_4_3_V_read_int_reg),
    .din4(imgblock_4_4_V_read_int_reg),
    .din5(imgblock_4_5_V_read_int_reg),
    .din6(zext_ln215_fu_308_p1),
    .dout(tmp_19_fu_334_p8)
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
ISPPipeline_accelkbM_U143(
    .din0(imgblock_1_0_V_read_int_reg),
    .din1(imgblock_1_1_V_read_int_reg),
    .din2(imgblock_1_2_V_read_int_reg),
    .din3(imgblock_1_3_V_read_int_reg),
    .din4(imgblock_1_4_V_read_int_reg),
    .din5(imgblock_1_5_V_read_int_reg),
    .din6(select_ln215_fu_362_p3),
    .dout(tmp_20_fu_370_p8)
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
ISPPipeline_accelkbM_U144(
    .din0(imgblock_1_0_V_read_int_reg),
    .din1(imgblock_1_1_V_read_int_reg),
    .din2(imgblock_1_2_V_read_int_reg),
    .din3(imgblock_1_3_V_read_int_reg),
    .din4(imgblock_1_4_V_read_int_reg),
    .din5(imgblock_1_5_V_read_int_reg),
    .din6(select_ln215_1_fu_392_p3),
    .dout(tmp_21_fu_400_p8)
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
ISPPipeline_accelkbM_U145(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(tmp_22_fu_432_p7),
    .dout(tmp_22_fu_432_p8)
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
ISPPipeline_accelkbM_U146(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(tmp_23_fu_462_p7),
    .dout(tmp_23_fu_462_p8)
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
ISPPipeline_accelkbM_U147(
    .din0(imgblock_3_0_V_read_int_reg),
    .din1(imgblock_3_1_V_read_int_reg),
    .din2(imgblock_3_2_V_read_int_reg),
    .din3(imgblock_3_3_V_read_int_reg),
    .din4(imgblock_3_4_V_read_int_reg),
    .din5(imgblock_3_5_V_read_int_reg),
    .din6(select_ln215_fu_362_p3),
    .dout(tmp_fu_504_p8)
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
ISPPipeline_accelkbM_U148(
    .din0(imgblock_3_0_V_read_int_reg),
    .din1(imgblock_3_1_V_read_int_reg),
    .din2(imgblock_3_2_V_read_int_reg),
    .din3(imgblock_3_3_V_read_int_reg),
    .din4(imgblock_3_4_V_read_int_reg),
    .din5(imgblock_3_5_V_read_int_reg),
    .din6(select_ln215_1_fu_392_p3),
    .dout(tmp_24_fu_526_p8)
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
ISPPipeline_accelkbM_U149(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(select_ln215_fu_362_p3),
    .dout(tmp_25_fu_564_p8)
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
ISPPipeline_accelkbM_U150(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(select_ln215_1_fu_392_p3),
    .dout(tmp_26_fu_586_p8)
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
ISPPipeline_accelkbM_U151(
    .din0(imgblock_2_0_V_read_int_reg),
    .din1(imgblock_2_1_V_read_int_reg),
    .din2(imgblock_2_2_V_read_int_reg),
    .din3(imgblock_2_3_V_read_int_reg),
    .din4(imgblock_2_4_V_read_int_reg),
    .din5(imgblock_2_5_V_read_int_reg),
    .din6(zext_ln215_fu_308_p1),
    .dout(tmp_27_fu_626_p8)
);

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce))) begin
        add_ln96_reg_798 <= add_ln96_fu_680_p2;
        add_ln96_reg_798_pp0_iter1_reg <= add_ln96_reg_798;
        lshr_ln_reg_793 <= {{ret_V_fu_356_p2[10:1]}};
        ret_V_3_reg_788 <= ret_V_3_fu_558_p2;
        sub_ln96_reg_803 <= sub_ln96_fu_692_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
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
    end
end

assign add_ln1353_4_fu_548_p2 = (zext_ln215_7_fu_522_p1 + zext_ln1353_14_fu_544_p1);

assign add_ln1353_fu_484_p2 = (zext_ln215_6_fu_450_p1 + zext_ln1353_12_fu_480_p1);

assign add_ln96_fu_680_p2 = (zext_ln94_fu_622_p1 + zext_ln95_2_fu_666_p1);

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_return = ((icmp_ln98_fu_774_p2[0:0] === 1'b1) ? 14'd0 : select_ln97_fu_766_p3);

assign icmp_ln98_fu_774_p2 = (($signed(res_fu_704_p2) < $signed(15'd32761)) ? 1'b1 : 1'b0);

assign lhs_V_1_fu_388_p1 = tmp_20_fu_370_p8;

assign lhs_V_2_fu_428_p1 = ret_V_1_fu_422_p2;

assign lhs_V_3_fu_582_p1 = tmp_25_fu_564_p8;

assign lhs_V_fu_330_p1 = tmp_s_fu_312_p8;

assign or_ln_fu_300_p3 = {{1'd1}, {loop_r_int_reg}};

assign res_fu_704_p2 = ($signed(zext_ln96_1_fu_701_p1) + $signed(sext_ln96_fu_698_p1));

assign ret_V_1_fu_422_p2 = (rhs_V_1_fu_418_p1 + lhs_V_1_fu_388_p1);

assign ret_V_2_fu_494_p2 = (zext_ln1353_13_fu_490_p1 + lhs_V_2_fu_428_p1);

assign ret_V_3_fu_558_p2 = (zext_ln1353_15_fu_554_p1 + zext_ln1353_fu_500_p1);

assign ret_V_4_fu_608_p2 = (rhs_V_2_fu_604_p1 + lhs_V_3_fu_582_p1);

assign ret_V_fu_356_p2 = (rhs_V_fu_352_p1 + lhs_V_fu_330_p1);

assign rhs_V_1_fu_418_p1 = tmp_21_fu_400_p8;

assign rhs_V_2_fu_604_p1 = tmp_26_fu_586_p8;

assign rhs_V_fu_352_p1 = tmp_19_fu_334_p8;

assign select_ln215_1_fu_392_p3 = ((loop_r_int_reg[0:0] === 1'b1) ? 3'd4 : 3'd3);

assign select_ln215_fu_362_p3 = ((loop_r_int_reg[0:0] === 1'b1) ? 3'd2 : 3'd1);

assign select_ln97_fu_766_p3 = ((tmp_65_fu_710_p3[0:0] === 1'b1) ? sub_ln97_1_fu_742_p2 : zext_ln97_1_fu_762_p1);

assign sext_ln96_fu_698_p1 = $signed(sub_ln96_reg_803);

assign sext_ln97_1_fu_758_p1 = $signed(trunc_ln97_4_fu_748_p4);

assign sext_ln97_fu_734_p1 = $signed(trunc_ln97_3_fu_724_p4);

assign shl_ln_fu_648_p3 = {{tmp_27_fu_626_p8}, {2'd0}};

assign sub_ln96_fu_692_p2 = (zext_ln96_fu_689_p1 - zext_ln91_fu_686_p1);

assign sub_ln97_1_fu_742_p2 = (14'd0 - zext_ln97_fu_738_p1);

assign sub_ln97_fu_718_p2 = (15'd0 - res_fu_704_p2);

assign t3_fu_614_p3 = {{ret_V_4_fu_608_p2}, {2'd0}};

assign t4_fu_660_p2 = (zext_ln95_1_fu_656_p1 + zext_ln95_fu_644_p1);

assign tmp_22_fu_432_p7 = loop_r_int_reg;

assign tmp_23_fu_462_p7 = {{2'd2}, {loop_r_int_reg}};

assign tmp_65_fu_710_p3 = res_fu_704_p2[32'd14];

assign trunc_ln97_3_fu_724_p4 = {{sub_ln97_fu_718_p2[14:3]}};

assign trunc_ln97_4_fu_748_p4 = {{res_fu_704_p2[14:3]}};

assign zext_ln1353_12_fu_480_p1 = tmp_23_fu_462_p8;

assign zext_ln1353_13_fu_490_p1 = add_ln1353_fu_484_p2;

assign zext_ln1353_14_fu_544_p1 = tmp_24_fu_526_p8;

assign zext_ln1353_15_fu_554_p1 = add_ln1353_4_fu_548_p2;

assign zext_ln1353_fu_500_p1 = ret_V_2_fu_494_p2;

assign zext_ln215_6_fu_450_p1 = tmp_22_fu_432_p8;

assign zext_ln215_7_fu_522_p1 = tmp_fu_504_p8;

assign zext_ln215_fu_308_p1 = or_ln_fu_300_p3;

assign zext_ln91_fu_686_p1 = ret_V_3_reg_788;

assign zext_ln94_fu_622_p1 = t3_fu_614_p3;

assign zext_ln95_1_fu_656_p1 = shl_ln_fu_648_p3;

assign zext_ln95_2_fu_666_p1 = t4_fu_660_p2;

assign zext_ln95_fu_644_p1 = tmp_27_fu_626_p8;

assign zext_ln96_1_fu_701_p1 = add_ln96_reg_798_pp0_iter1_reg;

assign zext_ln96_fu_689_p1 = lshr_ln_reg_793;

assign zext_ln97_1_fu_762_p1 = $unsigned(sext_ln97_1_fu_758_p1);

assign zext_ln97_fu_738_p1 = $unsigned(sext_ln97_fu_734_p1);

endmodule //rgr_bgb_kernel
