library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;
 
entity simple_counter is
    port
    (
        clk           : in std_logic;
		enable        : in std_logic;
        counter       : out std_logic_vector(31 downto 0)
    );
end entity;

architecture v1 of simple_counter is
	signal counter_i : std_logic_vector(31 downto 0);
	signal clk_i: std_logic;
	signal clk_i2: std_logic;
begin
	counter <= counter_i;
	
	process(clk, clk_i, clk_i2, enable)
	begin
	  clk_i <= clk;
      clk_i2 <= clk_i;

	  if (enable = '0') then
      	counter_i <= (others => '0');
	  elsif (rising_edge(clk_i2)) then
        counter_i <= counter_i + '1';
      else
        counter_i <= counter_i; 
      end if;
	end process;
end architecture v1;

