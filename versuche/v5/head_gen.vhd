library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity head_gen is
  port
  (
    clk         : in std_logic;
    res         : in std_logic;
    set_head    : in std_logic;
    head_in     : in std_logic_vector(31 downto 0);
    output_head : in std_logic;
    head_data   : out std_logic_vector(7 downto 0);
    hg_done     : out std_logic);
end head_gen;

architecture struct of head_gen is
  component hec_gen
    port
    (
      data, clk, res, enab : in std_logic;
      hec                  : out std_logic_vector(7 downto 0));
  end component;

  -- weitere Deklarationen
  signal head_intern : std_logic_vector(31 downto 0) := (others => '0'); -- Internal signal for head_in
  signal hg_cnt_val  : std_logic_vector(5 downto 0); -- Counter for HEC generation cycles
  signal hec_res     : std_logic; -- Reset signal for hec_gen
  signal hec_enable  : std_logic; -- Enable signal for hec_gen
  signal hec_val     : std_logic_vector(7 downto 0);-- Value of HEC generated by hec_gen
  signal out_cnt_val : std_logic_vector(2 downto 0) := "000"; -- Counter for outputting header bytes
  signal or_out      : std_logic; -- OR output signal
  signal mux_out_1   : std_logic; -- Mux output signal
  signal mux_out_2   : std_logic_vector(7 downto 0); -- Mux output signal

begin
  inst_hec_gen : hec_gen
  port map
  (
    data => mux_out_1,
    clk  => clk,
    res  => or_out,
    enab => hec_enable,
    hec  => hec_val);
  process (clk) -- h_reg
  begin
    if (clk'EVENT and clk = '1') then
      if (res = '1') then
        head_intern <= (others => '0');
      elsif (set_head = '1') then
        head_intern <= head_in;
      end if;
    end if;
  end process;
  process (clk) -- hg_cnt
    variable enab : integer;
  begin
    if (clk'EVENT and clk = '1') then
      if (res = '1') then
        hg_cnt_val <= (others => '0');
        enab := 0;
      elsif (set_head = '1') then
        enab := 1;
      end if;
      if (enab = 1) then
        hg_cnt_val <= std_logic_vector(unsigned(hg_cnt_val) + 1);
        case to_integer(unsigned(hg_cnt_val)) is
          when 1 =>
            hec_res <= '0';
          when 2 to 33 =>
            hec_enable <= '1';
          when 34 =>
            hg_done    <= '1';
            hec_enable <= '0';
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;
  process (clk) -- out_cnt
  begin
    if (clk'EVENT and clk = '1') then
      if (output_head = '0' or res = '1') then
        out_cnt_val <= (others => '0');
      elsif (output_head = '1') then
        out_cnt_val <= std_logic_vector(unsigned(out_cnt_val) + 1);
      end if;
    end if;
  end process;
  process (clk) -- or
  begin
    if (clk'EVENT and clk = '1') then
      or_out <= res or hec_res;
    end if;
  end process;
  process (clk) -- mux_1
    variable index : integer := 0;
  begin
    if (clk'EVENT and clk = '1') then
      index := to_integer(unsigned(out_cnt_val));
      if (index >= 0 and index <= 31) then
        mux_out_1                <= head_intern(31 - index);
      else
        mux_out_1 <= '0';
      end if;
    end if;
  end process;

  process (clk) -- mux_2
  begin
    if (clk'EVENT and clk = '1') then
      case to_integer(unsigned(out_cnt_val)) is
        when 0 =>
          null;
        when 1 =>
          mux_out_2 <= head_intern(31 downto 24);
        when 2 =>
          mux_out_2 <= head_intern(23 downto 16);
        when 3 =>
          mux_out_2 <= head_intern(15 downto 8);
        when 4 =>
          mux_out_2 <= head_intern(7 downto 0);
        when 5 =>
          mux_out_2 <= hec_val;
        when others =>
          null;
      end case;
    end if;
  end process;

  head_data <= mux_out_2;

end struct;