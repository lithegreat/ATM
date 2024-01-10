LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


ENTITY sn_cnt IS
    PORT (
        clk, rst, en : IN STD_LOGIC;
        cnt_0, cnt_1, cnt_2 : OUT STD_LOGIC
    );
END ENTITY sn_cnt;


ARCHITECTURE structural OF sn_cnt IS

    
    COMPONENT my_dff_re
        PORT (
            d, clk, en, res : IN STD_LOGIC;
            q, qb : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT my_and2
        PORT (
            a,b : IN STD_LOGIC;
            y : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT my_and3
        PORT (
            a,b,c: IN STD_LOGIC;
            y: OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT my_nand2
        PORT (
            a,b : IN STD_LOGIC;
            y : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT my_or2
        PORT (
            a,b  : IN STD_LOGIC;
            y : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL q_0, q_1, q_2, qb_1, qb_2, qb_0,
    and_0, and_1, and_2, nand_0,
    or_0, or_1, and_3 : STD_LOGIC;

BEGIN

    dff_inst0: my_dff_re PORT MAP (
        d => qb_0,
        clk => clk,
        en => en,
        res => rst,
        q => q_0,
        qb => qb_0
    );

    dff_inst1: my_dff_re PORT MAP (
        d => or_0,
        clk => clk,
        en => en,
        res => rst,
        q => q_1,
        qb => qb_1
    );

    dff_inst2: my_dff_re PORT MAP (
        d => or_1,
        clk => clk,
        en => en,
        res => rst,
        q => q_2,
        qb => qb_2
    );
    and2_0: my_and2 PORT MAP (
        a=>q_0,
        b=>qb_1,
        y=>and_0
    );
    and2_1: my_and2 PORT MAP (
        a=>qb_0,
        b=>q_1,
        y=>and_1
    );
    and2_2: my_and2 PORT MAP (
        a=>nand_0,
        b=>q_2,
        y=>and_2
        );
    and3_0: my_and3 PORT MAP (
        a=>q_0,
        b=>q_1,
        c=>qb_2,
        y=>and_3
    );
    nand2_0: my_nand2 PORT MAP (
        a=>q_0,
        b=>q_1,       
        y=>nand_0
    );
    myor_0: my_or2 PORT MAP (
        a=>and_0,
        b=>and_1,
        y=>or_0
    );
    myor_1: my_or2 PORT MAP (
        a=>and_2,
        b=>and_3,
        y=>or_1
    );
    
    cnt_0 <= q_0;
    cnt_1 <= q_1;
    cnt_2 <= q_2;
    
END ARCHITECTURE structural;