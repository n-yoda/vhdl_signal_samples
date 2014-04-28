library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concurrent_function is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end concurrent_function;

architecture RTL of concurrent_function is
  signal temp : std_logic;

  function func(x, y : std_logic)
    return std_logic is
  begin
    if y = '1' then
      return x;
    else
      return not x;
    end if;
  end func;

begin

  temp <= func(a, b);

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
