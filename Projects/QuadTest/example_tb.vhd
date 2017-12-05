library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;
    
    
entity quad_tester_tb is
end entity quad_tester_tb;   

architecture beh of quad_tester_tb is
  signal clk_50mhz: std_logic;
  signal counter_i  : std_logic_vector(13 downto 0) := (others => '0');
  signal update   : std_logic; 
  signal gapDetect: std_logic;
begin
  quad_tester_i : entity work.quad_tester
  port map
  (
    clk       => clk_50mhz,
    counter   => counter_i,
    update    => update,
    gapDetect => gapDetect
  );
   
  process
  begin
    clk_50mhz <= '1';
    wait for 10 ns;
    clk_50mhz <= '0';
    wait for 10 ns;
  end process;

  process
  begin
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + integer(2);
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i - integer(2);
    wait until rising_edge(clk_50mhz);
    counter_i <= counter_i + '1';
  end process;  
  
    
end architecture beh;

