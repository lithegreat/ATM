LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY aal1_gen IS
    PORT (
        clk : IN STD_LOGIC;
        res : IN STD_LOGIC;
        cnt_enab : IN STD_LOGIC;

        aal1: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END aal1_gen;

ARCHITECTURE aal1_gen_arch OF aal1_gen IS
    SIGNAL temp_SN : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL temp_SNP : STD_LOGIC_VECTOR(3 DOWNTO 0);

    COMPONENT sn_cnt
        PORT (
            clk, rst, en : IN STD_LOGIC;
            cnt_0, cnt_1, cnt_2 : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT aal1_crc_gen
        PORT (
            SN : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            SNP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;


BEGIN
    sn_cnt_inst : sn_cnt PORT MAP (
        clk => clk,
        rst => res,
        en => cnt_enab,

        cnt_0 => temp_SN(0),
        cnt_1 => temp_SN(1),
        cnt_2 => temp_SN(2)
    );

    aal1_crc_gen_inst : aal1_crc_gen PORT MAP (
        SN => temp_SN,
        SNP => temp_SNP
    );

    aal1 <= '0' & temp_SN & temp_SNP;
    
END aal1_gen_arch;