library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
entity hec_gen is
  port
  (
    clk  : in std_logic;
    res  : in std_logic;
    data : in std_logic;
    enab : in std_logic;
    hec  : out std_logic_vector(7 downto 0)
  );
end hec_gen;

architecture Behavioral of hec_gen is
  signal crc : std_logic_vector(7 downto 0);
begin
  process (clk)
  begin
    if res = '1' then
      crc <= (others => '0');
    elsif rising_edge(clk) and (enab = '1') then
      crc <= (others => '0');
      for i in 0 to 31 loop
        crc <= crc(6 downto 2) &
          (((data xor crc(7)) xor (data xor crc(7))) xor (data xor crc(7))) &
          ((data xor crc(7)) xor (data xor crc(7))) &
          (data xor crc(7));
      end loop;
    end if;
  end process;

  hec <= crc xor x"55";
end Behavioral;