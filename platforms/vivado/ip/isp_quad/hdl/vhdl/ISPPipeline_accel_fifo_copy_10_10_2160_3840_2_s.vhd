-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_fifo_copy_10_10_2160_3840_2_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    demosaic_out_4198_dout : IN STD_LOGIC_VECTOR (95 downto 0);
    demosaic_out_4198_empty_n : IN STD_LOGIC;
    demosaic_out_4198_read : OUT STD_LOGIC;
    ltm_in_4199_din : OUT STD_LOGIC_VECTOR (95 downto 0);
    ltm_in_4199_full_n : IN STD_LOGIC;
    ltm_in_4199_write : OUT STD_LOGIC;
    height : IN STD_LOGIC_VECTOR (11 downto 0);
    width : IN STD_LOGIC_VECTOR (11 downto 0) );
end;


architecture behav of ISPPipeline_accel_fifo_copy_10_10_2160_3840_2_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal trunc_ln_reg_111 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start : STD_LOGIC;
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_done : STD_LOGIC;
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_idle : STD_LOGIC;
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_ready : STD_LOGIC;
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_demosaic_out_4198_read : STD_LOGIC;
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_din : STD_LOGIC_VECTOR (95 downto 0);
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_write : STD_LOGIC;
    signal grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln201_fu_89_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal row_V_fu_40 : STD_LOGIC_VECTOR (11 downto 0);
    signal row_V_2_fu_83_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component ISPPipeline_accel_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        demosaic_out_4198_dout : IN STD_LOGIC_VECTOR (95 downto 0);
        demosaic_out_4198_empty_n : IN STD_LOGIC;
        demosaic_out_4198_read : OUT STD_LOGIC;
        ltm_in_4199_din : OUT STD_LOGIC_VECTOR (95 downto 0);
        ltm_in_4199_full_n : IN STD_LOGIC;
        ltm_in_4199_write : OUT STD_LOGIC;
        trunc_ln : IN STD_LOGIC_VECTOR (10 downto 0) );
    end component;



begin
    grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56 : component ISPPipeline_accel_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start,
        ap_done => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_done,
        ap_idle => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_idle,
        ap_ready => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_ready,
        demosaic_out_4198_dout => demosaic_out_4198_dout,
        demosaic_out_4198_empty_n => demosaic_out_4198_empty_n,
        demosaic_out_4198_read => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_demosaic_out_4198_read,
        ltm_in_4199_din => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_din,
        ltm_in_4199_full_n => ltm_in_4199_full_n,
        ltm_in_4199_write => grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_write,
        trunc_ln => trunc_ln_reg_111);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln201_fu_89_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_ready = ap_const_logic_1)) then 
                    grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    row_V_fu_40_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                row_V_fu_40 <= ap_const_lv12_0;
            elsif (((icmp_ln201_fu_89_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                row_V_fu_40 <= row_V_2_fu_83_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                trunc_ln_reg_111 <= width(11 downto 1);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_done, ap_CS_fsm_state2, icmp_ln201_fu_89_p2, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln201_fu_89_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_done)
    begin
        if ((grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln201_fu_89_p2)
    begin
        if ((((icmp_ln201_fu_89_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln201_fu_89_p2)
    begin
        if (((icmp_ln201_fu_89_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    demosaic_out_4198_read_assign_proc : process(grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_demosaic_out_4198_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            demosaic_out_4198_read <= grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_demosaic_out_4198_read;
        else 
            demosaic_out_4198_read <= ap_const_logic_0;
        end if; 
    end process;

    grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start <= grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ap_start_reg;
    icmp_ln201_fu_89_p2 <= "1" when (row_V_fu_40 = height) else "0";
    ltm_in_4199_din <= grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_din;

    ltm_in_4199_write_assign_proc : process(grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_write, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ltm_in_4199_write <= grp_fifo_copy_10_10_2160_3840_2_Pipeline_Col_Loop_fu_56_ltm_in_4199_write;
        else 
            ltm_in_4199_write <= ap_const_logic_0;
        end if; 
    end process;

    row_V_2_fu_83_p2 <= std_logic_vector(unsigned(row_V_fu_40) + unsigned(ap_const_lv12_1));
end behav;
