-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_rgb_bgr_kernel_ap_uint_16_6_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read2 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read3 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read4 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read5 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read6 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read7 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read8 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read9 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read10 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read11 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read12 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read13 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read14 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read15 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read16 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read17 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read18 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read19 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read20 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read21 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read22 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read23 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read24 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read25 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read26 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read27 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read28 : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read29 : IN STD_LOGIC_VECTOR (15 downto 0);
    loop_offset : IN STD_LOGIC_VECTOR (0 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (18 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of ISPPipeline_accel_rgb_bgr_kernel_ap_uint_16_6_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv21_0 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    constant ap_const_lv20_0 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";

attribute shreg_extract : string;
    signal lshr_ln_reg_793 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal lshr_ln_reg_793_pp0_iter1_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal ret_11_fu_436_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_11_reg_798 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln1525_fu_494_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln1525_reg_803 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln1525_6_fu_544_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln1525_6_reg_808 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln116_1_fu_656_p2 : STD_LOGIC_VECTOR (19 downto 0);
    signal add_ln116_1_reg_813 : STD_LOGIC_VECTOR (19 downto 0);
    signal add_ln116_1_reg_813_pp0_iter1_reg : STD_LOGIC_VECTOR (19 downto 0);
    signal ret_9_fu_681_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal ret_9_reg_818 : STD_LOGIC_VECTOR (18 downto 0);
    signal add_ln116_fu_706_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln116_reg_823 : STD_LOGIC_VECTOR (20 downto 0);
    signal tmp_61_reg_828 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln116_2_reg_833 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal lhs_fu_304_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal lhs_fu_304_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_fu_334_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_fu_334_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln225_11_fu_352_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln225_fu_322_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_fu_356_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal or_ln225_2_fu_372_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal zext_ln225_13_fu_380_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal lhs_10_fu_384_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln225_fu_406_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_7_fu_414_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln225_15_fu_432_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln225_14_fu_402_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal select_ln225_2_fu_442_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_8_fu_450_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_9_fu_472_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln1525_fu_468_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1525_18_fu_490_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal rhs_10_fu_500_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_11_fu_522_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln1525_20_fu_518_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1525_21_fu_540_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal lhs_13_fu_550_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_12_fu_572_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln225_19_fu_590_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln225_18_fu_568_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_10_fu_594_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal shl_ln_fu_600_p3 : STD_LOGIC_VECTOR (18 downto 0);
    signal tmp_fu_612_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal shl_ln2_fu_634_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln115_fu_642_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln114_fu_630_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal add_ln115_fu_646_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln225_20_fu_608_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal zext_ln116_fu_652_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal zext_ln1525_19_fu_665_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln225_16_fu_662_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal ret_12_fu_668_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln1525_22_fu_678_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln1525_15_fu_674_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln225_12_fu_687_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal zext_ln225_17_fu_690_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal sub_ln115_fu_693_p2 : STD_LOGIC_VECTOR (19 downto 0);
    signal zext_ln116_1_fu_703_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal sext_ln115_fu_699_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal sub_ln116_fu_730_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln116_1_fu_735_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln116_fu_745_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln116_2_fu_749_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal sext_ln116_1_fu_759_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal sub_ln116_1_fu_753_p2 : STD_LOGIC_VECTOR (19 downto 0);
    signal zext_ln116_3_fu_762_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal res_fu_766_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal tmp_62_fu_777_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln115_fu_773_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal select_ln117_fu_785_p3 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_ce_reg : STD_LOGIC;
    signal p_read_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read1_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read2_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read3_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read4_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read5_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read6_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read7_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read8_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read9_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read10_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read11_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read12_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read13_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read14_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read15_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read16_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read17_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read18_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read19_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read20_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read21_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read22_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read23_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read24_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read25_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read26_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read27_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read28_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal p_read29_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal loop_offset_int_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_return_int_reg : STD_LOGIC_VECTOR (18 downto 0);

    component ISPPipeline_accel_mux_63_16_1_0 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        din3_WIDTH : INTEGER;
        din4_WIDTH : INTEGER;
        din5_WIDTH : INTEGER;
        din6_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        din3 : IN STD_LOGIC_VECTOR (15 downto 0);
        din4 : IN STD_LOGIC_VECTOR (15 downto 0);
        din5 : IN STD_LOGIC_VECTOR (15 downto 0);
        din6 : IN STD_LOGIC_VECTOR (2 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    mux_63_16_1_0_U236 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read12_int_reg,
        din1 => p_read13_int_reg,
        din2 => p_read14_int_reg,
        din3 => p_read15_int_reg,
        din4 => p_read16_int_reg,
        din5 => p_read17_int_reg,
        din6 => lhs_fu_304_p7,
        dout => lhs_fu_304_p8);

    mux_63_16_1_0_U237 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read12_int_reg,
        din1 => p_read13_int_reg,
        din2 => p_read14_int_reg,
        din3 => p_read15_int_reg,
        din4 => p_read16_int_reg,
        din5 => p_read17_int_reg,
        din6 => rhs_fu_334_p7,
        dout => rhs_fu_334_p8);

    mux_63_16_1_0_U238 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read_int_reg,
        din1 => p_read1_int_reg,
        din2 => p_read2_int_reg,
        din3 => p_read3_int_reg,
        din4 => p_read4_int_reg,
        din5 => p_read5_int_reg,
        din6 => zext_ln225_13_fu_380_p1,
        dout => lhs_10_fu_384_p8);

    mux_63_16_1_0_U239 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read6_int_reg,
        din1 => p_read7_int_reg,
        din2 => p_read8_int_reg,
        din3 => p_read9_int_reg,
        din4 => p_read10_int_reg,
        din5 => p_read11_int_reg,
        din6 => select_ln225_fu_406_p3,
        dout => rhs_7_fu_414_p8);

    mux_63_16_1_0_U240 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read6_int_reg,
        din1 => p_read7_int_reg,
        din2 => p_read8_int_reg,
        din3 => p_read9_int_reg,
        din4 => p_read10_int_reg,
        din5 => p_read11_int_reg,
        din6 => select_ln225_2_fu_442_p3,
        dout => rhs_8_fu_450_p8);

    mux_63_16_1_0_U241 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read18_int_reg,
        din1 => p_read19_int_reg,
        din2 => p_read20_int_reg,
        din3 => p_read21_int_reg,
        din4 => p_read22_int_reg,
        din5 => p_read23_int_reg,
        din6 => select_ln225_fu_406_p3,
        dout => rhs_9_fu_472_p8);

    mux_63_16_1_0_U242 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read18_int_reg,
        din1 => p_read19_int_reg,
        din2 => p_read20_int_reg,
        din3 => p_read21_int_reg,
        din4 => p_read22_int_reg,
        din5 => p_read23_int_reg,
        din6 => select_ln225_2_fu_442_p3,
        dout => rhs_10_fu_500_p8);

    mux_63_16_1_0_U243 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read24_int_reg,
        din1 => p_read25_int_reg,
        din2 => p_read26_int_reg,
        din3 => p_read27_int_reg,
        din4 => p_read28_int_reg,
        din5 => p_read29_int_reg,
        din6 => zext_ln225_13_fu_380_p1,
        dout => rhs_11_fu_522_p8);

    mux_63_16_1_0_U244 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read6_int_reg,
        din1 => p_read7_int_reg,
        din2 => p_read8_int_reg,
        din3 => p_read9_int_reg,
        din4 => p_read10_int_reg,
        din5 => p_read11_int_reg,
        din6 => zext_ln225_13_fu_380_p1,
        dout => lhs_13_fu_550_p8);

    mux_63_16_1_0_U245 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read18_int_reg,
        din1 => p_read19_int_reg,
        din2 => p_read20_int_reg,
        din3 => p_read21_int_reg,
        din4 => p_read22_int_reg,
        din5 => p_read23_int_reg,
        din6 => zext_ln225_13_fu_380_p1,
        dout => rhs_12_fu_572_p8);

    mux_63_16_1_0_U246 : component ISPPipeline_accel_mux_63_16_1_0
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        din2_WIDTH => 16,
        din3_WIDTH => 16,
        din4_WIDTH => 16,
        din5_WIDTH => 16,
        din6_WIDTH => 3,
        dout_WIDTH => 16)
    port map (
        din0 => p_read12_int_reg,
        din1 => p_read13_int_reg,
        din2 => p_read14_int_reg,
        din3 => p_read15_int_reg,
        din4 => p_read16_int_reg,
        din5 => p_read17_int_reg,
        din6 => zext_ln225_13_fu_380_p1,
        dout => tmp_fu_612_p8);





    ap_ce_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            ap_ce_reg <= ap_ce;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then
                add_ln116_1_reg_813 <= add_ln116_1_fu_656_p2;
                add_ln116_1_reg_813_pp0_iter1_reg <= add_ln116_1_reg_813;
                add_ln116_reg_823 <= add_ln116_fu_706_p2;
                add_ln1525_6_reg_808 <= add_ln1525_6_fu_544_p2;
                add_ln1525_reg_803 <= add_ln1525_fu_494_p2;
                lshr_ln_reg_793 <= ret_fu_356_p2(16 downto 1);
                lshr_ln_reg_793_pp0_iter1_reg <= lshr_ln_reg_793;
                ret_11_reg_798 <= ret_11_fu_436_p2;
                ret_9_reg_818 <= ret_9_fu_681_p2;
                tmp_61_reg_828 <= add_ln116_fu_706_p2(20 downto 20);
                trunc_ln116_2_reg_833 <= add_ln116_fu_706_p2(20 downto 3);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce_reg)) then
                ap_return_int_reg <= select_ln117_fu_785_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce)) then
                loop_offset_int_reg <= loop_offset;
                p_read10_int_reg <= p_read10;
                p_read11_int_reg <= p_read11;
                p_read12_int_reg <= p_read12;
                p_read13_int_reg <= p_read13;
                p_read14_int_reg <= p_read14;
                p_read15_int_reg <= p_read15;
                p_read16_int_reg <= p_read16;
                p_read17_int_reg <= p_read17;
                p_read18_int_reg <= p_read18;
                p_read19_int_reg <= p_read19;
                p_read1_int_reg <= p_read1;
                p_read20_int_reg <= p_read20;
                p_read21_int_reg <= p_read21;
                p_read22_int_reg <= p_read22;
                p_read23_int_reg <= p_read23;
                p_read24_int_reg <= p_read24;
                p_read25_int_reg <= p_read25;
                p_read26_int_reg <= p_read26;
                p_read27_int_reg <= p_read27;
                p_read28_int_reg <= p_read28;
                p_read29_int_reg <= p_read29;
                p_read2_int_reg <= p_read2;
                p_read3_int_reg <= p_read3;
                p_read4_int_reg <= p_read4;
                p_read5_int_reg <= p_read5;
                p_read6_int_reg <= p_read6;
                p_read7_int_reg <= p_read7;
                p_read8_int_reg <= p_read8;
                p_read9_int_reg <= p_read9;
                p_read_int_reg <= p_read;
            end if;
        end if;
    end process;
    add_ln115_fu_646_p2 <= std_logic_vector(unsigned(zext_ln115_fu_642_p1) + unsigned(zext_ln114_fu_630_p1));
    add_ln116_1_fu_656_p2 <= std_logic_vector(unsigned(zext_ln225_20_fu_608_p1) + unsigned(zext_ln116_fu_652_p1));
    add_ln116_fu_706_p2 <= std_logic_vector(unsigned(zext_ln116_1_fu_703_p1) + unsigned(sext_ln115_fu_699_p1));
    add_ln1525_6_fu_544_p2 <= std_logic_vector(unsigned(zext_ln1525_20_fu_518_p1) + unsigned(zext_ln1525_21_fu_540_p1));
    add_ln1525_fu_494_p2 <= std_logic_vector(unsigned(zext_ln1525_fu_468_p1) + unsigned(zext_ln1525_18_fu_490_p1));
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_return_assign_proc : process(select_ln117_fu_785_p3, ap_ce_reg, ap_return_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return <= ap_return_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return <= select_ln117_fu_785_p3;
        else 
            ap_return <= "XXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    lhs_fu_304_p7 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(loop_offset_int_reg),3));
    or_ln225_2_fu_372_p3 <= (ap_const_lv1_1 & loop_offset_int_reg);
    res_fu_766_p3 <= 
        sub_ln116_1_fu_753_p2 when (tmp_61_reg_828(0) = '1') else 
        zext_ln116_3_fu_762_p1;
    ret_10_fu_594_p2 <= std_logic_vector(unsigned(zext_ln225_19_fu_590_p1) + unsigned(zext_ln225_18_fu_568_p1));
    ret_11_fu_436_p2 <= std_logic_vector(unsigned(zext_ln225_15_fu_432_p1) + unsigned(zext_ln225_14_fu_402_p1));
    ret_12_fu_668_p2 <= std_logic_vector(unsigned(zext_ln1525_19_fu_665_p1) + unsigned(zext_ln225_16_fu_662_p1));
    ret_9_fu_681_p2 <= std_logic_vector(unsigned(zext_ln1525_22_fu_678_p1) + unsigned(zext_ln1525_15_fu_674_p1));
    ret_fu_356_p2 <= std_logic_vector(unsigned(zext_ln225_11_fu_352_p1) + unsigned(zext_ln225_fu_322_p1));
    rhs_fu_334_p7 <= (ap_const_lv2_2 & loop_offset_int_reg);
    select_ln117_fu_785_p3 <= 
        ap_const_lv19_0 when (tmp_62_fu_777_p3(0) = '1') else 
        trunc_ln115_fu_773_p1;
    select_ln225_2_fu_442_p3 <= 
        ap_const_lv3_4 when (loop_offset_int_reg(0) = '1') else 
        ap_const_lv3_3;
    select_ln225_fu_406_p3 <= 
        ap_const_lv3_2 when (loop_offset_int_reg(0) = '1') else 
        ap_const_lv3_1;
        sext_ln115_fu_699_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln115_fu_693_p2),21));

        sext_ln116_1_fu_759_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln116_2_reg_833),19));

        sext_ln116_fu_745_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln116_1_fu_735_p4),19));

    shl_ln2_fu_634_p3 <= (tmp_fu_612_p8 & ap_const_lv2_0);
    shl_ln_fu_600_p3 <= (ret_10_fu_594_p2 & ap_const_lv2_0);
    sub_ln115_fu_693_p2 <= std_logic_vector(unsigned(zext_ln225_12_fu_687_p1) - unsigned(zext_ln225_17_fu_690_p1));
    sub_ln116_1_fu_753_p2 <= std_logic_vector(unsigned(ap_const_lv20_0) - unsigned(zext_ln116_2_fu_749_p1));
    sub_ln116_fu_730_p2 <= std_logic_vector(unsigned(ap_const_lv21_0) - unsigned(add_ln116_reg_823));
    tmp_62_fu_777_p3 <= res_fu_766_p3(19 downto 19);
    trunc_ln115_fu_773_p1 <= res_fu_766_p3(19 - 1 downto 0);
    trunc_ln116_1_fu_735_p4 <= sub_ln116_fu_730_p2(20 downto 3);
    zext_ln114_fu_630_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_612_p8),19));
    zext_ln115_fu_642_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln2_fu_634_p3),19));
    zext_ln116_1_fu_703_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln116_1_reg_813_pp0_iter1_reg),21));
    zext_ln116_2_fu_749_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln116_fu_745_p1),20));
    zext_ln116_3_fu_762_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln116_1_fu_759_p1),20));
    zext_ln116_fu_652_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln115_fu_646_p2),20));
    zext_ln1525_15_fu_674_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_12_fu_668_p2),19));
    zext_ln1525_18_fu_490_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_9_fu_472_p8),17));
    zext_ln1525_19_fu_665_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln1525_reg_803),18));
    zext_ln1525_20_fu_518_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_10_fu_500_p8),17));
    zext_ln1525_21_fu_540_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_11_fu_522_p8),17));
    zext_ln1525_22_fu_678_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln1525_6_reg_808),19));
    zext_ln1525_fu_468_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_8_fu_450_p8),17));
    zext_ln225_11_fu_352_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_fu_334_p8),17));
    zext_ln225_12_fu_687_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln_reg_793_pp0_iter1_reg),20));
    zext_ln225_13_fu_380_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln225_2_fu_372_p3),3));
    zext_ln225_14_fu_402_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_10_fu_384_p8),17));
    zext_ln225_15_fu_432_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_7_fu_414_p8),17));
    zext_ln225_16_fu_662_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_11_reg_798),18));
    zext_ln225_17_fu_690_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_9_reg_818),20));
    zext_ln225_18_fu_568_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_13_fu_550_p8),17));
    zext_ln225_19_fu_590_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_12_fu_572_p8),17));
    zext_ln225_20_fu_608_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_600_p3),20));
    zext_ln225_fu_322_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_fu_304_p8),17));
end behav;
