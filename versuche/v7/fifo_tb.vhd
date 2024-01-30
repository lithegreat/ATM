library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo_tb is
end fifo_tb;

architecture stimul of fifo_tb is

  -- Component declaration

  signal clk1, clk2, res : std_logic := '0';
  signal we, re          : std_logic := '0';
  signal full, empty, lr : std_logic;
  signal data1, data2    : std_logic_vector (7 downto 0) := "00000000";
  constant t1            : time                          := 25 ns;
  constant t2            : time                          := 40 ns;

begin

  -- Component instantiation
  mut : ...

  c1 : process
  begin
    wait for t1;
    clk1 <= not clk1;
  end process c1;
  c2 : process
  begin
    wait for t2;
    clk2 <= not clk2;
  end process c2;
  res <= '1' after 30 ns, '0' after 200 ns;

  sw : process
    variable val : unsigned(7 downto 0) := "00000001";
  begin
    while true loop
      wait for 10 * t1;
      we    <= '1';
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      we <= '0';
      wait for 8 * t1;
    end loop;
  end process;
  sr : process
  begin
    while true loop
      re <= '0';
      wait for 20 * t2;
      re <= '1';
      wait for 16 * t2;
    end loop;
  end process;

end stimul;