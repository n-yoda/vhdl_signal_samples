library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concurrent_select is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end concurrent_select;

architecture RTL of concurrent_select is
  signal temp : std_logic;
begin

  with b select temp <=
    a when '1',
    not a when others;

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
