
    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [2:0] proc_0_data_FIFO_blk;
    wire [2:0] proc_0_data_PIPO_blk;
    wire [2:0] proc_0_start_FIFO_blk;
    wire [2:0] proc_0_TLF_FIFO_blk;
    wire [2:0] proc_0_input_sync_blk;
    wire [2:0] proc_0_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_0;
    reg [2:0] proc_dep_vld_vec_0_reg;
    wire [3:0] in_chan_dep_vld_vec_0;
    wire [55:0] in_chan_dep_data_vec_0;
    wire [3:0] token_in_vec_0;
    wire [2:0] out_chan_dep_vld_vec_0;
    wire [13:0] out_chan_dep_data_0;
    wire [2:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [13:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_4_0;
    wire [13:0] dep_chan_data_4_0;
    wire token_4_0;
    wire dep_chan_vld_6_0;
    wire [13:0] dep_chan_data_6_0;
    wire token_6_0;
    wire dep_chan_vld_11_0;
    wire [13:0] dep_chan_data_11_0;
    wire token_11_0;
    wire [2:0] proc_1_data_FIFO_blk;
    wire [2:0] proc_1_data_PIPO_blk;
    wire [2:0] proc_1_start_FIFO_blk;
    wire [2:0] proc_1_TLF_FIFO_blk;
    wire [2:0] proc_1_input_sync_blk;
    wire [2:0] proc_1_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_1;
    reg [2:0] proc_dep_vld_vec_1_reg;
    wire [8:0] in_chan_dep_vld_vec_1;
    wire [125:0] in_chan_dep_data_vec_1;
    wire [8:0] token_in_vec_1;
    wire [2:0] out_chan_dep_vld_vec_1;
    wire [13:0] out_chan_dep_data_1;
    wire [2:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [13:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_2_1;
    wire [13:0] dep_chan_data_2_1;
    wire token_2_1;
    wire dep_chan_vld_4_1;
    wire [13:0] dep_chan_data_4_1;
    wire token_4_1;
    wire dep_chan_vld_5_1;
    wire [13:0] dep_chan_data_5_1;
    wire token_5_1;
    wire dep_chan_vld_6_1;
    wire [13:0] dep_chan_data_6_1;
    wire token_6_1;
    wire dep_chan_vld_10_1;
    wire [13:0] dep_chan_data_10_1;
    wire token_10_1;
    wire dep_chan_vld_11_1;
    wire [13:0] dep_chan_data_11_1;
    wire token_11_1;
    wire dep_chan_vld_12_1;
    wire [13:0] dep_chan_data_12_1;
    wire token_12_1;
    wire dep_chan_vld_13_1;
    wire [13:0] dep_chan_data_13_1;
    wire token_13_1;
    wire [1:0] proc_2_data_FIFO_blk;
    wire [1:0] proc_2_data_PIPO_blk;
    wire [1:0] proc_2_start_FIFO_blk;
    wire [1:0] proc_2_TLF_FIFO_blk;
    wire [1:0] proc_2_input_sync_blk;
    wire [1:0] proc_2_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_2;
    reg [1:0] proc_dep_vld_vec_2_reg;
    wire [0:0] in_chan_dep_vld_vec_2;
    wire [13:0] in_chan_dep_data_vec_2;
    wire [0:0] token_in_vec_2;
    wire [1:0] out_chan_dep_vld_vec_2;
    wire [13:0] out_chan_dep_data_2;
    wire [1:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_3_2;
    wire [13:0] dep_chan_data_3_2;
    wire token_3_2;
    wire [1:0] proc_3_data_FIFO_blk;
    wire [1:0] proc_3_data_PIPO_blk;
    wire [1:0] proc_3_start_FIFO_blk;
    wire [1:0] proc_3_TLF_FIFO_blk;
    wire [1:0] proc_3_input_sync_blk;
    wire [1:0] proc_3_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_3;
    reg [1:0] proc_dep_vld_vec_3_reg;
    wire [1:0] in_chan_dep_vld_vec_3;
    wire [27:0] in_chan_dep_data_vec_3;
    wire [1:0] token_in_vec_3;
    wire [1:0] out_chan_dep_vld_vec_3;
    wire [13:0] out_chan_dep_data_3;
    wire [1:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_2_3;
    wire [13:0] dep_chan_data_2_3;
    wire token_2_3;
    wire dep_chan_vld_4_3;
    wire [13:0] dep_chan_data_4_3;
    wire token_4_3;
    wire [3:0] proc_4_data_FIFO_blk;
    wire [3:0] proc_4_data_PIPO_blk;
    wire [3:0] proc_4_start_FIFO_blk;
    wire [3:0] proc_4_TLF_FIFO_blk;
    wire [3:0] proc_4_input_sync_blk;
    wire [3:0] proc_4_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_4;
    reg [3:0] proc_dep_vld_vec_4_reg;
    wire [1:0] in_chan_dep_vld_vec_4;
    wire [27:0] in_chan_dep_data_vec_4;
    wire [1:0] token_in_vec_4;
    wire [3:0] out_chan_dep_vld_vec_4;
    wire [13:0] out_chan_dep_data_4;
    wire [3:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_3_4;
    wire [13:0] dep_chan_data_3_4;
    wire token_3_4;
    wire dep_chan_vld_5_4;
    wire [13:0] dep_chan_data_5_4;
    wire token_5_4;
    wire [2:0] proc_5_data_FIFO_blk;
    wire [2:0] proc_5_data_PIPO_blk;
    wire [2:0] proc_5_start_FIFO_blk;
    wire [2:0] proc_5_TLF_FIFO_blk;
    wire [2:0] proc_5_input_sync_blk;
    wire [2:0] proc_5_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_5;
    reg [2:0] proc_dep_vld_vec_5_reg;
    wire [1:0] in_chan_dep_vld_vec_5;
    wire [27:0] in_chan_dep_data_vec_5;
    wire [1:0] token_in_vec_5;
    wire [2:0] out_chan_dep_vld_vec_5;
    wire [13:0] out_chan_dep_data_5;
    wire [2:0] token_out_vec_5;
    wire dl_detect_out_5;
    wire dep_chan_vld_4_5;
    wire [13:0] dep_chan_data_4_5;
    wire token_4_5;
    wire dep_chan_vld_6_5;
    wire [13:0] dep_chan_data_6_5;
    wire token_6_5;
    wire [5:0] proc_6_data_FIFO_blk;
    wire [5:0] proc_6_data_PIPO_blk;
    wire [5:0] proc_6_start_FIFO_blk;
    wire [5:0] proc_6_TLF_FIFO_blk;
    wire [5:0] proc_6_input_sync_blk;
    wire [5:0] proc_6_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_6;
    reg [5:0] proc_dep_vld_vec_6_reg;
    wire [5:0] in_chan_dep_vld_vec_6;
    wire [83:0] in_chan_dep_data_vec_6;
    wire [5:0] token_in_vec_6;
    wire [5:0] out_chan_dep_vld_vec_6;
    wire [13:0] out_chan_dep_data_6;
    wire [5:0] token_out_vec_6;
    wire dl_detect_out_6;
    wire dep_chan_vld_0_6;
    wire [13:0] dep_chan_data_0_6;
    wire token_0_6;
    wire dep_chan_vld_1_6;
    wire [13:0] dep_chan_data_1_6;
    wire token_1_6;
    wire dep_chan_vld_5_6;
    wire [13:0] dep_chan_data_5_6;
    wire token_5_6;
    wire dep_chan_vld_9_6;
    wire [13:0] dep_chan_data_9_6;
    wire token_9_6;
    wire dep_chan_vld_11_6;
    wire [13:0] dep_chan_data_11_6;
    wire token_11_6;
    wire dep_chan_vld_13_6;
    wire [13:0] dep_chan_data_13_6;
    wire token_13_6;
    wire [0:0] proc_7_data_FIFO_blk;
    wire [0:0] proc_7_data_PIPO_blk;
    wire [0:0] proc_7_start_FIFO_blk;
    wire [0:0] proc_7_TLF_FIFO_blk;
    wire [0:0] proc_7_input_sync_blk;
    wire [0:0] proc_7_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_7;
    reg [0:0] proc_dep_vld_vec_7_reg;
    wire [0:0] in_chan_dep_vld_vec_7;
    wire [13:0] in_chan_dep_data_vec_7;
    wire [0:0] token_in_vec_7;
    wire [0:0] out_chan_dep_vld_vec_7;
    wire [13:0] out_chan_dep_data_7;
    wire [0:0] token_out_vec_7;
    wire dl_detect_out_7;
    wire dep_chan_vld_8_7;
    wire [13:0] dep_chan_data_8_7;
    wire token_8_7;
    wire [0:0] proc_8_data_FIFO_blk;
    wire [0:0] proc_8_data_PIPO_blk;
    wire [0:0] proc_8_start_FIFO_blk;
    wire [0:0] proc_8_TLF_FIFO_blk;
    wire [0:0] proc_8_input_sync_blk;
    wire [0:0] proc_8_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_8;
    reg [0:0] proc_dep_vld_vec_8_reg;
    wire [0:0] in_chan_dep_vld_vec_8;
    wire [13:0] in_chan_dep_data_vec_8;
    wire [0:0] token_in_vec_8;
    wire [0:0] out_chan_dep_vld_vec_8;
    wire [13:0] out_chan_dep_data_8;
    wire [0:0] token_out_vec_8;
    wire dl_detect_out_8;
    wire dep_chan_vld_7_8;
    wire [13:0] dep_chan_data_7_8;
    wire token_7_8;
    wire [1:0] proc_9_data_FIFO_blk;
    wire [1:0] proc_9_data_PIPO_blk;
    wire [1:0] proc_9_start_FIFO_blk;
    wire [1:0] proc_9_TLF_FIFO_blk;
    wire [1:0] proc_9_input_sync_blk;
    wire [1:0] proc_9_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_9;
    reg [1:0] proc_dep_vld_vec_9_reg;
    wire [1:0] in_chan_dep_vld_vec_9;
    wire [27:0] in_chan_dep_data_vec_9;
    wire [1:0] token_in_vec_9;
    wire [1:0] out_chan_dep_vld_vec_9;
    wire [13:0] out_chan_dep_data_9;
    wire [1:0] token_out_vec_9;
    wire dl_detect_out_9;
    wire dep_chan_vld_6_9;
    wire [13:0] dep_chan_data_6_9;
    wire token_6_9;
    wire dep_chan_vld_10_9;
    wire [13:0] dep_chan_data_10_9;
    wire token_10_9;
    wire [2:0] proc_10_data_FIFO_blk;
    wire [2:0] proc_10_data_PIPO_blk;
    wire [2:0] proc_10_start_FIFO_blk;
    wire [2:0] proc_10_TLF_FIFO_blk;
    wire [2:0] proc_10_input_sync_blk;
    wire [2:0] proc_10_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_10;
    reg [2:0] proc_dep_vld_vec_10_reg;
    wire [1:0] in_chan_dep_vld_vec_10;
    wire [27:0] in_chan_dep_data_vec_10;
    wire [1:0] token_in_vec_10;
    wire [2:0] out_chan_dep_vld_vec_10;
    wire [13:0] out_chan_dep_data_10;
    wire [2:0] token_out_vec_10;
    wire dl_detect_out_10;
    wire dep_chan_vld_9_10;
    wire [13:0] dep_chan_data_9_10;
    wire token_9_10;
    wire dep_chan_vld_11_10;
    wire [13:0] dep_chan_data_11_10;
    wire token_11_10;
    wire [4:0] proc_11_data_FIFO_blk;
    wire [4:0] proc_11_data_PIPO_blk;
    wire [4:0] proc_11_start_FIFO_blk;
    wire [4:0] proc_11_TLF_FIFO_blk;
    wire [4:0] proc_11_input_sync_blk;
    wire [4:0] proc_11_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_11;
    reg [4:0] proc_dep_vld_vec_11_reg;
    wire [4:0] in_chan_dep_vld_vec_11;
    wire [69:0] in_chan_dep_data_vec_11;
    wire [4:0] token_in_vec_11;
    wire [4:0] out_chan_dep_vld_vec_11;
    wire [13:0] out_chan_dep_data_11;
    wire [4:0] token_out_vec_11;
    wire dl_detect_out_11;
    wire dep_chan_vld_0_11;
    wire [13:0] dep_chan_data_0_11;
    wire token_0_11;
    wire dep_chan_vld_1_11;
    wire [13:0] dep_chan_data_1_11;
    wire token_1_11;
    wire dep_chan_vld_6_11;
    wire [13:0] dep_chan_data_6_11;
    wire token_6_11;
    wire dep_chan_vld_10_11;
    wire [13:0] dep_chan_data_10_11;
    wire token_10_11;
    wire dep_chan_vld_12_11;
    wire [13:0] dep_chan_data_12_11;
    wire token_12_11;
    wire [2:0] proc_12_data_FIFO_blk;
    wire [2:0] proc_12_data_PIPO_blk;
    wire [2:0] proc_12_start_FIFO_blk;
    wire [2:0] proc_12_TLF_FIFO_blk;
    wire [2:0] proc_12_input_sync_blk;
    wire [2:0] proc_12_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_12;
    reg [2:0] proc_dep_vld_vec_12_reg;
    wire [1:0] in_chan_dep_vld_vec_12;
    wire [27:0] in_chan_dep_data_vec_12;
    wire [1:0] token_in_vec_12;
    wire [2:0] out_chan_dep_vld_vec_12;
    wire [13:0] out_chan_dep_data_12;
    wire [2:0] token_out_vec_12;
    wire dl_detect_out_12;
    wire dep_chan_vld_11_12;
    wire [13:0] dep_chan_data_11_12;
    wire token_11_12;
    wire dep_chan_vld_13_12;
    wire [13:0] dep_chan_data_13_12;
    wire token_13_12;
    wire [2:0] proc_13_data_FIFO_blk;
    wire [2:0] proc_13_data_PIPO_blk;
    wire [2:0] proc_13_start_FIFO_blk;
    wire [2:0] proc_13_TLF_FIFO_blk;
    wire [2:0] proc_13_input_sync_blk;
    wire [2:0] proc_13_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_13;
    reg [2:0] proc_dep_vld_vec_13_reg;
    wire [1:0] in_chan_dep_vld_vec_13;
    wire [27:0] in_chan_dep_data_vec_13;
    wire [1:0] token_in_vec_13;
    wire [2:0] out_chan_dep_vld_vec_13;
    wire [13:0] out_chan_dep_data_13;
    wire [2:0] token_out_vec_13;
    wire dl_detect_out_13;
    wire dep_chan_vld_6_13;
    wire [13:0] dep_chan_data_6_13;
    wire token_6_13;
    wire dep_chan_vld_12_13;
    wire [13:0] dep_chan_data_12_13;
    wire token_12_13;
    wire [13:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [13:0] origin;

    reg ap_done_reg_0;// for module grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_1;// for module grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_2;// for module grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_2 <= 'b0;
        end
        else begin
            ap_done_reg_2 <= grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0.ap_done & ~grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0.ap_continue;
        end
    end

    reg ap_done_reg_3;// for module grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_3 <= 'b0;
        end
        else begin
            ap_done_reg_3 <= grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_4;// for module grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_4 <= 'b0;
        end
        else begin
            ap_done_reg_4 <= grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0.ap_done & ~grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_5;// for module grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_5 <= 'b0;
        end
        else begin
            ap_done_reg_5 <= grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_6;// for module grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_6 <= 'b0;
        end
        else begin
            ap_done_reg_6 <= grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_7;// for module grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_7 <= 'b0;
        end
        else begin
            ap_done_reg_7 <= grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_8;// for module grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_8 <= 'b0;
        end
        else begin
            ap_done_reg_8 <= grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0.ap_done & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0.ap_continue;
        end
    end

    reg ap_done_reg_9;// for module grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_9 <= 'b0;
        end
        else begin
            ap_done_reg_9 <= grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0.ap_done & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0.ap_continue;
        end
    end

reg [15:0] trans_in_cnt_0;// for process grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_0 <= 16'h0;
    end
    else if (grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.start_write == 1'b1) begin
        trans_in_cnt_0 <= trans_in_cnt_0 + 16'h1;
    end
    else begin
        trans_in_cnt_0 <= trans_in_cnt_0;
    end
end

reg [15:0] trans_out_cnt_0;// for process grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_0 <= 16'h0;
    end
    else if (grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_done == 1'b1 && grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_continue == 1'b1) begin
        trans_out_cnt_0 <= trans_out_cnt_0 + 16'h1;
    end
    else begin
        trans_out_cnt_0 <= trans_out_cnt_0;
    end
end

reg [15:0] trans_in_cnt_1;// for process grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_1 <= 16'h0;
    end
    else if (grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.start_write == 1'b1) begin
        trans_in_cnt_1 <= trans_in_cnt_1 + 16'h1;
    end
    else begin
        trans_in_cnt_1 <= trans_in_cnt_1;
    end
end

reg [15:0] trans_out_cnt_1;// for process grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_1 <= 16'h0;
    end
    else if (grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_done == 1'b1 && grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_continue == 1'b1) begin
        trans_out_cnt_1 <= trans_out_cnt_1 + 16'h1;
    end
    else begin
        trans_out_cnt_1 <= trans_out_cnt_1;
    end
end

    // Process: grp_ISPpipeline_fu_211.entry_proc_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 0, 4, 3) ISPPipeline_accel_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0;
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0;
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_entry_proc_U0_ap_ready & grp_ISPpipeline_fu_211.entry_proc_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0_ap_ready);
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    assign proc_0_data_FIFO_blk[1] = 1'b0;
    assign proc_0_data_PIPO_blk[1] = 1'b0;
    assign proc_0_start_FIFO_blk[1] = 1'b0;
    assign proc_0_TLF_FIFO_blk[1] = 1'b0;
    assign proc_0_input_sync_blk[1] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_entry_proc_U0_ap_ready & grp_ISPpipeline_fu_211.entry_proc_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_function_awb_10_10_2160_3840_2_U0_ap_ready);
    assign proc_0_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (proc_0_data_FIFO_blk[1] | proc_0_data_PIPO_blk[1] | proc_0_start_FIFO_blk[1] | proc_0_TLF_FIFO_blk[1] | proc_0_input_sync_blk[1] | proc_0_output_sync_blk[1]);
    assign proc_0_data_FIFO_blk[2] = 1'b0;
    assign proc_0_data_PIPO_blk[2] = 1'b0;
    assign proc_0_start_FIFO_blk[2] = 1'b0;
    assign proc_0_TLF_FIFO_blk[2] = 1'b0;
    assign proc_0_input_sync_blk[2] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_entry_proc_U0_ap_ready & grp_ISPpipeline_fu_211.entry_proc_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_gammacorrection_9_9_2160_3840_2_U0_ap_ready);
    assign proc_0_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_0[2] = dl_detect_out ? proc_dep_vld_vec_0_reg[2] : (proc_0_data_FIFO_blk[2] | proc_0_data_PIPO_blk[2] | proc_0_start_FIFO_blk[2] | proc_0_TLF_FIFO_blk[2] | proc_0_input_sync_blk[2] | proc_0_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[13 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_4_0;
    assign in_chan_dep_data_vec_0[27 : 14] = dep_chan_data_4_0;
    assign token_in_vec_0[1] = token_4_0;
    assign in_chan_dep_vld_vec_0[2] = dep_chan_vld_6_0;
    assign in_chan_dep_data_vec_0[41 : 28] = dep_chan_data_6_0;
    assign token_in_vec_0[2] = token_6_0;
    assign in_chan_dep_vld_vec_0[3] = dep_chan_vld_11_0;
    assign in_chan_dep_data_vec_0[55 : 42] = dep_chan_data_11_0;
    assign token_in_vec_0[3] = token_11_0;
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[0];
    assign dep_chan_vld_0_6 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_6 = out_chan_dep_data_0;
    assign token_0_6 = token_out_vec_0[1];
    assign dep_chan_vld_0_11 = out_chan_dep_vld_vec_0[2];
    assign dep_chan_data_0_11 = out_chan_dep_data_0;
    assign token_0_11 = token_out_vec_0[2];

    // Process: grp_ISPpipeline_fu_211.ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 1, 9, 3) ISPPipeline_accel_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0;
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0;
    assign proc_1_input_sync_blk[0] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0_ap_ready & grp_ISPpipeline_fu_211.ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_entry_proc_U0_ap_ready);
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    assign proc_1_data_FIFO_blk[1] = 1'b0;
    assign proc_1_data_PIPO_blk[1] = 1'b0;
    assign proc_1_start_FIFO_blk[1] = 1'b0;
    assign proc_1_TLF_FIFO_blk[1] = 1'b0;
    assign proc_1_input_sync_blk[1] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0_ap_ready & grp_ISPpipeline_fu_211.ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_function_awb_10_10_2160_3840_2_U0_ap_ready);
    assign proc_1_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (proc_1_data_FIFO_blk[1] | proc_1_data_PIPO_blk[1] | proc_1_start_FIFO_blk[1] | proc_1_TLF_FIFO_blk[1] | proc_1_input_sync_blk[1] | proc_1_output_sync_blk[1]);
    assign proc_1_data_FIFO_blk[2] = 1'b0;
    assign proc_1_data_PIPO_blk[2] = 1'b0;
    assign proc_1_start_FIFO_blk[2] = 1'b0;
    assign proc_1_TLF_FIFO_blk[2] = 1'b0;
    assign proc_1_input_sync_blk[2] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0_ap_ready & grp_ISPpipeline_fu_211.ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_gammacorrection_9_9_2160_3840_2_U0_ap_ready);
    assign proc_1_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_1[2] = dl_detect_out ? proc_dep_vld_vec_1_reg[2] : (proc_1_data_FIFO_blk[2] | proc_1_data_PIPO_blk[2] | proc_1_start_FIFO_blk[2] | proc_1_TLF_FIFO_blk[2] | proc_1_input_sync_blk[2] | proc_1_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[13 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_2_1;
    assign in_chan_dep_data_vec_1[27 : 14] = dep_chan_data_2_1;
    assign token_in_vec_1[1] = token_2_1;
    assign in_chan_dep_vld_vec_1[2] = dep_chan_vld_4_1;
    assign in_chan_dep_data_vec_1[41 : 28] = dep_chan_data_4_1;
    assign token_in_vec_1[2] = token_4_1;
    assign in_chan_dep_vld_vec_1[3] = dep_chan_vld_5_1;
    assign in_chan_dep_data_vec_1[55 : 42] = dep_chan_data_5_1;
    assign token_in_vec_1[3] = token_5_1;
    assign in_chan_dep_vld_vec_1[4] = dep_chan_vld_6_1;
    assign in_chan_dep_data_vec_1[69 : 56] = dep_chan_data_6_1;
    assign token_in_vec_1[4] = token_6_1;
    assign in_chan_dep_vld_vec_1[5] = dep_chan_vld_10_1;
    assign in_chan_dep_data_vec_1[83 : 70] = dep_chan_data_10_1;
    assign token_in_vec_1[5] = token_10_1;
    assign in_chan_dep_vld_vec_1[6] = dep_chan_vld_11_1;
    assign in_chan_dep_data_vec_1[97 : 84] = dep_chan_data_11_1;
    assign token_in_vec_1[6] = token_11_1;
    assign in_chan_dep_vld_vec_1[7] = dep_chan_vld_12_1;
    assign in_chan_dep_data_vec_1[111 : 98] = dep_chan_data_12_1;
    assign token_in_vec_1[7] = token_12_1;
    assign in_chan_dep_vld_vec_1[8] = dep_chan_vld_13_1;
    assign in_chan_dep_data_vec_1[125 : 112] = dep_chan_data_13_1;
    assign token_in_vec_1[8] = token_13_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];
    assign dep_chan_vld_1_6 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_6 = out_chan_dep_data_1;
    assign token_1_6 = token_out_vec_1[1];
    assign dep_chan_vld_1_11 = out_chan_dep_vld_vec_1[2];
    assign dep_chan_data_1_11 = out_chan_dep_data_1;
    assign token_1_11 = token_out_vec_1[2];

    // Process: grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 2, 1, 2) ISPPipeline_accel_hls_deadlock_detect_unit_2 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0;
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.imgInput1_rows_c23_channel_U.if_empty_n & grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.imgInput1_rows_c23_channel_U.if_write) | (~grp_ISPpipeline_fu_211.imgInput1_cols_c24_channel_U.if_empty_n & grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.imgInput1_cols_c24_channel_U.if_write);
    assign proc_2_input_sync_blk[0] = 1'b0;
    assign proc_2_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    assign proc_2_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.grp_AXIVideo2BayerMat_1_2160_3840_2_Pipeline_loop_col_zxi2mat_fu_213.imgInput1_4195_blk_n) | (~grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.imgInput1_rows_c_blk_n) | (~grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.imgInput1_cols_c_blk_n);
    assign proc_2_data_PIPO_blk[1] = 1'b0;
    assign proc_2_start_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.start_for_blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0_U.if_full_n & grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.ap_start & ~grp_ISPpipeline_fu_211.AXIVideo2BayerMat_1_2160_3840_2_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~grp_ISPpipeline_fu_211.start_for_blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0_U.if_read);
    assign proc_2_TLF_FIFO_blk[1] = 1'b0;
    assign proc_2_input_sync_blk[1] = 1'b0;
    assign proc_2_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (proc_2_data_FIFO_blk[1] | proc_2_data_PIPO_blk[1] | proc_2_start_FIFO_blk[1] | proc_2_TLF_FIFO_blk[1] | proc_2_input_sync_blk[1] | proc_2_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_3_2;
    assign in_chan_dep_data_vec_2[13 : 0] = dep_chan_data_3_2;
    assign token_in_vec_2[0] = token_3_2;
    assign dep_chan_vld_2_1 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_1 = out_chan_dep_data_2;
    assign token_2_1 = token_out_vec_2[0];
    assign dep_chan_vld_2_3 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_3 = out_chan_dep_data_2;
    assign token_2_3 = token_out_vec_2[1];

    // Process: grp_ISPpipeline_fu_211.blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 3, 2, 2) ISPPipeline_accel_hls_deadlock_detect_unit_3 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0.p_Src_rows_blk_n) | (~grp_ISPpipeline_fu_211.blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0.p_Src_cols_blk_n) | (~grp_ISPpipeline_fu_211.blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0.grp_blackLevelCorrection_1_2160_3840_2_16_15_1_18_Pipeline_VITIS_LOOP_75_1_fu_50.imgInput1_4195_blk_n);
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.start_for_blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0_U.if_empty_n & grp_ISPpipeline_fu_211.blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0.ap_idle & ~grp_ISPpipeline_fu_211.start_for_blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0_U.if_write);
    assign proc_3_TLF_FIFO_blk[0] = 1'b0;
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    assign proc_3_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.blackLevelCorrection_1_2160_3840_2_16_15_1_18_U0.grp_blackLevelCorrection_1_2160_3840_2_16_15_1_18_Pipeline_VITIS_LOOP_75_1_fu_50.imgInput2_4196_blk_n);
    assign proc_3_data_PIPO_blk[1] = 1'b0;
    assign proc_3_start_FIFO_blk[1] = 1'b0;
    assign proc_3_TLF_FIFO_blk[1] = 1'b0;
    assign proc_3_input_sync_blk[1] = 1'b0;
    assign proc_3_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_3[1] = dl_detect_out ? proc_dep_vld_vec_3_reg[1] : (proc_3_data_FIFO_blk[1] | proc_3_data_PIPO_blk[1] | proc_3_start_FIFO_blk[1] | proc_3_TLF_FIFO_blk[1] | proc_3_input_sync_blk[1] | proc_3_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_2_3;
    assign in_chan_dep_data_vec_3[13 : 0] = dep_chan_data_2_3;
    assign token_in_vec_3[0] = token_2_3;
    assign in_chan_dep_vld_vec_3[1] = dep_chan_vld_4_3;
    assign in_chan_dep_data_vec_3[27 : 14] = dep_chan_data_4_3;
    assign token_in_vec_3[1] = token_4_3;
    assign dep_chan_vld_3_2 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_2 = out_chan_dep_data_3;
    assign token_3_2 = token_out_vec_3[0];
    assign dep_chan_vld_3_4 = out_chan_dep_vld_vec_3[1];
    assign dep_chan_data_3_4 = out_chan_dep_data_3;
    assign token_3_4 = token_out_vec_3[1];

    // Process: grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 4, 2, 4) ISPPipeline_accel_hls_deadlock_detect_unit_4 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0;
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0;
    assign proc_4_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.imgInput2_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.imgInput2_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.imgInput2_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.imgInput2_cols_channel_U.if_write);
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.grp_gaincontrol_3_1_2160_3840_2_Pipeline_ColLoop_fu_74.imgInput2_4196_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0;
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    assign proc_4_data_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.grp_gaincontrol_3_1_2160_3840_2_Pipeline_ColLoop_fu_74.gain_out_4197_blk_n);
    assign proc_4_data_PIPO_blk[2] = 1'b0;
    assign proc_4_start_FIFO_blk[2] = 1'b0;
    assign proc_4_TLF_FIFO_blk[2] = 1'b0;
    assign proc_4_input_sync_blk[2] = 1'b0;
    assign proc_4_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_4[2] = dl_detect_out ? proc_dep_vld_vec_4_reg[2] : (proc_4_data_FIFO_blk[2] | proc_4_data_PIPO_blk[2] | proc_4_start_FIFO_blk[2] | proc_4_TLF_FIFO_blk[2] | proc_4_input_sync_blk[2] | proc_4_output_sync_blk[2]);
    assign proc_4_data_FIFO_blk[3] = 1'b0;
    assign proc_4_data_PIPO_blk[3] = 1'b0;
    assign proc_4_start_FIFO_blk[3] = 1'b0;
    assign proc_4_TLF_FIFO_blk[3] = 1'b0 | (~grp_ISPpipeline_fu_211.rgain_c_channel_U.if_empty_n & grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.rgain_c_channel_U.if_write) | (~grp_ISPpipeline_fu_211.bgain_c_channel_U.if_empty_n & grp_ISPpipeline_fu_211.gaincontrol_3_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.bgain_c_channel_U.if_write);
    assign proc_4_input_sync_blk[3] = 1'b0;
    assign proc_4_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_4[3] = dl_detect_out ? proc_dep_vld_vec_4_reg[3] : (proc_4_data_FIFO_blk[3] | proc_4_data_PIPO_blk[3] | proc_4_start_FIFO_blk[3] | proc_4_TLF_FIFO_blk[3] | proc_4_input_sync_blk[3] | proc_4_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_3_4;
    assign in_chan_dep_data_vec_4[13 : 0] = dep_chan_data_3_4;
    assign token_in_vec_4[0] = token_3_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_5_4;
    assign in_chan_dep_data_vec_4[27 : 14] = dep_chan_data_5_4;
    assign token_in_vec_4[1] = token_5_4;
    assign dep_chan_vld_4_1 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_1 = out_chan_dep_data_4;
    assign token_4_1 = token_out_vec_4[0];
    assign dep_chan_vld_4_3 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_3 = out_chan_dep_data_4;
    assign token_4_3 = token_out_vec_4[1];
    assign dep_chan_vld_4_5 = out_chan_dep_vld_vec_4[2];
    assign dep_chan_data_4_5 = out_chan_dep_data_4;
    assign token_4_5 = token_out_vec_4[2];
    assign dep_chan_vld_4_0 = out_chan_dep_vld_vec_4[3];
    assign dep_chan_data_4_0 = out_chan_dep_data_4;
    assign token_4_0 = token_out_vec_4[3];

    // Process: grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 5, 2, 3) ISPPipeline_accel_hls_deadlock_detect_unit_5 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_5),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_5),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_5),
        .token_in_vec(token_in_vec_5),
        .dl_detect_in(dl_detect_out),
        .origin(origin[5]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_5),
        .out_chan_dep_data(out_chan_dep_data_5),
        .token_out_vec(token_out_vec_5),
        .dl_detect_out(dl_in_vec[5]));

    assign proc_5_data_FIFO_blk[0] = 1'b0;
    assign proc_5_data_PIPO_blk[0] = 1'b0;
    assign proc_5_start_FIFO_blk[0] = 1'b0;
    assign proc_5_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.gain_out_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0.ap_idle & ~grp_ISPpipeline_fu_211.gain_out_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.gain_out_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0.ap_idle & ~grp_ISPpipeline_fu_211.gain_out_cols_channel_U.if_write);
    assign proc_5_input_sync_blk[0] = 1'b0;
    assign proc_5_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_5[0] = dl_detect_out ? proc_dep_vld_vec_5_reg[0] : (proc_5_data_FIFO_blk[0] | proc_5_data_PIPO_blk[0] | proc_5_start_FIFO_blk[0] | proc_5_TLF_FIFO_blk[0] | proc_5_input_sync_blk[0] | proc_5_output_sync_blk[0]);
    assign proc_5_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0.grp_demosaicing_3_1_10_2160_3840_2_false_Pipeline_LineBuffer_VITIS_LOOP_269_1_fu_334.gain_out_4197_blk_n);
    assign proc_5_data_PIPO_blk[1] = 1'b0;
    assign proc_5_start_FIFO_blk[1] = 1'b0;
    assign proc_5_TLF_FIFO_blk[1] = 1'b0;
    assign proc_5_input_sync_blk[1] = 1'b0;
    assign proc_5_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_5[1] = dl_detect_out ? proc_dep_vld_vec_5_reg[1] : (proc_5_data_FIFO_blk[1] | proc_5_data_PIPO_blk[1] | proc_5_start_FIFO_blk[1] | proc_5_TLF_FIFO_blk[1] | proc_5_input_sync_blk[1] | proc_5_output_sync_blk[1]);
    assign proc_5_data_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.demosaicing_3_1_10_2160_3840_2_false_U0.grp_demosaicing_3_1_10_2160_3840_2_false_Pipeline_Col_Loop_fu_366.demosaic_out_4198_blk_n);
    assign proc_5_data_PIPO_blk[2] = 1'b0;
    assign proc_5_start_FIFO_blk[2] = 1'b0;
    assign proc_5_TLF_FIFO_blk[2] = 1'b0;
    assign proc_5_input_sync_blk[2] = 1'b0;
    assign proc_5_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_5[2] = dl_detect_out ? proc_dep_vld_vec_5_reg[2] : (proc_5_data_FIFO_blk[2] | proc_5_data_PIPO_blk[2] | proc_5_start_FIFO_blk[2] | proc_5_TLF_FIFO_blk[2] | proc_5_input_sync_blk[2] | proc_5_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_5_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_5_reg <= proc_dep_vld_vec_5;
        end
    end
    assign in_chan_dep_vld_vec_5[0] = dep_chan_vld_4_5;
    assign in_chan_dep_data_vec_5[13 : 0] = dep_chan_data_4_5;
    assign token_in_vec_5[0] = token_4_5;
    assign in_chan_dep_vld_vec_5[1] = dep_chan_vld_6_5;
    assign in_chan_dep_data_vec_5[27 : 14] = dep_chan_data_6_5;
    assign token_in_vec_5[1] = token_6_5;
    assign dep_chan_vld_5_1 = out_chan_dep_vld_vec_5[0];
    assign dep_chan_data_5_1 = out_chan_dep_data_5;
    assign token_5_1 = token_out_vec_5[0];
    assign dep_chan_vld_5_4 = out_chan_dep_vld_vec_5[1];
    assign dep_chan_data_5_4 = out_chan_dep_data_5;
    assign token_5_4 = token_out_vec_5[1];
    assign dep_chan_vld_5_6 = out_chan_dep_vld_vec_5[2];
    assign dep_chan_data_5_6 = out_chan_dep_data_5;
    assign token_5_6 = token_out_vec_5[2];

    // Process: grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 6, 6, 6) ISPPipeline_accel_hls_deadlock_detect_unit_6 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_6),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_6),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_6),
        .token_in_vec(token_in_vec_6),
        .dl_detect_in(dl_detect_out),
        .origin(origin[6]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_6),
        .out_chan_dep_data(out_chan_dep_data_6),
        .token_out_vec(token_out_vec_6),
        .dl_detect_out(dl_in_vec[6]));

    assign proc_6_data_FIFO_blk[0] = 1'b0;
    assign proc_6_data_PIPO_blk[0] = 1'b0;
    assign proc_6_start_FIFO_blk[0] = 1'b0;
    assign proc_6_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.demosaic_out_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.demosaic_out_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.demosaic_out_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.demosaic_out_cols_channel_U.if_write) | (~grp_ISPpipeline_fu_211.ltm_in_rows_c25_channel_U.if_empty_n & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ltm_in_rows_c25_channel_U.if_write) | (~grp_ISPpipeline_fu_211.ltm_in_cols_c26_channel_U.if_empty_n & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ltm_in_cols_c26_channel_U.if_write) | (~grp_ISPpipeline_fu_211.thresh_loc_channel_U.if_empty_n & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.thresh_loc_channel_U.if_write);
    assign proc_6_input_sync_blk[0] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_function_awb_10_10_2160_3840_2_U0_ap_ready & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0_ap_ready);
    assign proc_6_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_6[0] = dl_detect_out ? proc_dep_vld_vec_6_reg[0] : (proc_6_data_FIFO_blk[0] | proc_6_data_PIPO_blk[0] | proc_6_start_FIFO_blk[0] | proc_6_TLF_FIFO_blk[0] | proc_6_input_sync_blk[0] | proc_6_output_sync_blk[0]);
    assign proc_6_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_copy_10_10_2160_3840_2_s_fu_178.grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56.demosaic_out_4198_blk_n);
    assign proc_6_data_PIPO_blk[1] = 1'b0;
    assign proc_6_start_FIFO_blk[1] = 1'b0;
    assign proc_6_TLF_FIFO_blk[1] = 1'b0;
    assign proc_6_input_sync_blk[1] = 1'b0;
    assign proc_6_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_6[1] = dl_detect_out ? proc_dep_vld_vec_6_reg[1] : (proc_6_data_FIFO_blk[1] | proc_6_data_PIPO_blk[1] | proc_6_start_FIFO_blk[1] | proc_6_TLF_FIFO_blk[1] | proc_6_input_sync_blk[1] | proc_6_output_sync_blk[1]);
    assign proc_6_data_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_copy_10_10_2160_3840_2_s_fu_178.grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56.ltm_in_4199_blk_n) | (~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ltm_in_rows_c_blk_n) | (~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ltm_in_cols_c_blk_n);
    assign proc_6_data_PIPO_blk[2] = 1'b0;
    assign proc_6_start_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.start_for_colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0_U.if_full_n & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_start & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~grp_ISPpipeline_fu_211.start_for_colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0_U.if_read);
    assign proc_6_TLF_FIFO_blk[2] = 1'b0;
    assign proc_6_input_sync_blk[2] = 1'b0;
    assign proc_6_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_6[2] = dl_detect_out ? proc_dep_vld_vec_6_reg[2] : (proc_6_data_FIFO_blk[2] | proc_6_data_PIPO_blk[2] | proc_6_start_FIFO_blk[2] | proc_6_TLF_FIFO_blk[2] | proc_6_input_sync_blk[2] | proc_6_output_sync_blk[2]);
    assign proc_6_data_FIFO_blk[3] = 1'b0;
    assign proc_6_data_PIPO_blk[3] = 1'b0;
    assign proc_6_start_FIFO_blk[3] = 1'b0;
    assign proc_6_TLF_FIFO_blk[3] = 1'b0;
    assign proc_6_input_sync_blk[3] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_function_awb_10_10_2160_3840_2_U0_ap_ready & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_entry_proc_U0_ap_ready);
    assign proc_6_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_6[3] = dl_detect_out ? proc_dep_vld_vec_6_reg[3] : (proc_6_data_FIFO_blk[3] | proc_6_data_PIPO_blk[3] | proc_6_start_FIFO_blk[3] | proc_6_TLF_FIFO_blk[3] | proc_6_input_sync_blk[3] | proc_6_output_sync_blk[3]);
    assign proc_6_data_FIFO_blk[4] = 1'b0;
    assign proc_6_data_PIPO_blk[4] = 1'b0;
    assign proc_6_start_FIFO_blk[4] = 1'b0;
    assign proc_6_TLF_FIFO_blk[4] = 1'b0;
    assign proc_6_input_sync_blk[4] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_function_awb_10_10_2160_3840_2_U0_ap_ready & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_gammacorrection_9_9_2160_3840_2_U0_ap_ready);
    assign proc_6_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_6[4] = dl_detect_out ? proc_dep_vld_vec_6_reg[4] : (proc_6_data_FIFO_blk[4] | proc_6_data_PIPO_blk[4] | proc_6_start_FIFO_blk[4] | proc_6_TLF_FIFO_blk[4] | proc_6_input_sync_blk[4] | proc_6_output_sync_blk[4]);
    assign proc_6_data_FIFO_blk[5] = 1'b0;
    assign proc_6_data_PIPO_blk[5] = 1'b0;
    assign proc_6_start_FIFO_blk[5] = 1'b0;
    assign proc_6_TLF_FIFO_blk[5] = 1'b0;
    assign proc_6_input_sync_blk[5] = 1'b0;
    assign proc_6_output_sync_blk[5] = 1'b0 | (ap_done_reg_3 & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.ap_done);
    assign proc_dep_vld_vec_6[5] = dl_detect_out ? proc_dep_vld_vec_6_reg[5] : (proc_6_data_FIFO_blk[5] | proc_6_data_PIPO_blk[5] | proc_6_start_FIFO_blk[5] | proc_6_TLF_FIFO_blk[5] | proc_6_input_sync_blk[5] | proc_6_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_6_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_6_reg <= proc_dep_vld_vec_6;
        end
    end
    assign in_chan_dep_vld_vec_6[0] = dep_chan_vld_0_6;
    assign in_chan_dep_data_vec_6[13 : 0] = dep_chan_data_0_6;
    assign token_in_vec_6[0] = token_0_6;
    assign in_chan_dep_vld_vec_6[1] = dep_chan_vld_1_6;
    assign in_chan_dep_data_vec_6[27 : 14] = dep_chan_data_1_6;
    assign token_in_vec_6[1] = token_1_6;
    assign in_chan_dep_vld_vec_6[2] = dep_chan_vld_5_6;
    assign in_chan_dep_data_vec_6[41 : 28] = dep_chan_data_5_6;
    assign token_in_vec_6[2] = token_5_6;
    assign in_chan_dep_vld_vec_6[3] = dep_chan_vld_9_6;
    assign in_chan_dep_data_vec_6[55 : 42] = dep_chan_data_9_6;
    assign token_in_vec_6[3] = token_9_6;
    assign in_chan_dep_vld_vec_6[4] = dep_chan_vld_11_6;
    assign in_chan_dep_data_vec_6[69 : 56] = dep_chan_data_11_6;
    assign token_in_vec_6[4] = token_11_6;
    assign in_chan_dep_vld_vec_6[5] = dep_chan_vld_13_6;
    assign in_chan_dep_data_vec_6[83 : 70] = dep_chan_data_13_6;
    assign token_in_vec_6[5] = token_13_6;
    assign dep_chan_vld_6_1 = out_chan_dep_vld_vec_6[0];
    assign dep_chan_data_6_1 = out_chan_dep_data_6;
    assign token_6_1 = token_out_vec_6[0];
    assign dep_chan_vld_6_5 = out_chan_dep_vld_vec_6[1];
    assign dep_chan_data_6_5 = out_chan_dep_data_6;
    assign token_6_5 = token_out_vec_6[1];
    assign dep_chan_vld_6_9 = out_chan_dep_vld_vec_6[2];
    assign dep_chan_data_6_9 = out_chan_dep_data_6;
    assign token_6_9 = token_out_vec_6[2];
    assign dep_chan_vld_6_0 = out_chan_dep_vld_vec_6[3];
    assign dep_chan_data_6_0 = out_chan_dep_data_6;
    assign token_6_0 = token_out_vec_6[3];
    assign dep_chan_vld_6_11 = out_chan_dep_vld_vec_6[4];
    assign dep_chan_data_6_11 = out_chan_dep_data_6;
    assign token_6_11 = token_out_vec_6[4];
    assign dep_chan_vld_6_13 = out_chan_dep_vld_vec_6[5];
    assign dep_chan_data_6_13 = out_chan_dep_data_6;
    assign token_6_13 = token_out_vec_6[5];

    // Process: grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 7, 1, 1) ISPPipeline_accel_hls_deadlock_detect_unit_7 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_7),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_7),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_7),
        .token_in_vec(token_in_vec_7),
        .dl_detect_in(dl_detect_out),
        .origin(origin[7]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_7),
        .out_chan_dep_data(out_chan_dep_data_7),
        .token_out_vec(token_out_vec_7),
        .dl_detect_out(dl_in_vec[7]));

    assign proc_7_data_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0.grp_AWBhistogramkernel_10_10_2160_3840_2_20_1_4096_s_fu_86.grp_AWBhistogramkernel_10_10_2160_3840_2_20_1_4096_Pipeline_COL_LOOP_fu_462.impop_41_blk_n);
    assign proc_7_data_PIPO_blk[0] = 1'b0;
    assign proc_7_start_FIFO_blk[0] = 1'b0;
    assign proc_7_TLF_FIFO_blk[0] = 1'b0;
    assign proc_7_input_sync_blk[0] = 1'b0 | (grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.ap_sync_AWBhistogram_10_10_2160_3840_2_1_4096_U0_ap_ready & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0.ap_idle & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.ap_sync_AWBNormalization_10_10_2160_3840_2_1_4096_U0_ap_ready);
    assign proc_7_output_sync_blk[0] = 1'b0 | (ap_done_reg_8 & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0.ap_done & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0.ap_done);
    assign proc_dep_vld_vec_7[0] = dl_detect_out ? proc_dep_vld_vec_7_reg[0] : (proc_7_data_FIFO_blk[0] | proc_7_data_PIPO_blk[0] | proc_7_start_FIFO_blk[0] | proc_7_TLF_FIFO_blk[0] | proc_7_input_sync_blk[0] | proc_7_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_7_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_7_reg <= proc_dep_vld_vec_7;
        end
    end
    assign in_chan_dep_vld_vec_7[0] = dep_chan_vld_8_7;
    assign in_chan_dep_data_vec_7[13 : 0] = dep_chan_data_8_7;
    assign token_in_vec_7[0] = token_8_7;
    assign dep_chan_vld_7_8 = out_chan_dep_vld_vec_7[0];
    assign dep_chan_data_7_8 = out_chan_dep_data_7;
    assign token_7_8 = token_out_vec_7[0];

    // Process: grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 8, 1, 1) ISPPipeline_accel_hls_deadlock_detect_unit_8 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_8),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_8),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_8),
        .token_in_vec(token_in_vec_8),
        .dl_detect_in(dl_detect_out),
        .origin(origin[8]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_8),
        .out_chan_dep_data(out_chan_dep_data_8),
        .token_out_vec(token_out_vec_8),
        .dl_detect_out(dl_in_vec[8]));

    assign proc_8_data_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0.grp_AWBNormalizationkernel_10_10_2160_3840_2_20_1_4096_2_s_fu_48.grp_AWBNormalizationkernel_10_10_2160_3840_2_20_1_4096_2_Pipeline_Col_Loop1_fu_323.impop_41_blk_n);
    assign proc_8_data_PIPO_blk[0] = 1'b0;
    assign proc_8_start_FIFO_blk[0] = 1'b0;
    assign proc_8_TLF_FIFO_blk[0] = 1'b0;
    assign proc_8_input_sync_blk[0] = 1'b0 | (grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.ap_sync_AWBNormalization_10_10_2160_3840_2_1_4096_U0_ap_ready & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0.ap_idle & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.ap_sync_AWBhistogram_10_10_2160_3840_2_1_4096_U0_ap_ready);
    assign proc_8_output_sync_blk[0] = 1'b0 | (ap_done_reg_9 & grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBNormalization_10_10_2160_3840_2_1_4096_U0.ap_done & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.grp_fifo_awb_10_10_2160_3840_2_s_fu_190.AWBhistogram_10_10_2160_3840_2_1_4096_U0.ap_done);
    assign proc_dep_vld_vec_8[0] = dl_detect_out ? proc_dep_vld_vec_8_reg[0] : (proc_8_data_FIFO_blk[0] | proc_8_data_PIPO_blk[0] | proc_8_start_FIFO_blk[0] | proc_8_TLF_FIFO_blk[0] | proc_8_input_sync_blk[0] | proc_8_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_8_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_8_reg <= proc_dep_vld_vec_8;
        end
    end
    assign in_chan_dep_vld_vec_8[0] = dep_chan_vld_7_8;
    assign in_chan_dep_data_vec_8[13 : 0] = dep_chan_data_7_8;
    assign token_in_vec_8[0] = token_7_8;
    assign dep_chan_vld_8_7 = out_chan_dep_vld_vec_8[0];
    assign dep_chan_data_8_7 = out_chan_dep_data_8;
    assign token_8_7 = token_out_vec_8[0];

    // Process: grp_ISPpipeline_fu_211.colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 9, 2, 2) ISPPipeline_accel_hls_deadlock_detect_unit_9 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_9),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_9),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_9),
        .token_in_vec(token_in_vec_9),
        .dl_detect_in(dl_detect_out),
        .origin(origin[9]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_9),
        .out_chan_dep_data(out_chan_dep_data_9),
        .token_out_vec(token_out_vec_9),
        .dl_detect_out(dl_in_vec[9]));

    assign proc_9_data_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0.p_src_mat_rows_blk_n) | (~grp_ISPpipeline_fu_211.colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0.p_src_mat_cols_blk_n) | (~grp_ISPpipeline_fu_211.colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0.grp_xfccmkernel_10_2160_3840_20_2_23_23_1920_2_s_fu_48.grp_xfccmkernel_10_2160_3840_20_2_23_23_1920_2_Pipeline_colLoop_fu_54.ltm_in_4199_blk_n);
    assign proc_9_data_PIPO_blk[0] = 1'b0;
    assign proc_9_start_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.start_for_colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0_U.if_empty_n & grp_ISPpipeline_fu_211.colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.start_for_colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0_U.if_write);
    assign proc_9_TLF_FIFO_blk[0] = 1'b0;
    assign proc_9_input_sync_blk[0] = 1'b0;
    assign proc_9_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_9[0] = dl_detect_out ? proc_dep_vld_vec_9_reg[0] : (proc_9_data_FIFO_blk[0] | proc_9_data_PIPO_blk[0] | proc_9_start_FIFO_blk[0] | proc_9_TLF_FIFO_blk[0] | proc_9_input_sync_blk[0] | proc_9_output_sync_blk[0]);
    assign proc_9_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.colorcorrectionmatrix_0_10_10_2160_3840_2_2_U0.grp_xfccmkernel_10_2160_3840_20_2_23_23_1920_2_s_fu_48.grp_xfccmkernel_10_2160_3840_20_2_23_23_1920_2_Pipeline_colLoop_fu_54.lsc_out_4200_blk_n);
    assign proc_9_data_PIPO_blk[1] = 1'b0;
    assign proc_9_start_FIFO_blk[1] = 1'b0;
    assign proc_9_TLF_FIFO_blk[1] = 1'b0;
    assign proc_9_input_sync_blk[1] = 1'b0;
    assign proc_9_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_9[1] = dl_detect_out ? proc_dep_vld_vec_9_reg[1] : (proc_9_data_FIFO_blk[1] | proc_9_data_PIPO_blk[1] | proc_9_start_FIFO_blk[1] | proc_9_TLF_FIFO_blk[1] | proc_9_input_sync_blk[1] | proc_9_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_9_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_9_reg <= proc_dep_vld_vec_9;
        end
    end
    assign in_chan_dep_vld_vec_9[0] = dep_chan_vld_6_9;
    assign in_chan_dep_data_vec_9[13 : 0] = dep_chan_data_6_9;
    assign token_in_vec_9[0] = token_6_9;
    assign in_chan_dep_vld_vec_9[1] = dep_chan_vld_10_9;
    assign in_chan_dep_data_vec_9[27 : 14] = dep_chan_data_10_9;
    assign token_in_vec_9[1] = token_10_9;
    assign dep_chan_vld_9_6 = out_chan_dep_vld_vec_9[0];
    assign dep_chan_data_9_6 = out_chan_dep_data_9;
    assign token_9_6 = token_out_vec_9[0];
    assign dep_chan_vld_9_10 = out_chan_dep_vld_vec_9[1];
    assign dep_chan_data_9_10 = out_chan_dep_data_9;
    assign token_9_10 = token_out_vec_9[1];

    // Process: grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 10, 2, 3) ISPPipeline_accel_hls_deadlock_detect_unit_10 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_10),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_10),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_10),
        .token_in_vec(token_in_vec_10),
        .dl_detect_in(dl_detect_out),
        .origin(origin[10]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_10),
        .out_chan_dep_data(out_chan_dep_data_10),
        .token_out_vec(token_out_vec_10),
        .dl_detect_out(dl_in_vec[10]));

    assign proc_10_data_FIFO_blk[0] = 1'b0;
    assign proc_10_data_PIPO_blk[0] = 1'b0;
    assign proc_10_start_FIFO_blk[0] = 1'b0;
    assign proc_10_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.lsc_out_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.lsc_out_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.lsc_out_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.lsc_out_cols_channel_U.if_write);
    assign proc_10_input_sync_blk[0] = 1'b0;
    assign proc_10_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_10[0] = dl_detect_out ? proc_dep_vld_vec_10_reg[0] : (proc_10_data_FIFO_blk[0] | proc_10_data_PIPO_blk[0] | proc_10_start_FIFO_blk[0] | proc_10_TLF_FIFO_blk[0] | proc_10_input_sync_blk[0] | proc_10_output_sync_blk[0]);
    assign proc_10_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0.grp_xf_QuatizationDithering_10_9_2160_3840_256_65536_2_Pipeline_LOOP_ROW_LOOP_COL_fu_89.lsc_out_4200_blk_n);
    assign proc_10_data_PIPO_blk[1] = 1'b0;
    assign proc_10_start_FIFO_blk[1] = 1'b0;
    assign proc_10_TLF_FIFO_blk[1] = 1'b0;
    assign proc_10_input_sync_blk[1] = 1'b0;
    assign proc_10_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_10[1] = dl_detect_out ? proc_dep_vld_vec_10_reg[1] : (proc_10_data_FIFO_blk[1] | proc_10_data_PIPO_blk[1] | proc_10_start_FIFO_blk[1] | proc_10_TLF_FIFO_blk[1] | proc_10_input_sync_blk[1] | proc_10_output_sync_blk[1]);
    assign proc_10_data_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.xf_QuatizationDithering_10_9_2160_3840_256_65536_2_U0.grp_xf_QuatizationDithering_10_9_2160_3840_256_65536_2_Pipeline_LOOP_ROW_LOOP_COL_fu_89.aecin_4202_blk_n);
    assign proc_10_data_PIPO_blk[2] = 1'b0;
    assign proc_10_start_FIFO_blk[2] = 1'b0;
    assign proc_10_TLF_FIFO_blk[2] = 1'b0;
    assign proc_10_input_sync_blk[2] = 1'b0;
    assign proc_10_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_10[2] = dl_detect_out ? proc_dep_vld_vec_10_reg[2] : (proc_10_data_FIFO_blk[2] | proc_10_data_PIPO_blk[2] | proc_10_start_FIFO_blk[2] | proc_10_TLF_FIFO_blk[2] | proc_10_input_sync_blk[2] | proc_10_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_10_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_10_reg <= proc_dep_vld_vec_10;
        end
    end
    assign in_chan_dep_vld_vec_10[0] = dep_chan_vld_9_10;
    assign in_chan_dep_data_vec_10[13 : 0] = dep_chan_data_9_10;
    assign token_in_vec_10[0] = token_9_10;
    assign in_chan_dep_vld_vec_10[1] = dep_chan_vld_11_10;
    assign in_chan_dep_data_vec_10[27 : 14] = dep_chan_data_11_10;
    assign token_in_vec_10[1] = token_11_10;
    assign dep_chan_vld_10_1 = out_chan_dep_vld_vec_10[0];
    assign dep_chan_data_10_1 = out_chan_dep_data_10;
    assign token_10_1 = token_out_vec_10[0];
    assign dep_chan_vld_10_9 = out_chan_dep_vld_vec_10[1];
    assign dep_chan_data_10_9 = out_chan_dep_data_10;
    assign token_10_9 = token_out_vec_10[1];
    assign dep_chan_vld_10_11 = out_chan_dep_vld_vec_10[2];
    assign dep_chan_data_10_11 = out_chan_dep_data_10;
    assign token_10_11 = token_out_vec_10[2];

    // Process: grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 11, 5, 5) ISPPipeline_accel_hls_deadlock_detect_unit_11 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_11),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_11),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_11),
        .token_in_vec(token_in_vec_11),
        .dl_detect_in(dl_detect_out),
        .origin(origin[11]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_11),
        .out_chan_dep_data(out_chan_dep_data_11),
        .token_out_vec(token_out_vec_11),
        .dl_detect_out(dl_in_vec[11]));

    assign proc_11_data_FIFO_blk[0] = 1'b0;
    assign proc_11_data_PIPO_blk[0] = 1'b0;
    assign proc_11_start_FIFO_blk[0] = 1'b0;
    assign proc_11_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.aecin_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.aecin_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.aecin_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.aecin_cols_channel_U.if_write);
    assign proc_11_input_sync_blk[0] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_gammacorrection_9_9_2160_3840_2_U0_ap_ready & grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_ISPpipeline_Block_ZN2xf2cv3MatILi1ELi2160ELi3840ELi2ELi2EEC2Eii_exit1_proc_U0_ap_ready);
    assign proc_11_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_11[0] = dl_detect_out ? proc_dep_vld_vec_11_reg[0] : (proc_11_data_FIFO_blk[0] | proc_11_data_PIPO_blk[0] | proc_11_start_FIFO_blk[0] | proc_11_TLF_FIFO_blk[0] | proc_11_input_sync_blk[0] | proc_11_output_sync_blk[0]);
    assign proc_11_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.grp_gammacorrection_9_9_2160_3840_2_Pipeline_colLoop_fu_112.aecin_4202_blk_n);
    assign proc_11_data_PIPO_blk[1] = 1'b0;
    assign proc_11_start_FIFO_blk[1] = 1'b0;
    assign proc_11_TLF_FIFO_blk[1] = 1'b0;
    assign proc_11_input_sync_blk[1] = 1'b0;
    assign proc_11_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_11[1] = dl_detect_out ? proc_dep_vld_vec_11_reg[1] : (proc_11_data_FIFO_blk[1] | proc_11_data_PIPO_blk[1] | proc_11_start_FIFO_blk[1] | proc_11_TLF_FIFO_blk[1] | proc_11_input_sync_blk[1] | proc_11_output_sync_blk[1]);
    assign proc_11_data_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.grp_gammacorrection_9_9_2160_3840_2_Pipeline_colLoop_fu_112.p_dst_4201_blk_n);
    assign proc_11_data_PIPO_blk[2] = 1'b0;
    assign proc_11_start_FIFO_blk[2] = 1'b0;
    assign proc_11_TLF_FIFO_blk[2] = 1'b0;
    assign proc_11_input_sync_blk[2] = 1'b0;
    assign proc_11_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_11[2] = dl_detect_out ? proc_dep_vld_vec_11_reg[2] : (proc_11_data_FIFO_blk[2] | proc_11_data_PIPO_blk[2] | proc_11_start_FIFO_blk[2] | proc_11_TLF_FIFO_blk[2] | proc_11_input_sync_blk[2] | proc_11_output_sync_blk[2]);
    assign proc_11_data_FIFO_blk[3] = 1'b0;
    assign proc_11_data_PIPO_blk[3] = 1'b0;
    assign proc_11_start_FIFO_blk[3] = 1'b0;
    assign proc_11_TLF_FIFO_blk[3] = 1'b0;
    assign proc_11_input_sync_blk[3] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_gammacorrection_9_9_2160_3840_2_U0_ap_ready & grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_entry_proc_U0_ap_ready);
    assign proc_11_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_11[3] = dl_detect_out ? proc_dep_vld_vec_11_reg[3] : (proc_11_data_FIFO_blk[3] | proc_11_data_PIPO_blk[3] | proc_11_start_FIFO_blk[3] | proc_11_TLF_FIFO_blk[3] | proc_11_input_sync_blk[3] | proc_11_output_sync_blk[3]);
    assign proc_11_data_FIFO_blk[4] = 1'b0;
    assign proc_11_data_PIPO_blk[4] = 1'b0;
    assign proc_11_start_FIFO_blk[4] = 1'b0;
    assign proc_11_TLF_FIFO_blk[4] = 1'b0;
    assign proc_11_input_sync_blk[4] = 1'b0 | (grp_ISPpipeline_fu_211.ap_sync_gammacorrection_9_9_2160_3840_2_U0_ap_ready & grp_ISPpipeline_fu_211.gammacorrection_9_9_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.ap_sync_function_awb_10_10_2160_3840_2_U0_ap_ready);
    assign proc_11_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_11[4] = dl_detect_out ? proc_dep_vld_vec_11_reg[4] : (proc_11_data_FIFO_blk[4] | proc_11_data_PIPO_blk[4] | proc_11_start_FIFO_blk[4] | proc_11_TLF_FIFO_blk[4] | proc_11_input_sync_blk[4] | proc_11_output_sync_blk[4]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_11_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_11_reg <= proc_dep_vld_vec_11;
        end
    end
    assign in_chan_dep_vld_vec_11[0] = dep_chan_vld_0_11;
    assign in_chan_dep_data_vec_11[13 : 0] = dep_chan_data_0_11;
    assign token_in_vec_11[0] = token_0_11;
    assign in_chan_dep_vld_vec_11[1] = dep_chan_vld_1_11;
    assign in_chan_dep_data_vec_11[27 : 14] = dep_chan_data_1_11;
    assign token_in_vec_11[1] = token_1_11;
    assign in_chan_dep_vld_vec_11[2] = dep_chan_vld_6_11;
    assign in_chan_dep_data_vec_11[41 : 28] = dep_chan_data_6_11;
    assign token_in_vec_11[2] = token_6_11;
    assign in_chan_dep_vld_vec_11[3] = dep_chan_vld_10_11;
    assign in_chan_dep_data_vec_11[55 : 42] = dep_chan_data_10_11;
    assign token_in_vec_11[3] = token_10_11;
    assign in_chan_dep_vld_vec_11[4] = dep_chan_vld_12_11;
    assign in_chan_dep_data_vec_11[69 : 56] = dep_chan_data_12_11;
    assign token_in_vec_11[4] = token_12_11;
    assign dep_chan_vld_11_1 = out_chan_dep_vld_vec_11[0];
    assign dep_chan_data_11_1 = out_chan_dep_data_11;
    assign token_11_1 = token_out_vec_11[0];
    assign dep_chan_vld_11_10 = out_chan_dep_vld_vec_11[1];
    assign dep_chan_data_11_10 = out_chan_dep_data_11;
    assign token_11_10 = token_out_vec_11[1];
    assign dep_chan_vld_11_12 = out_chan_dep_vld_vec_11[2];
    assign dep_chan_data_11_12 = out_chan_dep_data_11;
    assign token_11_12 = token_out_vec_11[2];
    assign dep_chan_vld_11_0 = out_chan_dep_vld_vec_11[3];
    assign dep_chan_data_11_0 = out_chan_dep_data_11;
    assign token_11_0 = token_out_vec_11[3];
    assign dep_chan_vld_11_6 = out_chan_dep_vld_vec_11[4];
    assign dep_chan_data_11_6 = out_chan_dep_data_11;
    assign token_11_6 = token_out_vec_11[4];

    // Process: grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 12, 2, 3) ISPPipeline_accel_hls_deadlock_detect_unit_12 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_12),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_12),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_12),
        .token_in_vec(token_in_vec_12),
        .dl_detect_in(dl_detect_out),
        .origin(origin[12]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_12),
        .out_chan_dep_data(out_chan_dep_data_12),
        .token_out_vec(token_out_vec_12),
        .dl_detect_out(dl_in_vec[12]));

    assign proc_12_data_FIFO_blk[0] = 1'b0;
    assign proc_12_data_PIPO_blk[0] = 1'b0;
    assign proc_12_start_FIFO_blk[0] = 1'b0;
    assign proc_12_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.p_dst_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.p_dst_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.p_dst_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.p_dst_cols_channel_U.if_write);
    assign proc_12_input_sync_blk[0] = 1'b0;
    assign proc_12_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_12[0] = dl_detect_out ? proc_dep_vld_vec_12_reg[0] : (proc_12_data_FIFO_blk[0] | proc_12_data_PIPO_blk[0] | proc_12_start_FIFO_blk[0] | proc_12_TLF_FIFO_blk[0] | proc_12_input_sync_blk[0] | proc_12_output_sync_blk[0]);
    assign proc_12_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0.grp_xfrgb2yuyv_9_1_2160_3840_2_17_12_2073600_2_s_fu_32.grp_xfrgb2yuyv_9_1_2160_3840_2_17_12_2073600_2_Pipeline_columnloop_fu_56.p_dst_4201_blk_n);
    assign proc_12_data_PIPO_blk[1] = 1'b0;
    assign proc_12_start_FIFO_blk[1] = 1'b0;
    assign proc_12_TLF_FIFO_blk[1] = 1'b0;
    assign proc_12_input_sync_blk[1] = 1'b0;
    assign proc_12_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_12[1] = dl_detect_out ? proc_dep_vld_vec_12_reg[1] : (proc_12_data_FIFO_blk[1] | proc_12_data_PIPO_blk[1] | proc_12_start_FIFO_blk[1] | proc_12_TLF_FIFO_blk[1] | proc_12_input_sync_blk[1] | proc_12_output_sync_blk[1]);
    assign proc_12_data_FIFO_blk[2] = 1'b0 | (~grp_ISPpipeline_fu_211.rgb2yuyv_9_1_2160_3840_2_U0.grp_xfrgb2yuyv_9_1_2160_3840_2_17_12_2073600_2_s_fu_32.grp_xfrgb2yuyv_9_1_2160_3840_2_17_12_2073600_2_Pipeline_columnloop_fu_56.p_imgOutput_4203_blk_n);
    assign proc_12_data_PIPO_blk[2] = 1'b0;
    assign proc_12_start_FIFO_blk[2] = 1'b0;
    assign proc_12_TLF_FIFO_blk[2] = 1'b0;
    assign proc_12_input_sync_blk[2] = 1'b0;
    assign proc_12_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_12[2] = dl_detect_out ? proc_dep_vld_vec_12_reg[2] : (proc_12_data_FIFO_blk[2] | proc_12_data_PIPO_blk[2] | proc_12_start_FIFO_blk[2] | proc_12_TLF_FIFO_blk[2] | proc_12_input_sync_blk[2] | proc_12_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_12_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_12_reg <= proc_dep_vld_vec_12;
        end
    end
    assign in_chan_dep_vld_vec_12[0] = dep_chan_vld_11_12;
    assign in_chan_dep_data_vec_12[13 : 0] = dep_chan_data_11_12;
    assign token_in_vec_12[0] = token_11_12;
    assign in_chan_dep_vld_vec_12[1] = dep_chan_vld_13_12;
    assign in_chan_dep_data_vec_12[27 : 14] = dep_chan_data_13_12;
    assign token_in_vec_12[1] = token_13_12;
    assign dep_chan_vld_12_1 = out_chan_dep_vld_vec_12[0];
    assign dep_chan_data_12_1 = out_chan_dep_data_12;
    assign token_12_1 = token_out_vec_12[0];
    assign dep_chan_vld_12_11 = out_chan_dep_vld_vec_12[1];
    assign dep_chan_data_12_11 = out_chan_dep_data_12;
    assign token_12_11 = token_out_vec_12[1];
    assign dep_chan_vld_12_13 = out_chan_dep_vld_vec_12[2];
    assign dep_chan_data_12_13 = out_chan_dep_data_12;
    assign token_12_13 = token_out_vec_12[2];

    // Process: grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0
    ISPPipeline_accel_hls_deadlock_detect_unit #(14, 13, 2, 3) ISPPipeline_accel_hls_deadlock_detect_unit_13 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_13),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_13),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_13),
        .token_in_vec(token_in_vec_13),
        .dl_detect_in(dl_detect_out),
        .origin(origin[13]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_13),
        .out_chan_dep_data(out_chan_dep_data_13),
        .token_out_vec(token_out_vec_13),
        .dl_detect_out(dl_in_vec[13]));

    assign proc_13_data_FIFO_blk[0] = 1'b0;
    assign proc_13_data_PIPO_blk[0] = 1'b0;
    assign proc_13_start_FIFO_blk[0] = 1'b0;
    assign proc_13_TLF_FIFO_blk[0] = 1'b0 | (~grp_ISPpipeline_fu_211.p_imgOutput_rows_channel_U.if_empty_n & grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.p_imgOutput_rows_channel_U.if_write) | (~grp_ISPpipeline_fu_211.p_imgOutput_cols_channel_U.if_empty_n & grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.ap_idle & ~grp_ISPpipeline_fu_211.p_imgOutput_cols_channel_U.if_write);
    assign proc_13_input_sync_blk[0] = 1'b0;
    assign proc_13_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_13[0] = dl_detect_out ? proc_dep_vld_vec_13_reg[0] : (proc_13_data_FIFO_blk[0] | proc_13_data_PIPO_blk[0] | proc_13_start_FIFO_blk[0] | proc_13_TLF_FIFO_blk[0] | proc_13_input_sync_blk[0] | proc_13_output_sync_blk[0]);
    assign proc_13_data_FIFO_blk[1] = 1'b0 | (~grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.grp_ColorMat2AXIvideo_yuv_1_2160_3840_2_Pipeline_loop_col_mat2axi_fu_86.p_imgOutput_4203_blk_n);
    assign proc_13_data_PIPO_blk[1] = 1'b0;
    assign proc_13_start_FIFO_blk[1] = 1'b0;
    assign proc_13_TLF_FIFO_blk[1] = 1'b0;
    assign proc_13_input_sync_blk[1] = 1'b0;
    assign proc_13_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_13[1] = dl_detect_out ? proc_dep_vld_vec_13_reg[1] : (proc_13_data_FIFO_blk[1] | proc_13_data_PIPO_blk[1] | proc_13_start_FIFO_blk[1] | proc_13_TLF_FIFO_blk[1] | proc_13_input_sync_blk[1] | proc_13_output_sync_blk[1]);
    assign proc_13_data_FIFO_blk[2] = 1'b0;
    assign proc_13_data_PIPO_blk[2] = 1'b0;
    assign proc_13_start_FIFO_blk[2] = 1'b0;
    assign proc_13_TLF_FIFO_blk[2] = 1'b0;
    assign proc_13_input_sync_blk[2] = 1'b0;
    assign proc_13_output_sync_blk[2] = 1'b0 | (ap_done_reg_7 & grp_ISPpipeline_fu_211.ColorMat2AXIvideo_yuv_1_2160_3840_2_U0.ap_done & ~grp_ISPpipeline_fu_211.function_awb_10_10_2160_3840_2_U0.ap_done);
    assign proc_dep_vld_vec_13[2] = dl_detect_out ? proc_dep_vld_vec_13_reg[2] : (proc_13_data_FIFO_blk[2] | proc_13_data_PIPO_blk[2] | proc_13_start_FIFO_blk[2] | proc_13_TLF_FIFO_blk[2] | proc_13_input_sync_blk[2] | proc_13_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_13_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_13_reg <= proc_dep_vld_vec_13;
        end
    end
    assign in_chan_dep_vld_vec_13[0] = dep_chan_vld_6_13;
    assign in_chan_dep_data_vec_13[13 : 0] = dep_chan_data_6_13;
    assign token_in_vec_13[0] = token_6_13;
    assign in_chan_dep_vld_vec_13[1] = dep_chan_vld_12_13;
    assign in_chan_dep_data_vec_13[27 : 14] = dep_chan_data_12_13;
    assign token_in_vec_13[1] = token_12_13;
    assign dep_chan_vld_13_1 = out_chan_dep_vld_vec_13[0];
    assign dep_chan_data_13_1 = out_chan_dep_data_13;
    assign token_13_1 = token_out_vec_13[0];
    assign dep_chan_vld_13_12 = out_chan_dep_vld_vec_13[1];
    assign dep_chan_data_13_12 = out_chan_dep_data_13;
    assign token_13_12 = token_out_vec_13[1];
    assign dep_chan_vld_13_6 = out_chan_dep_vld_vec_13[2];
    assign dep_chan_data_13_6 = out_chan_dep_data_13;
    assign token_13_6 = token_out_vec_13[2];


`include "ISPPipeline_accel_hls_deadlock_report_unit.vh"
