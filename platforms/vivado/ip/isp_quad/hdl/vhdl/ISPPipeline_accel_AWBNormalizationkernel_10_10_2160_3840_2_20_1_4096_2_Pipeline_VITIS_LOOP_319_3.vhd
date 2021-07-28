-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_AWBNormalizationkernel_10_10_2160_3840_2_20_1_4096_2_Pipeline_VITIS_LOOP_319_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    minValue_V_load_2 : IN STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_load_1 : IN STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_load : IN STD_LOGIC_VECTOR (23 downto 0);
    hist_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    hist_ce0 : OUT STD_LOGIC;
    hist_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    hist1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    hist1_ce0 : OUT STD_LOGIC;
    hist1_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    hist2_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    hist2_ce0 : OUT STD_LOGIC;
    hist2_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    j : IN STD_LOGIC_VECTOR (1 downto 0);
    conv_i_i1068 : IN STD_LOGIC_VECTOR (28 downto 0);
    minValue_V_0_i : IN STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_0_o : OUT STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_0_o_ap_vld : OUT STD_LOGIC;
    minValue_V_1_i : IN STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_1_o : OUT STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_1_o_ap_vld : OUT STD_LOGIC;
    minValue_V_2_i : IN STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_2_o : OUT STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_2_o_ap_vld : OUT STD_LOGIC;
    minValue_V_load_253_out : OUT STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_load_253_out_ap_vld : OUT STD_LOGIC;
    minValue_V_load_147_out : OUT STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_load_147_out_ap_vld : OUT STD_LOGIC;
    minValue_V_load41_out : OUT STD_LOGIC_VECTOR (23 downto 0);
    minValue_V_load41_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of ISPPipeline_accel_AWBNormalizationkernel_10_10_2160_3840_2_20_1_4096_2_Pipeline_VITIS_LOOP_319_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv13_1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv24_400 : STD_LOGIC_VECTOR (23 downto 0) := "000000000000010000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal and_ln319_fu_317_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage1 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal j_read_reg_416 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal conv_i_i1068_cast_fu_227_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal conv_i_i1068_cast_reg_422 : STD_LOGIC_VECTOR (32 downto 0);
    signal p1_V_1_reg_427 : STD_LOGIC_VECTOR (12 downto 0);
    signal p1_V_fu_269_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal p1_V_reg_448 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal n1_V_fu_323_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal n1_V_reg_456 : STD_LOGIC_VECTOR (31 downto 0);
    signal minValue_V_0_read_reg_461 : STD_LOGIC_VECTOR (23 downto 0);
    signal minValue_V_1_read_reg_466 : STD_LOGIC_VECTOR (23 downto 0);
    signal minValue_V_2_read_reg_471 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal zext_ln573_fu_259_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal lhs_V_fu_78 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal t_V_fu_82 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_sig_allocacmp_p1_V_1 : STD_LOGIC_VECTOR (12 downto 0);
    signal minValue_V_2_1_fu_86 : STD_LOGIC_VECTOR (23 downto 0);
    signal minValue_V_0_2_fu_337_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal minValue_V_2_2_fu_90 : STD_LOGIC_VECTOR (23 downto 0);
    signal minValue_V_2_3_fu_94 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal rhs_fu_274_p5 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln225_36_fu_289_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal zext_ln225_fu_285_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal ret_fu_293_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal tmp_fu_304_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1057_fu_299_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln1057_fu_311_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_fu_329_p5 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_idle_pp0_1to1 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_296 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component ISPPipeline_accel_mux_32_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        din3_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        din3 : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component ISPPipeline_accel_mux_32_24_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        din3_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (23 downto 0);
        din1 : IN STD_LOGIC_VECTOR (23 downto 0);
        din2 : IN STD_LOGIC_VECTOR (23 downto 0);
        din3 : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (23 downto 0) );
    end component;


    component ISPPipeline_accel_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    mux_32_32_1_1_U450 : component ISPPipeline_accel_mux_32_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        din2_WIDTH => 32,
        din3_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => hist_q0,
        din1 => hist1_q0,
        din2 => hist2_q0,
        din3 => j,
        dout => rhs_fu_274_p5);

    mux_32_24_1_1_U451 : component ISPPipeline_accel_mux_32_24_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 24,
        din2_WIDTH => 24,
        din3_WIDTH => 2,
        dout_WIDTH => 24)
    port map (
        din0 => minValue_V_0_read_reg_461,
        din1 => minValue_V_1_read_reg_466,
        din2 => minValue_V_2_read_reg_471,
        din3 => j,
        dout => tmp_s_fu_329_p5);

    flow_control_loop_pipe_sequential_init_U : component ISPPipeline_accel_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage1,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage1) or ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    lhs_V_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    lhs_V_fu_78 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    lhs_V_fu_78 <= n1_V_reg_456;
                end if;
            end if; 
        end if;
    end process;

    minValue_V_2_1_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    minValue_V_2_1_fu_86 <= minValue_V_load;
                elsif (((j_read_reg_416 = ap_const_lv2_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    minValue_V_2_1_fu_86 <= minValue_V_0_2_fu_337_p2;
                end if;
            end if; 
        end if;
    end process;

    minValue_V_2_2_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    minValue_V_2_2_fu_90 <= minValue_V_load_1;
                elsif (((j_read_reg_416 = ap_const_lv2_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    minValue_V_2_2_fu_90 <= minValue_V_0_2_fu_337_p2;
                end if;
            end if; 
        end if;
    end process;

    minValue_V_2_3_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    minValue_V_2_3_fu_94 <= minValue_V_load_2;
                elsif ((ap_const_boolean_1 = ap_condition_296)) then 
                    minValue_V_2_3_fu_94 <= minValue_V_0_2_fu_337_p2;
                end if;
            end if; 
        end if;
    end process;

    t_V_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    t_V_fu_82 <= ap_const_lv13_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    t_V_fu_82 <= p1_V_reg_448;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                conv_i_i1068_cast_reg_422 <= conv_i_i1068_cast_fu_227_p1;
                p1_V_1_reg_427 <= ap_sig_allocacmp_p1_V_1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_lv1_1 = and_ln319_fu_317_p2))) then
                minValue_V_0_read_reg_461 <= minValue_V_0_i;
                minValue_V_1_read_reg_466 <= minValue_V_1_i;
                minValue_V_2_read_reg_471 <= minValue_V_2_i;
                n1_V_reg_456 <= n1_V_fu_323_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                p1_V_reg_448 <= p1_V_fu_269_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to1, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_idle_pp0_1to1 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    and_ln319_fu_317_p2 <= (xor_ln1057_fu_311_p2 and icmp_ln1057_fu_299_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_296_assign_proc : process(ap_enable_reg_pp0_iter1, j_read_reg_416)
    begin
                ap_condition_296 <= (not((j_read_reg_416 = ap_const_lv2_1)) and not((j_read_reg_416 = ap_const_lv2_0)) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_exit_pp0_iter0_stage1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, and_ln319_fu_317_p2)
    begin
        if (((ap_const_lv1_0 = and_ln319_fu_317_p2) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to1_assign_proc : process(ap_enable_reg_pp0_iter1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_0)) then 
            ap_idle_pp0_1to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to1 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage1;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_p1_V_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, p1_V_reg_448, ap_block_pp0_stage0, ap_loop_init, t_V_fu_82)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
            if ((ap_loop_init = ap_const_logic_1)) then 
                ap_sig_allocacmp_p1_V_1 <= ap_const_lv13_0;
            elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                ap_sig_allocacmp_p1_V_1 <= p1_V_reg_448;
            else 
                ap_sig_allocacmp_p1_V_1 <= t_V_fu_82;
            end if;
        else 
            ap_sig_allocacmp_p1_V_1 <= t_V_fu_82;
        end if; 
    end process;

        conv_i_i1068_cast_fu_227_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(conv_i_i1068),33));

    hist1_address0 <= zext_ln573_fu_259_p1(12 - 1 downto 0);

    hist1_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            hist1_ce0 <= ap_const_logic_1;
        else 
            hist1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    hist2_address0 <= zext_ln573_fu_259_p1(12 - 1 downto 0);

    hist2_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            hist2_ce0 <= ap_const_logic_1;
        else 
            hist2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    hist_address0 <= zext_ln573_fu_259_p1(12 - 1 downto 0);

    hist_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            hist_ce0 <= ap_const_logic_1;
        else 
            hist_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln1057_fu_299_p2 <= "1" when (unsigned(ret_fu_293_p2) < unsigned(conv_i_i1068_cast_reg_422)) else "0";
    j_read_reg_416 <= j;
    minValue_V_0_2_fu_337_p2 <= std_logic_vector(unsigned(tmp_s_fu_329_p5) + unsigned(ap_const_lv24_400));

    minValue_V_0_o_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, minValue_V_0_i, j_read_reg_416, minValue_V_0_2_fu_337_p2, ap_block_pp0_stage0_01001)
    begin
        if (((j_read_reg_416 = ap_const_lv2_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            minValue_V_0_o <= minValue_V_0_2_fu_337_p2;
        else 
            minValue_V_0_o <= minValue_V_0_i;
        end if; 
    end process;


    minValue_V_0_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, j_read_reg_416, ap_block_pp0_stage0_11001)
    begin
        if (((j_read_reg_416 = ap_const_lv2_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            minValue_V_0_o_ap_vld <= ap_const_logic_1;
        else 
            minValue_V_0_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    minValue_V_1_o_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, minValue_V_1_i, j_read_reg_416, minValue_V_0_2_fu_337_p2, ap_block_pp0_stage0_01001)
    begin
        if (((j_read_reg_416 = ap_const_lv2_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            minValue_V_1_o <= minValue_V_0_2_fu_337_p2;
        else 
            minValue_V_1_o <= minValue_V_1_i;
        end if; 
    end process;


    minValue_V_1_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, j_read_reg_416, ap_block_pp0_stage0_11001)
    begin
        if (((j_read_reg_416 = ap_const_lv2_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            minValue_V_1_o_ap_vld <= ap_const_logic_1;
        else 
            minValue_V_1_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    minValue_V_2_o_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, minValue_V_2_i, j_read_reg_416, minValue_V_0_2_fu_337_p2, ap_block_pp0_stage0_01001)
    begin
        if ((not((j_read_reg_416 = ap_const_lv2_1)) and not((j_read_reg_416 = ap_const_lv2_0)) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            minValue_V_2_o <= minValue_V_0_2_fu_337_p2;
        else 
            minValue_V_2_o <= minValue_V_2_i;
        end if; 
    end process;


    minValue_V_2_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, j_read_reg_416, ap_block_pp0_stage0_11001)
    begin
        if ((not((j_read_reg_416 = ap_const_lv2_1)) and not((j_read_reg_416 = ap_const_lv2_0)) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            minValue_V_2_o_ap_vld <= ap_const_logic_1;
        else 
            minValue_V_2_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    minValue_V_load41_out <= minValue_V_2_1_fu_86;

    minValue_V_load41_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage1, and_ln319_fu_317_p2, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_lv1_0 = and_ln319_fu_317_p2) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            minValue_V_load41_out_ap_vld <= ap_const_logic_1;
        else 
            minValue_V_load41_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    minValue_V_load_147_out <= minValue_V_2_2_fu_90;

    minValue_V_load_147_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage1, and_ln319_fu_317_p2, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_lv1_0 = and_ln319_fu_317_p2) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            minValue_V_load_147_out_ap_vld <= ap_const_logic_1;
        else 
            minValue_V_load_147_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    minValue_V_load_253_out <= minValue_V_2_3_fu_94;

    minValue_V_load_253_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage1, and_ln319_fu_317_p2, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_lv1_0 = and_ln319_fu_317_p2) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            minValue_V_load_253_out_ap_vld <= ap_const_logic_1;
        else 
            minValue_V_load_253_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    n1_V_fu_323_p2 <= std_logic_vector(unsigned(rhs_fu_274_p5) + unsigned(lhs_V_fu_78));
    p1_V_fu_269_p2 <= std_logic_vector(unsigned(p1_V_1_reg_427) + unsigned(ap_const_lv13_1));
    ret_fu_293_p2 <= std_logic_vector(unsigned(zext_ln225_36_fu_289_p1) + unsigned(zext_ln225_fu_285_p1));
    tmp_fu_304_p3 <= p1_V_1_reg_427(12 downto 12);
    xor_ln1057_fu_311_p2 <= (tmp_fu_304_p3 xor ap_const_lv1_1);
    zext_ln225_36_fu_289_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_fu_274_p5),33));
    zext_ln225_fu_285_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_V_fu_78),33));
    zext_ln573_fu_259_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_p1_V_1),64));
end behav;
