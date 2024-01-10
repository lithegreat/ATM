LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- Testbench
ENTITY sn_cnt_tb IS
END sn_cnt_tb;

ARCHITECTURE testbench OF sn_cnt_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT sn_cnt
    PORT(
        clk, rst, en : IN STD_LOGIC;
        cnt_0, cnt_1, cnt_2 : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT stim_gen
    PORT(
        clk, res, enab : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL clk, rst, en, cnt_0, cnt_1, cnt_2 : STD_LOGIC;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    stim_gen_inst : stim_gen
        PORT MAP (
            clk => clk,
            res => rst,
            enab => en
        );

    sn_cnt_inst : sn_cnt
        PORT MAP (
            clk => clk,
            rst => rst,
            en => en,
            cnt_0 => cnt_0,
            cnt_1 => cnt_1,
            cnt_2 => cnt_2
            );
    
    -- Clock process definitions
    PROCESS
    BEGIN
        WAIT FOR 2000 ns;
        WAIT;
    END PROCESS;
END ARCHITECTURE testbench;
