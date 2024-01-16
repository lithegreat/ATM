LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL ;

ENTITY sp_conv IS
  PORT (d_in, clk, res : IN std_logic;
        d_out : OUT std_logic_vector(7 DOWNTO 0));
END sp_conv;
  
ARCHITECTURE behav OF sp_conv IS
    SIGNAL internal_reg : std_logic_vector(7 DOWNTO 0);
BEGIN
  r: PROCESS (clk)
  BEGIN
  IF clk'EVENT AND clk='1' THEN
    IF res='1' THEN
      internal_reg <= "00000000";
    ELSE
      internal_reg <= '0' & internal_reg(6 DOWNTO 0);
      internal_reg(7) <= d_in;
    END IF;
	END IF;
  END PROCESS r;
  d_out <= internal_reg;
END behav ;
