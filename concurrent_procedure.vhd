library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concurrent_procedure is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end concurrent_procedure;

architecture RTL of concurrent_procedure is
  signal temp : std_logic;

  procedure proc(signal z : out std_logic;
                 x, y : in std_logic) is
  begin
    if y = '1' then
      z <= y;
    else
      z <= not y;
    end if;
  end proc;

begin

  proc(temp, a, b);

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
