library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity ctl_in is
  port
  (
    clk         : in std_logic;
    res         : in std_logic;
    hg_done     : in std_logic;
    ready       : out std_logic;
    output_head : out std_logic;
    inc_aal1    : out std_logic;
    sel         : out std_logic_vector(1 downto 0);
    we_fifo     : out std_logic);
end ctl_in;

architecture Behavioral of ctl_in is
  type state_type is (init, start, head_write, new_aal1, aal1_write, data_write, last_byte, waiting);
  signal data_cnt          : integer range 0 to 375;
  signal state, next_state : state_type;
  signal is_ready          : std_logic := '0';
begin
  process (data_cnt, state, is_ready, hg_done)
    variable temp_var : std_logic_vector(8 downto 0);
  begin
    case state is
      when init =>
        if hg_done = '1' then
          next_state <= start;
        end if;
        ready       <= '0';
        is_ready    <= '0';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00";
        we_fifo     <= '0';
      when start =>
        next_state  <= head_write;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '1';
        inc_aal1    <= '0';
        sel         <= "00";
        we_fifo     <= '0';
      when head_write =>
        if data_cnt = 4 then
          next_state <= new_aal1;
        end if;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '1';
        inc_aal1    <= '0';
        sel         <= "10";
        we_fifo     <= '1';
      when new_aal1 =>
        next_state  <= aal1_write;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '0';
        inc_aal1    <= '1';
        sel         <= "10";
        we_fifo     <= '1';
      when aal1_write =>
        next_state  <= waiting;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "01";
        we_fifo     <= '1';
      when data_write =>
        next_state  <= waiting;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00";
        we_fifo     <= '1';
      when last_byte =>
        next_state  <= head_write;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '1';
        inc_aal1    <= '0';
        sel         <= "00";
        we_fifo     <= '1';
      when waiting =>
        temp_var := std_logic_vector(to_unsigned(data_cnt, 9));
        if temp_var(2 downto 0) = "111" and data_cnt = 375 then
          next_state <= last_byte;
        elsif temp_var(2 downto 0) = "111" and data_cnt /= 375 then
          next_state <= data_write;
        end if;
        ready       <= '1';
        is_ready    <= '1';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00";
        we_fifo     <= '0';
    end case;

  end process;

  process (clk, res)
  begin
    if res = '1' then
      state    <= init;
      data_cnt <= 0;
    elsif rising_edge(clk) then
      state <= next_state;
      if is_ready = '1' then
        data_cnt <= data_cnt + 1;
      end if;
      if data_cnt = 375 then
        data_cnt <= 0;
      end if;
    end if;
  end process;
end Behavioral;