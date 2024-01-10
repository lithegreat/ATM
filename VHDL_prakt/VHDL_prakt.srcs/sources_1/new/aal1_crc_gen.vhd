LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY aal1_crc_gen IS
    PORT (
        SN : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        SNP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END aal1_crc_gen;

ARCHITECTURE aal1_crc_gen_arch OF aal1_crc_gen IS
    SIGNAL temp1, temp2, temp3, temp4 : STD_LOGIC;
BEGIN
    temp1 <= SN(2) XOR SN(0);
    temp2 <= (SN(2) AND SN(1) AND SN(0)) OR (SN(2) AND NOT SN(1) AND NOT SN(0)) OR (NOT SN(2) AND SN(1) AND NOT SN(0)) OR (NOT SN(2) AND NOT SN(1) AND SN(0));
    temp3 <= SN(2) XOR SN(1);
    temp4 <= '0' XOR SN(2) XOR SN(1) XOR SN(0) XOR temp3 XOR temp2 XOR temp1;

    SNP(0) <= temp4;
    SNP(1) <= temp1;
    SNP(2) <= temp2;
    SNP(3) <= temp3;
END aal1_crc_gen_arch;