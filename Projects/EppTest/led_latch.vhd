library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_latch is
	port(
  	 clk_in  : in std_logic;
	 reset_in: in std_logic;
    latch_in: in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    latch_out: out std_logic_vector(7 downto 0)	
  );
end entity;

architecture v1 of led_latch is
begin
  process(clk_in)
	 begin
	   if ( rising_edge(clk_in) ) then
        if ( reset_in = '1' ) then
          latch_out <= (others => '0');
        elsif ( latch_in = '1' ) then
          latch_out <= data_in;
        end if;
    end if;
  end process;
  
end architecture;
