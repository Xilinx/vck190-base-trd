-- 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ISPPipeline_accel_mul_27ns_24ns_51_1_1 is
generic (
    ID : INTEGER := 1;
    NUM_STAGE : INTEGER := 0;
    din0_WIDTH : INTEGER := 14;
    din1_WIDTH : INTEGER := 12;
    dout_WIDTH : INTEGER := 26);
port (
    din0: in std_logic_vector(din0_WIDTH - 1 downto 0);
    din1: in std_logic_vector(din1_WIDTH - 1 downto 0);
    dout: out std_logic_vector(dout_WIDTH - 1 downto 0));
end entity;

architecture behav of ISPPipeline_accel_mul_27ns_24ns_51_1_1 is
    signal a_i : std_logic_vector(din0_WIDTH - 1 downto 0);
    signal b_i : std_logic_vector(din1_WIDTH - 1 downto 0);
begin
    a_i <= din0;
    b_i <= din1;
    dout <= std_logic_vector(resize(unsigned(a_i) * unsigned(b_i), dout_WIDTH));
end architecture;
