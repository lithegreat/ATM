
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo is
  generic
  (
    ld_depth : integer := 3;
    level    : integer := 5
  );
  port
  (
    clk_in      : in std_logic;
    clk_out     : in std_logic;
    res         : in std_logic;
    we          : in std_logic;
    re          : in std_logic;
    full        : out std_logic;
    empty       : out std_logic;
    level_reach : out std_logic;
    data1       : in std_logic_vector (7 downto 0);
    data2       : out std_logic_vector (7 downto 0)
  );

end fifo;

architecture fifo_behav of fifo is

  type mem_array is array (0 to 2 ** ld_depth - 1) of std_logic_vector(7 downto 0);
  signal mem                           : mem_array;
  signal read_ptr, write_ptr           : unsigned(ld_depth downto 0);
  signal read_ptr_temp, write_ptr_temp : unsigned(ld_depth downto 0);
  signal full_flag, empty_flag         : std_logic;
  signal read_ptr_sync, write_ptr_sync : unsigned(ld_depth downto 0);

begin

  write_process : process (clk_in, res)
  begin
    if res = '1' then
      write_ptr <= (others => '0');
    elsif rising_edge(clk_in) then
      if we = '1' and full_flag = '0' then
        mem(to_integer(write_ptr(ld_depth - 1 downto 0))) <= data1;
        write_ptr                                         <= write_ptr + 1;
      end if;
    end if;
  end process write_process;

  read_process : process (clk_out, res)
  begin
    if res = '1' then
      read_ptr <= (others => '0');
    elsif rising_edge(clk_out) then
      if re = '1' and empty_flag = '0' then
        data2    <= mem(to_integer(read_ptr(ld_depth - 1 downto 0)));
        read_ptr <= read_ptr + 1;
      end if;
    end if;
  end process read_process;

  sync_read_ptr : process (clk_in)
  begin
    if rising_edge(clk_in) then
      read_ptr_temp <= read_ptr;
      read_ptr_sync <= read_ptr_temp;
    end if;
  end process sync_read_ptr;

  sync_write_ptr : process (clk_out)
  begin
    if rising_edge(clk_out) then
      write_ptr_temp <= write_ptr;
      write_ptr_sync <= write_ptr_temp;
    end if;
  end process sync_write_ptr;

  comparator_full : process (read_ptr_sync, write_ptr)
  begin
    if read_ptr_sync(ld_depth - 1 downto 0) = write_ptr(ld_depth - 1 downto 0) then
      if read_ptr_sync(ld_depth) = write_ptr(ld_depth) then
        full_flag <= '0';
        full      <= '0';
      else
        full_flag <= '1';
        full      <= '1';
      end if;
    end if;
  end process comparator_full;

  comparator_empty : process (read_ptr, write_ptr_sync)
  begin
    if read_ptr(ld_depth - 1 downto 0) = write_ptr_sync(ld_depth - 1 downto 0) then
      if read_ptr(ld_depth) = write_ptr_sync(ld_depth) then
        empty_flag <= '1';
        empty      <= '1';
      else
        empty_flag <= '0';
        empty      <= '0';
      end if;
    end if;

    if read_ptr(ld_depth) = write_ptr_sync(ld_depth) then
      if to_integer(write_ptr_sync(ld_depth - 1 downto 0)) - to_integer(read_ptr(ld_depth - 1 downto 0)) >= level then
        level_reach <= '1';
      else
        level_reach <= '0';
      end if;
    else
      if to_integer(write_ptr_sync(ld_depth - 1 downto 0)) + (2 ** ld_depth) - to_integer(read_ptr(ld_depth - 1 downto 0)) >= level then
        level_reach <= '1';
      else
        level_reach <= '0';
      end if;
    end if;

  end process comparator_empty;

end fifo_behav;