library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;
 
entity ClockSync is
    port
    (
        master_clk : in std_logic;
		input_clk  : in std_logic;
        sync_clk   : out std_logic
    );
end entity;

architecture v1 of ClockSync is
	signal clk_i : std_logic_vector(2 downto 0);
begin	
	process(master_clk)
	begin
	  if ( rising_edge(master_clk) ) then
		clk_i <= clk_i(1 downto 0) & input_clk; 
      end if;
	end process;
	
	sync_clk <= clk_i(2);
end architecture v1;

