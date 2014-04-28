<% require "./components.rb" %>
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

  <% $components.each_with_index do |cmp, i|%>
  test<%= i %> : <%= cmp %> port map (a, b, c(<%= i %>), clk);
  <% end %>

end behaviour;
