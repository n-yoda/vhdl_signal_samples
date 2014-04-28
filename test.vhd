
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.components.all;

entity test is
end test;

architecture behaviour of test is

  signal a, b : std_logic := '0';
  signal c : std_logic_vector(0 to 7) := (others => '0');
  signal clk : std_logic := '0';

  function equal_all(vec : std_logic_vector)
    return boolean is
  begin
    for i in vec'low to vec'high - 1 loop
      if vec(i) /= vec(i + 1) then
        report integer'image(i);
        return false;
      end if;
    end loop;
    return true;
  end equal_all;

begin

  assert equal_all(c);

  clk_gen : process
  begin
    for i in 1 to 7 loop
      clk <= not clk;
      wait for 1 ps;
    end loop;
    wait; -- exit
  end process;

  calc : process
  begin
    wait on clk;
    a <= not a;
    wait on clk;
    a <= not a;
    wait on clk;
    b <= not b;
    wait on clk;
    a <= not a;
    wait on clk;
    a <= not a;
    wait on clk;
    b <= not b;
    wait on clk;
    wait;  --exit
  end process;

  
  test0 : concurrent_when port map (a, b, c(0), clk);
  
  test1 : concurrent_select port map (a, b, c(1), clk);
  
  test2 : concurrent_procedure port map (a, b, c(2), clk);
  
  test3 : concurrent_function port map (a, b, c(3), clk);
  
  test4 : process_case port map (a, b, c(4), clk);
  
  test5 : process_if port map (a, b, c(5), clk);
  
  test6 : process_wait port map (a, b, c(6), clk);
  
  test7 : variable_procedure port map (a, b, c(7), clk);
  

end behaviour;
