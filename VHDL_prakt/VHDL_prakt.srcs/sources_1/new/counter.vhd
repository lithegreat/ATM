library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk   : in std_logic;
        enab  : in std_logic;
        res   : in std_logic;
        cnt_val : out std_logic_vector(4 downto 0)
    );
end entity counter;

architecture Behavioral of counter is
    signal counter_val : unsigned(4 downto 0) := (others => '0');
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if res = '1' then
                counter_val <= (others => '0');
            elsif enab = '1' then
                if counter_val = to_unsigned(20, 5) then
                    counter_val <= to_unsigned(0, 5);
                else
                    counter_val <= counter_val + 1;
                end if;
            end if;
        end if;
    end process;

    cnt_val <= std_logic_vector(counter_val);

end architecture Behavioral;
