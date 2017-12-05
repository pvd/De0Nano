library ieee;
use ieee.std_logic_1164.all;

entity ClockSync_testbench is
end ClockSync_testbench;

architecture tb_arch of ClockSync_testbench is
  signal test_master_clk: std_logic;
  signal test_input_clk: std_logic;
  signal test_sync_clk: std_logic;
begin
  uut: entity work.ClockSync(v1)
	port map(master_clk => test_master_clk, input_clk => test_input_clk, sync_clk => test_sync_clk); 
  
  -- master clock @ 16Khz generation
  process
  begin		
    test_master_clk <= '0';
	wait for 100 ns;
	test_master_clk <= '1';
	wait for 100 ns;
  end process;
  
  -- input clock @ 2Khz   
  process
  begin
    wait for 120 ns;	
    test_input_clk <= '0';
    wait for 500 us;
    test_input_clk <= '1';
	wait for 500 us;
  end process;
  
  
end tb_arch;
