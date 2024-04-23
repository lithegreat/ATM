library IEEE;
use IEEE.std_logic_1164.all;

entity sp_conv is
  port
  (
    d_in, clk, res : in std_logic;
    d_out          : out std_logic_vector(7 downto 0));
end sp_conv;

architecture behav of sp_conv is
  signal internal_reg : std_logic_vector(7 downto 0);
begin
  r : process (clk)
  begin
    if clk'EVENT and clk = '1' then
      if res = '1' then
        internal_reg <= "00000000";
      else
        internal_reg <= internal_reg(6 downto 0) & d_in;
      end if;
    end if;
  end process r;
  d_out <= internal_reg;
end behav;