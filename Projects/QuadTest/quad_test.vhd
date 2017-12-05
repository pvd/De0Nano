library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_misc.all;
  use ieee.numeric_std.all;
 
-- Component declaration to use in testbench
entity quad_tester is
  port
  (
    clk       : in std_logic;
    counter   : in std_logic_vector(13 downto 0);
    update    : out std_logic;
    gapDetect : out std_logic
  );
end entity;

architecture syn of quad_tester is
  signal counter_i  : std_logic_vector(13 downto 0) := (others => '0');
  signal update_i: std_logic := '0';
  signal gapDetect_i: std_logic := '0';
begin
  process(clk)
  begin
    if ( rising_edge(clk) ) then
      if ( counter /= counter_i ) then
        update_i <= not update_i;
        
        if ( (counter /= (counter_i + integer(1))) and (counter /= (counter_i - integer(1))) ) then
          gapDetect_i <= not gapDetect_i;
        end if;
      
        counter_i <= counter; 
      end if;
    end if;
  end process;
 
  update <= update_i;
  gapDetect <= gapDetect_i;
end architecture syn;

