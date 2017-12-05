library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;

entity epp_read_counter is
	port(
  	 clk_in     : in std_logic;
	 reset_in   : in std_logic;
	 data_out   : out std_logic_vector(7 downto 0);  -- data lines used when the host reads from a channel
	 incr       : in std_logic                      -- '1' means "on the next clock rising edge, put your next byte of data on f2hData_in"
  );
end entity;

architecture v1 of epp_read_counter	 is
signal counter: std_logic_vector(7 downto 0);
begin
  data_out <= counter;

  process(clk_in)
	 begin		
	   if ( rising_edge(clk_in) ) then
        if ( reset_in = '1' ) then
          counter <= (others => '0');
        elsif ( incr = '1' ) then
          counter <= counter + '1';
        end if;
    end if;
  end process;
  
end architecture;
