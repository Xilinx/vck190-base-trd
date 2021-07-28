// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ISPPipeline_accel_gaincontrol_3_1_2160_3840_2_Pipeline_ColLoop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        imgInput2_4196_dout,
        imgInput2_4196_empty_n,
        imgInput2_4196_read,
        gain_out_4197_din,
        gain_out_4197_full_n,
        gain_out_4197_write,
        width_cast,
        rhs,
        ret,
        rhs_37
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] imgInput2_4196_dout;
input   imgInput2_4196_empty_n;
output   imgInput2_4196_read;
output  [31:0] gain_out_4197_din;
input   gain_out_4197_full_n;
output   gain_out_4197_write;
input  [10:0] width_cast;
input  [15:0] rhs;
input  [0:0] ret;
input  [15:0] rhs_37;

reg ap_idle;
reg imgInput2_4196_read;
reg gain_out_4197_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln90_fu_131_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    imgInput2_4196_blk_n;
wire    ap_block_pp0_stage0;
reg    gain_out_4197_blk_n;
wire   [0:0] ret_read_reg_270;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] rhs_37_cast_fu_109_p1;
reg   [31:0] rhs_37_cast_reg_276;
wire   [31:0] rhs_cast_fu_113_p1;
reg   [31:0] rhs_cast_reg_281;
wire   [15:0] trunc_ln674_fu_142_p1;
reg   [15:0] trunc_ln674_reg_290;
reg   [15:0] trunc_ln674_reg_290_pp0_iter2_reg;
reg   [15:0] trunc_ln674_reg_290_pp0_iter3_reg;
wire   [15:0] p_Result_1_fu_150_p4;
reg   [15:0] p_Result_1_reg_300;
reg   [15:0] p_Result_1_reg_300_pp0_iter2_reg;
reg   [15:0] p_Result_1_reg_300_pp0_iter3_reg;
reg   [10:0] j_V_fu_68;
wire    ap_loop_init;
reg   [10:0] ap_sig_allocacmp_j_V_4;
wire   [10:0] j_V_5_fu_125_p2;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] tmp_fu_164_p1;
wire  signed [31:0] grp_fu_249_p2;
wire   [8:0] tmp_fu_164_p4;
wire   [31:0] trunc_ln_fu_179_p1;
wire   [0:0] icmp_ln55_fu_173_p2;
wire   [15:0] trunc_ln_fu_179_p4;
wire   [15:0] select_ln315_fu_188_p3;
wire   [31:0] tmp_65_fu_202_p1;
wire  signed [31:0] grp_fu_256_p2;
wire   [8:0] tmp_65_fu_202_p4;
wire   [31:0] trunc_ln315_6_fu_217_p1;
wire   [0:0] icmp_ln55_1_fu_211_p2;
wire   [15:0] trunc_ln315_6_fu_217_p4;
wire   [15:0] select_ln315_6_fu_226_p3;
wire   [15:0] select_ln1057_1_fu_234_p3;
wire   [15:0] select_ln1057_fu_196_p3;
wire   [15:0] grp_fu_249_p0;
wire   [15:0] grp_fu_249_p1;
wire   [15:0] grp_fu_256_p0;
wire   [15:0] grp_fu_256_p1;
reg    grp_fu_249_ce;
reg    grp_fu_256_ce;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [31:0] grp_fu_249_p00;
wire   [31:0] grp_fu_256_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_done_reg = 1'b0;
end

ISPPipeline_accel_mul_mul_16ns_16ns_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16ns_16ns_32_4_1_U66(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_249_p0),
    .din1(grp_fu_249_p1),
    .ce(grp_fu_249_ce),
    .dout(grp_fu_249_p2)
);

ISPPipeline_accel_mul_mul_16ns_16ns_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16ns_16ns_32_4_1_U67(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_256_p0),
    .din1(grp_fu_256_p1),
    .ce(grp_fu_256_ce),
    .dout(grp_fu_256_p2)
);

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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln90_fu_131_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            j_V_fu_68 <= j_V_5_fu_125_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_V_fu_68 <= 11'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        p_Result_1_reg_300 <= {{imgInput2_4196_dout[31:16]}};
        rhs_37_cast_reg_276[15 : 0] <= rhs_37_cast_fu_109_p1[15 : 0];
        rhs_cast_reg_281[15 : 0] <= rhs_cast_fu_113_p1[15 : 0];
        trunc_ln674_reg_290 <= trunc_ln674_fu_142_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        p_Result_1_reg_300_pp0_iter2_reg <= p_Result_1_reg_300;
        p_Result_1_reg_300_pp0_iter3_reg <= p_Result_1_reg_300_pp0_iter2_reg;
        trunc_ln674_reg_290_pp0_iter2_reg <= trunc_ln674_reg_290;
        trunc_ln674_reg_290_pp0_iter3_reg <= trunc_ln674_reg_290_pp0_iter2_reg;
    end
end

always @ (*) begin
    if (((icmp_ln90_fu_131_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_V_4 = 11'd0;
    end else begin
        ap_sig_allocacmp_j_V_4 = j_V_fu_68;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        gain_out_4197_blk_n = gain_out_4197_full_n;
    end else begin
        gain_out_4197_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        gain_out_4197_write = 1'b1;
    end else begin
        gain_out_4197_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_249_ce = 1'b1;
    end else begin
        grp_fu_249_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_256_ce = 1'b1;
    end else begin
        grp_fu_256_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        imgInput2_4196_blk_n = imgInput2_4196_empty_n;
    end else begin
        imgInput2_4196_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        imgInput2_4196_read = 1'b1;
    end else begin
        imgInput2_4196_read = 1'b0;
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

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((gain_out_4197_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((imgInput2_4196_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((gain_out_4197_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((imgInput2_4196_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((gain_out_4197_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((imgInput2_4196_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (imgInput2_4196_empty_n == 1'b0);
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter4 = (gain_out_4197_full_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign gain_out_4197_din = {{select_ln1057_1_fu_234_p3}, {select_ln1057_fu_196_p3}};

assign grp_fu_249_p0 = grp_fu_249_p00;

assign grp_fu_249_p00 = trunc_ln674_fu_142_p1;

assign grp_fu_249_p1 = rhs_cast_reg_281;

assign grp_fu_256_p0 = grp_fu_256_p00;

assign grp_fu_256_p00 = p_Result_1_fu_150_p4;

assign grp_fu_256_p1 = rhs_37_cast_reg_276;

assign icmp_ln55_1_fu_211_p2 = ((tmp_65_fu_202_p4 != 9'd0) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_173_p2 = ((tmp_fu_164_p4 != 9'd0) ? 1'b1 : 1'b0);

assign icmp_ln90_fu_131_p2 = ((ap_sig_allocacmp_j_V_4 == width_cast) ? 1'b1 : 1'b0);

assign j_V_5_fu_125_p2 = (ap_sig_allocacmp_j_V_4 + 11'd1);

assign p_Result_1_fu_150_p4 = {{imgInput2_4196_dout[31:16]}};

assign ret_read_reg_270 = ret;

assign rhs_37_cast_fu_109_p1 = rhs_37;

assign rhs_cast_fu_113_p1 = rhs;

assign select_ln1057_1_fu_234_p3 = ((ret[0:0] == 1'b1) ? select_ln315_6_fu_226_p3 : p_Result_1_reg_300_pp0_iter3_reg);

assign select_ln1057_fu_196_p3 = ((ret[0:0] == 1'b1) ? trunc_ln674_reg_290_pp0_iter3_reg : select_ln315_fu_188_p3);

assign select_ln315_6_fu_226_p3 = ((icmp_ln55_1_fu_211_p2[0:0] == 1'b1) ? 16'd65535 : trunc_ln315_6_fu_217_p4);

assign select_ln315_fu_188_p3 = ((icmp_ln55_fu_173_p2[0:0] == 1'b1) ? 16'd65535 : trunc_ln_fu_179_p4);

assign tmp_65_fu_202_p1 = grp_fu_256_p2;

assign tmp_65_fu_202_p4 = {{tmp_65_fu_202_p1[31:23]}};

assign tmp_fu_164_p1 = grp_fu_249_p2;

assign tmp_fu_164_p4 = {{tmp_fu_164_p1[31:23]}};

assign trunc_ln315_6_fu_217_p1 = grp_fu_256_p2;

assign trunc_ln315_6_fu_217_p4 = {{trunc_ln315_6_fu_217_p1[22:7]}};

assign trunc_ln674_fu_142_p1 = imgInput2_4196_dout[15:0];

assign trunc_ln_fu_179_p1 = grp_fu_249_p2;

assign trunc_ln_fu_179_p4 = {{trunc_ln_fu_179_p1[22:7]}};

always @ (posedge ap_clk) begin
    rhs_37_cast_reg_276[31:16] <= 16'b0000000000000000;
    rhs_cast_reg_281[31:16] <= 16'b0000000000000000;
end

endmodule //ISPPipeline_accel_gaincontrol_3_1_2160_3840_2_Pipeline_ColLoop
