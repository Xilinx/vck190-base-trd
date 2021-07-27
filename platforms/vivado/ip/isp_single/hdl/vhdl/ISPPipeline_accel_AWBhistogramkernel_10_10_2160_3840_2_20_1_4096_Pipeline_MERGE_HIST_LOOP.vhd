-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_AWBhistogramkernel_10_10_2160_3840_2_20_1_4096_Pipeline_MERGE_HIST_LOOP is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    tmp_hist_V_0_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist_V_0_ce0 : OUT STD_LOGIC;
    tmp_hist_V_0_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist1_V_0_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist1_V_0_ce0 : OUT STD_LOGIC;
    tmp_hist1_V_0_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist_V_3_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist_V_3_ce0 : OUT STD_LOGIC;
    tmp_hist_V_3_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist1_V_3_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist1_V_3_ce0 : OUT STD_LOGIC;
    tmp_hist1_V_3_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    hist_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    hist_ce0 : OUT STD_LOGIC;
    hist_we0 : OUT STD_LOGIC;
    hist_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist_V_1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist_V_1_ce0 : OUT STD_LOGIC;
    tmp_hist_V_1_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist1_V_1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist1_V_1_ce0 : OUT STD_LOGIC;
    tmp_hist1_V_1_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist_V_4_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist_V_4_ce0 : OUT STD_LOGIC;
    tmp_hist_V_4_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist1_V_4_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist1_V_4_ce0 : OUT STD_LOGIC;
    tmp_hist1_V_4_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    hist1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    hist1_ce0 : OUT STD_LOGIC;
    hist1_we0 : OUT STD_LOGIC;
    hist1_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist_V_2_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist_V_2_ce0 : OUT STD_LOGIC;
    tmp_hist_V_2_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist1_V_2_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist1_V_2_ce0 : OUT STD_LOGIC;
    tmp_hist1_V_2_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist_V_5_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist_V_5_ce0 : OUT STD_LOGIC;
    tmp_hist_V_5_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_hist1_V_5_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    tmp_hist1_V_5_ce0 : OUT STD_LOGIC;
    tmp_hist1_V_5_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    hist2_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    hist2_ce0 : OUT STD_LOGIC;
    hist2_we0 : OUT STD_LOGIC;
    hist2_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of ISPPipeline_accel_AWBhistogramkernel_10_10_2160_3840_2_20_1_4096_Pipeline_MERGE_HIST_LOOP is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv13_1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_const_lv13_1000 : STD_LOGIC_VECTOR (12 downto 0) := "1000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1057_fu_277_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal zext_ln1057_fu_283_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1057_reg_363 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1057_reg_363_pp0_iter1_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_hist_V_0_load_reg_430 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_hist1_V_0_load_reg_435 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_1_fu_304_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_1_reg_440 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_hist_V_1_load_reg_445 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_hist1_V_1_load_reg_450 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_4_fu_310_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_4_reg_455 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_hist_V_2_load_reg_460 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_hist1_V_2_load_reg_465 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_7_fu_316_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_7_reg_470 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal i_V_5_fu_64 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i_V : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln870_4_fu_271_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln601_fu_322_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_3_fu_332_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln601_6_fu_342_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

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
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    i_V_5_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln1057_fu_277_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_V_5_fu_64 <= add_ln870_4_fu_271_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_V_5_fu_64 <= ap_const_lv13_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln601_1_reg_440 <= add_ln601_1_fu_304_p2;
                add_ln601_4_reg_455 <= add_ln601_4_fu_310_p2;
                add_ln601_7_reg_470 <= add_ln601_7_fu_316_p2;
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                tmp_hist1_V_0_load_reg_435 <= tmp_hist1_V_0_q0;
                tmp_hist1_V_1_load_reg_450 <= tmp_hist1_V_1_q0;
                tmp_hist1_V_2_load_reg_465 <= tmp_hist1_V_2_q0;
                tmp_hist_V_0_load_reg_430 <= tmp_hist_V_0_q0;
                tmp_hist_V_1_load_reg_445 <= tmp_hist_V_1_q0;
                tmp_hist_V_2_load_reg_460 <= tmp_hist_V_2_q0;
                    zext_ln1057_reg_363_pp0_iter1_reg(12 downto 0) <= zext_ln1057_reg_363(12 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1057_fu_277_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    zext_ln1057_reg_363(12 downto 0) <= zext_ln1057_fu_283_p1(12 downto 0);
            end if;
        end if;
    end process;
    zext_ln1057_reg_363(63 downto 13) <= "000000000000000000000000000000000000000000000000000";
    zext_ln1057_reg_363_pp0_iter1_reg(63 downto 13) <= "000000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln601_1_fu_304_p2 <= std_logic_vector(unsigned(tmp_hist_V_3_q0) + unsigned(tmp_hist1_V_3_q0));
    add_ln601_3_fu_332_p2 <= std_logic_vector(unsigned(tmp_hist1_V_1_load_reg_450) + unsigned(tmp_hist_V_1_load_reg_445));
    add_ln601_4_fu_310_p2 <= std_logic_vector(unsigned(tmp_hist_V_4_q0) + unsigned(tmp_hist1_V_4_q0));
    add_ln601_6_fu_342_p2 <= std_logic_vector(unsigned(tmp_hist1_V_2_load_reg_465) + unsigned(tmp_hist_V_2_load_reg_460));
    add_ln601_7_fu_316_p2 <= std_logic_vector(unsigned(tmp_hist_V_5_q0) + unsigned(tmp_hist1_V_5_q0));
    add_ln601_fu_322_p2 <= std_logic_vector(unsigned(tmp_hist1_V_0_load_reg_435) + unsigned(tmp_hist_V_0_load_reg_430));
    add_ln870_4_fu_271_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_V) + unsigned(ap_const_lv13_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln1057_fu_277_p2)
    begin
        if (((icmp_ln1057_fu_277_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_V_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, i_V_5_fu_64, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_i_V <= ap_const_lv13_0;
        else 
            ap_sig_allocacmp_i_V <= i_V_5_fu_64;
        end if; 
    end process;

    hist1_address0 <= zext_ln1057_reg_363_pp0_iter1_reg(12 - 1 downto 0);

    hist1_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            hist1_ce0 <= ap_const_logic_1;
        else 
            hist1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    hist1_d0 <= std_logic_vector(unsigned(add_ln601_4_reg_455) + unsigned(add_ln601_3_fu_332_p2));

    hist1_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            hist1_we0 <= ap_const_logic_1;
        else 
            hist1_we0 <= ap_const_logic_0;
        end if; 
    end process;

    hist2_address0 <= zext_ln1057_reg_363_pp0_iter1_reg(12 - 1 downto 0);

    hist2_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            hist2_ce0 <= ap_const_logic_1;
        else 
            hist2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    hist2_d0 <= std_logic_vector(unsigned(add_ln601_7_reg_470) + unsigned(add_ln601_6_fu_342_p2));

    hist2_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            hist2_we0 <= ap_const_logic_1;
        else 
            hist2_we0 <= ap_const_logic_0;
        end if; 
    end process;

    hist_address0 <= zext_ln1057_reg_363_pp0_iter1_reg(12 - 1 downto 0);

    hist_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            hist_ce0 <= ap_const_logic_1;
        else 
            hist_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    hist_d0 <= std_logic_vector(unsigned(add_ln601_1_reg_440) + unsigned(add_ln601_fu_322_p2));

    hist_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            hist_we0 <= ap_const_logic_1;
        else 
            hist_we0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln1057_fu_277_p2 <= "1" when (ap_sig_allocacmp_i_V = ap_const_lv13_1000) else "0";
    tmp_hist1_V_0_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist1_V_0_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist1_V_0_ce0 <= ap_const_logic_1;
        else 
            tmp_hist1_V_0_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist1_V_1_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist1_V_1_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist1_V_1_ce0 <= ap_const_logic_1;
        else 
            tmp_hist1_V_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist1_V_2_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist1_V_2_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist1_V_2_ce0 <= ap_const_logic_1;
        else 
            tmp_hist1_V_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist1_V_3_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist1_V_3_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist1_V_3_ce0 <= ap_const_logic_1;
        else 
            tmp_hist1_V_3_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist1_V_4_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist1_V_4_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist1_V_4_ce0 <= ap_const_logic_1;
        else 
            tmp_hist1_V_4_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist1_V_5_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist1_V_5_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist1_V_5_ce0 <= ap_const_logic_1;
        else 
            tmp_hist1_V_5_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist_V_0_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist_V_0_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist_V_0_ce0 <= ap_const_logic_1;
        else 
            tmp_hist_V_0_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist_V_1_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist_V_1_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist_V_1_ce0 <= ap_const_logic_1;
        else 
            tmp_hist_V_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist_V_2_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist_V_2_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist_V_2_ce0 <= ap_const_logic_1;
        else 
            tmp_hist_V_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist_V_3_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist_V_3_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist_V_3_ce0 <= ap_const_logic_1;
        else 
            tmp_hist_V_3_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist_V_4_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist_V_4_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist_V_4_ce0 <= ap_const_logic_1;
        else 
            tmp_hist_V_4_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_hist_V_5_address0 <= zext_ln1057_fu_283_p1(12 - 1 downto 0);

    tmp_hist_V_5_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_hist_V_5_ce0 <= ap_const_logic_1;
        else 
            tmp_hist_V_5_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln1057_fu_283_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_V),64));
end behav;
