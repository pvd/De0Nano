library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;

entity low_pass_filter is
  port
  (
    clk     :  in std_logic;
    reset   : in std_logic;
    raw     : in std_logic; 
    filtered: out std_logic
  );
end entity;

architecture v1 of low_pass_filter  is
signal filter: std_logic_vector(2 downto 0) := "000";
begin
  process(clk, raw)
  begin   
    if ( rising_edge(clk) ) then
      if ( reset = '1' ) then
        filter <= (others => '0');
      else 
        filter <= filter(1 downto 0) & raw;
      end if;
    end if;
  end process;

  process(filter)
  begin
    if ( filter = "111" ) then
      filtered <= '1';
    elsif ( filter = "000" ) then
      filtered <= '0';
    end if;
  end process;
  
end architecture;
