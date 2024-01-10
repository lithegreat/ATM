LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY head_gen IS
	PORT (	clk : IN std_logic;
			res : IN std_logic;
			set_head : IN std_logic;
			head_in : IN std_logic_vector(31 DOWNTO 0);
			output_head : IN std_logic;
			head_data : OUT std_logic_vector(7 DOWNTO 0);
			hg_done : OUT std_logic);
END head_gen;

ARCHITECTURE struct OF head_gen IS
    COMPONENT hec_gen
	PORT (  data, clk, res, enab : IN std_logic;
			hec : OUT std_logic_vector(7 DOWNTO 0));
    END COMPONENT;

    -- weitere Deklarationen
    SIGNAL head_intern : std_logic_vector(31 DOWNTO 0) := (others => '0'); -- Internal signal for head_in
	SIGNAL hg_cnt_val : std_logic_vector(5 DOWNTO 0); -- Counter for HEC generation cycles
    SIGNAL hec_res : std_logic; -- Reset signal for hec_gen
	SIGNAL hec_enable : std_logic; -- Enable signal for hec_gen
    SIGNAL hec_val : std_logic_vector(7 DOWNTO 0);-- Value of HEC generated by hec_gen
	SIGNAL out_cnt_val : std_logic_vector(2 DOWNTO 0) := "000" ; -- Counter for outputting header bytes
	SIGNAL or_out : std_logic; -- OR output signal
	SIGNAL mux_out_1 : std_logic; -- Mux output signal
	SIGNAL mux_out_2 : std_logic_vector(7 DOWNTO 0); -- Mux output signal

BEGIN
	inst_hec_gen : hec_gen
	PORT MAP (  data => mux_out_1,
				clk => clk,
				res => or_out,
				enab => hec_enable,
				hec => hec_val);

	
	PROCESS(clk) -- h_reg
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			IF (res = '1') THEN
				head_intern <= (OTHERS => '0');
			ELSIF (set_head = '1') THEN
				head_intern <= head_in;
			END IF;
		END IF;
	END PROCESS;

	
	PROCESS (clk) -- hg_cnt
		VARIABLE enab : integer;
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			IF (res = '1') THEN
				hg_cnt_val <= (OTHERS => '0');
				enab := 0;
			ELSIF (set_head = '1') THEN	
				enab := 1;
			END IF;
			IF (enab = 1) THEN
				hg_cnt_val <= std_logic_vector(unsigned(hg_cnt_val) + 1);
				CASE to_integer(unsigned(hg_cnt_val)) IS
					WHEN 1 =>
						hec_res <= '0'; 
					WHEN 2 TO 33 =>
						hec_enable <= '1'; 
					WHEN 34 =>
						hg_done <= '1'; 
						hec_enable <= '0';
					WHEN OTHERS =>
						NULL;
				END CASE;
			END IF;
		END IF;
    END PROCESS;

	
	PROCESS (clk) -- out_cnt
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			IF (output_head = '0' OR res = '1') THEN
				out_cnt_val <= (OTHERS => '0');
			ELSIF (output_head = '1') THEN
				out_cnt_val <= std_logic_vector(unsigned(out_cnt_val) + 1);	
			END IF;
		END IF;
	END PROCESS;

	
	PROCESS (clk) -- or
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			or_out <= res OR hec_res;
		END IF;
	END PROCESS;

	
	PROCESS (clk) -- mux_1
    variable index : INTEGER := 0;
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			index := to_integer(unsigned(out_cnt_val));
			IF (index >= 0 AND index <= 31) THEN
				mux_out_1 <= head_intern(31 - index);
			ELSE
				mux_out_1 <= '0';
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS (clk) -- mux_2
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			CASE to_integer(unsigned(out_cnt_val)) IS
				WHEN 0 =>
					NULL;
				WHEN 1 =>
					mux_out_2 <= head_intern(31 DOWNTO 24);
				WHEN 2 =>
					mux_out_2 <= head_intern(23 DOWNTO 16);
				WHEN 3 =>
					mux_out_2 <= head_intern(15 DOWNTO 8);
				WHEN 4 =>
					mux_out_2 <= head_intern(7 DOWNTO 0);
				WHEN 5 =>
					mux_out_2 <= hec_val;
				WHEN OTHERS =>
					NULL;
			END CASE;
		END IF;
	END PROCESS;

	head_data <= mux_out_2;

END struct;
