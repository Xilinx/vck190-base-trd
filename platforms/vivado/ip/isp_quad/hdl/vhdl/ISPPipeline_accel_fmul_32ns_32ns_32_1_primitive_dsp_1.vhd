-- 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
Library ieee;
use ieee.std_logic_1164.all;

entity ISPPipeline_accel_fmul_32ns_32ns_32_1_primitive_dsp_1 is
    generic (
        ID         : integer := 1;
        NUM_STAGE  : integer := 1;
        din0_WIDTH : integer := 32;
        din1_WIDTH : integer := 32;
        dout_WIDTH : integer := 32
    );
    port (
        din0 : in  std_logic_vector(din0_WIDTH-1 downto 0);
        din1 : in  std_logic_vector(din1_WIDTH-1 downto 0);
        dout : out std_logic_vector(dout_WIDTH-1 downto 0)
    );
end entity;

architecture arch of ISPPipeline_accel_fmul_32ns_32ns_32_1_primitive_dsp_1 is
    --------------------- Component ---------------------
    component ISPPipeline_accel_fmul_32ns_32ns_32_1_primitive_dsp_1_ip is
        port (
            s_axis_a_tvalid      : in  std_logic;
            s_axis_a_tdata       : in  std_logic_vector(31 downto 0);
            s_axis_b_tvalid      : in  std_logic;
            s_axis_b_tdata       : in  std_logic_vector(31 downto 0);
            m_axis_result_tvalid : out std_logic;
            m_axis_result_tdata  : out std_logic_vector(31 downto 0)
        );
    end component;
    --------------------- Local signal ------------------
    signal a_tvalid : std_logic;
    signal a_tdata  : std_logic_vector(31 downto 0);
    signal b_tvalid : std_logic;
    signal b_tdata  : std_logic_vector(31 downto 0);
    signal r_tvalid : std_logic;
    signal r_tdata  : std_logic_vector(31 downto 0);
begin
    --------------------- Instantiation -----------------
    ISPPipeline_accel_fmul_32ns_32ns_32_1_primitive_dsp_1_ip_u : component ISPPipeline_accel_fmul_32ns_32ns_32_1_primitive_dsp_1_ip
    port map (
        s_axis_a_tvalid      => a_tvalid,
        s_axis_a_tdata       => a_tdata,
        s_axis_b_tvalid      => b_tvalid,
        s_axis_b_tdata       => b_tdata,
        m_axis_result_tvalid => r_tvalid,
        m_axis_result_tdata  => r_tdata
    );

    --------------------- Assignment --------------------
    a_tvalid <= '1';
    a_tdata  <= din0;
    b_tvalid <= '1';
    b_tdata  <= din1;
    dout     <= r_tdata;

end architecture;
