-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_g_kernel_ap_uint_16_6_s is
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
    loop_r : IN STD_LOGIC_VECTOR (0 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (18 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of ISPPipeline_accel_g_kernel_ap_uint_16_6_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv21_0 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv20_0 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";

attribute shreg_extract : string;
    signal ret_22_fu_428_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal ret_22_reg_716 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ret_20_fu_558_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal ret_20_reg_721 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_fu_564_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_reg_726 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_reg_726_pp0_iter1_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln61_fu_606_p2 : STD_LOGIC_VECTOR (19 downto 0);
    signal add_ln61_reg_731 : STD_LOGIC_VECTOR (19 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal or_ln_fu_296_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal zext_ln225_fu_304_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal lhs_fu_308_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_fu_334_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_fu_334_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln225_30_fu_352_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln225_28_fu_326_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_21_fu_356_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal rhs_18_fu_374_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_18_fu_374_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_19_fu_396_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln1525_fu_392_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1525_28_fu_414_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln1525_fu_418_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1525_29_fu_424_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln225_31_fu_362_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal lhs_18_fu_434_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_21_fu_464_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_21_fu_464_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln225_33_fu_482_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln225_32_fu_452_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_23_fu_486_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal rhs_22_fu_504_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal rhs_22_fu_504_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal rhs_23_fu_526_p8 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln1525_30_fu_522_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1525_31_fu_544_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln1525_15_fu_548_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1525_32_fu_554_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln225_34_fu_492_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln1526_fu_582_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal shl_ln_fu_591_p3 : STD_LOGIC_VECTOR (18 downto 0);
    signal ret_fu_585_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln225_35_fu_598_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal sext_ln61_fu_602_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal shl_ln61_1_fu_612_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln64_fu_623_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal zext_ln61_fu_619_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln64_fu_626_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal sub_ln64_fu_640_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln64_1_fu_646_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln64_1_fu_656_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln64_fu_660_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal trunc_ln64_2_fu_670_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln64_2_fu_680_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal tmp_66_fu_632_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal sub_ln64_1_fu_664_p2 : STD_LOGIC_VECTOR (19 downto 0);
    signal zext_ln64_1_fu_684_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal res_fu_688_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal tmp_67_fu_700_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln61_fu_696_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal select_ln65_fu_708_p3 : STD_LOGIC_VECTOR (18 downto 0);
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
    signal loop_r_int_reg : STD_LOGIC_VECTOR (0 downto 0);
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
    mux_63_16_1_0_U154 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => zext_ln225_fu_304_p1,
        dout => lhs_fu_308_p8);

    mux_63_16_1_0_U155 : component ISPPipeline_accel_mux_63_16_1_0
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

    mux_63_16_1_0_U156 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => rhs_18_fu_374_p7,
        dout => rhs_18_fu_374_p8);

    mux_63_16_1_0_U157 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => zext_ln225_fu_304_p1,
        dout => rhs_19_fu_396_p8);

    mux_63_16_1_0_U158 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => zext_ln225_fu_304_p1,
        dout => lhs_18_fu_434_p8);

    mux_63_16_1_0_U159 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => rhs_21_fu_464_p7,
        dout => rhs_21_fu_464_p8);

    mux_63_16_1_0_U160 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => rhs_22_fu_504_p7,
        dout => rhs_22_fu_504_p8);

    mux_63_16_1_0_U161 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => zext_ln225_fu_304_p1,
        dout => rhs_23_fu_526_p8);

    mux_63_16_1_0_U162 : component ISPPipeline_accel_mux_63_16_1_0
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
        din6 => zext_ln225_fu_304_p1,
        dout => tmp_fu_564_p8);





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
                add_ln61_reg_731 <= add_ln61_fu_606_p2;
                ret_20_reg_721 <= ret_20_fu_558_p2;
                ret_22_reg_716 <= ret_22_fu_428_p2;
                tmp_reg_726 <= tmp_fu_564_p8;
                tmp_reg_726_pp0_iter1_reg <= tmp_reg_726;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce_reg)) then
                ap_return_int_reg <= select_ln65_fu_708_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce)) then
                loop_r_int_reg <= loop_r;
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
    add_ln1525_15_fu_548_p2 <= std_logic_vector(unsigned(zext_ln1525_30_fu_522_p1) + unsigned(zext_ln1525_31_fu_544_p1));
    add_ln1525_fu_418_p2 <= std_logic_vector(unsigned(zext_ln1525_fu_392_p1) + unsigned(zext_ln1525_28_fu_414_p1));
    add_ln61_fu_606_p2 <= std_logic_vector(unsigned(zext_ln225_35_fu_598_p1) + unsigned(sext_ln61_fu_602_p1));
    add_ln64_fu_626_p2 <= std_logic_vector(signed(sext_ln64_fu_623_p1) + signed(zext_ln61_fu_619_p1));
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_return_assign_proc : process(select_ln65_fu_708_p3, ap_ce_reg, ap_return_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return <= ap_return_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return <= select_ln65_fu_708_p3;
        else 
            ap_return <= "XXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    or_ln_fu_296_p3 <= (ap_const_lv1_1 & loop_r_int_reg);
    res_fu_688_p3 <= 
        sub_ln64_1_fu_664_p2 when (tmp_66_fu_632_p3(0) = '1') else 
        zext_ln64_1_fu_684_p1;
    ret_20_fu_558_p2 <= std_logic_vector(unsigned(zext_ln1525_32_fu_554_p1) + unsigned(zext_ln225_34_fu_492_p1));
    ret_21_fu_356_p2 <= std_logic_vector(unsigned(zext_ln225_30_fu_352_p1) + unsigned(zext_ln225_28_fu_326_p1));
    ret_22_fu_428_p2 <= std_logic_vector(unsigned(zext_ln1525_29_fu_424_p1) + unsigned(zext_ln225_31_fu_362_p1));
    ret_23_fu_486_p2 <= std_logic_vector(unsigned(zext_ln225_33_fu_482_p1) + unsigned(zext_ln225_32_fu_452_p1));
    ret_fu_585_p2 <= std_logic_vector(unsigned(ap_const_lv19_0) - unsigned(zext_ln1526_fu_582_p1));
    rhs_18_fu_374_p7 <= (ap_const_lv2_2 & loop_r_int_reg);
    rhs_21_fu_464_p7 <= 
        ap_const_lv3_2 when (loop_r_int_reg(0) = '1') else 
        ap_const_lv3_1;
    rhs_22_fu_504_p7 <= 
        ap_const_lv3_4 when (loop_r_int_reg(0) = '1') else 
        ap_const_lv3_3;
    rhs_fu_334_p7 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(loop_r_int_reg),3));
    select_ln65_fu_708_p3 <= 
        ap_const_lv19_0 when (tmp_67_fu_700_p3(0) = '1') else 
        trunc_ln61_fu_696_p1;
        sext_ln61_fu_602_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_fu_585_p2),20));

        sext_ln64_1_fu_656_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln64_1_fu_646_p4),19));

        sext_ln64_2_fu_680_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln64_2_fu_670_p4),19));

        sext_ln64_fu_623_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln61_reg_731),21));

    shl_ln61_1_fu_612_p3 <= (tmp_reg_726_pp0_iter1_reg & ap_const_lv2_0);
    shl_ln_fu_591_p3 <= (ret_20_reg_721 & ap_const_lv1_0);
    sub_ln64_1_fu_664_p2 <= std_logic_vector(unsigned(ap_const_lv20_0) - unsigned(zext_ln64_fu_660_p1));
    sub_ln64_fu_640_p2 <= std_logic_vector(unsigned(ap_const_lv21_0) - unsigned(add_ln64_fu_626_p2));
    tmp_66_fu_632_p3 <= add_ln64_fu_626_p2(20 downto 20);
    tmp_67_fu_700_p3 <= res_fu_688_p3(19 downto 19);
    trunc_ln61_fu_696_p1 <= res_fu_688_p3(19 - 1 downto 0);
    trunc_ln64_1_fu_646_p4 <= sub_ln64_fu_640_p2(20 downto 3);
    trunc_ln64_2_fu_670_p4 <= add_ln64_fu_626_p2(20 downto 3);
    zext_ln1525_28_fu_414_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_19_fu_396_p8),17));
    zext_ln1525_29_fu_424_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln1525_fu_418_p2),18));
    zext_ln1525_30_fu_522_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_22_fu_504_p8),17));
    zext_ln1525_31_fu_544_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_23_fu_526_p8),17));
    zext_ln1525_32_fu_554_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln1525_15_fu_548_p2),18));
    zext_ln1525_fu_392_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_18_fu_374_p8),17));
    zext_ln1526_fu_582_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_22_reg_716),19));
    zext_ln225_28_fu_326_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_fu_308_p8),17));
    zext_ln225_30_fu_352_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_fu_334_p8),17));
    zext_ln225_31_fu_362_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_21_fu_356_p2),18));
    zext_ln225_32_fu_452_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_18_fu_434_p8),17));
    zext_ln225_33_fu_482_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_21_fu_464_p8),17));
    zext_ln225_34_fu_492_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_23_fu_486_p2),18));
    zext_ln225_35_fu_598_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_591_p3),20));
    zext_ln225_fu_304_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln_fu_296_p3),3));
    zext_ln61_fu_619_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln61_1_fu_612_p3),21));
    zext_ln64_1_fu_684_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln64_2_fu_680_p1),20));
    zext_ln64_fu_660_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln64_1_fu_656_p1),20));
end behav;
