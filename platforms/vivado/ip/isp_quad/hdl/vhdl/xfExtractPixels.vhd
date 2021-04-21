-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.2
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xfExtractPixels is
port (
    ap_ready : OUT STD_LOGIC;
    tmp_buf_0_V_read : IN STD_LOGIC_VECTOR (9 downto 0);
    tmp_buf_1_V_read : IN STD_LOGIC_VECTOR (9 downto 0);
    tmp_buf_2_V_read : IN STD_LOGIC_VECTOR (9 downto 0);
    tmp_buf_3_V_read : IN STD_LOGIC_VECTOR (9 downto 0);
    val1_V_read : IN STD_LOGIC_VECTOR (19 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (9 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (9 downto 0);
    ap_return_3 : OUT STD_LOGIC_VECTOR (9 downto 0);
    ap_return_4 : OUT STD_LOGIC_VECTOR (9 downto 0);
    ap_return_5 : OUT STD_LOGIC_VECTOR (9 downto 0) );
end;


architecture behav of xfExtractPixels is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal trunc_ln647_fu_52_p1 : STD_LOGIC_VECTOR (9 downto 0);


begin



    ap_ready <= ap_const_logic_1;
    ap_return_0 <= tmp_buf_0_V_read;
    ap_return_1 <= tmp_buf_1_V_read;
    ap_return_2 <= tmp_buf_2_V_read;
    ap_return_3 <= tmp_buf_3_V_read;
    ap_return_4 <= trunc_ln647_fu_52_p1;
    ap_return_5 <= val1_V_read(19 downto 10);
    trunc_ln647_fu_52_p1 <= val1_V_read(10 - 1 downto 0);
end behav;
