library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concurrent_when is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end concurrent_when;

architecture RTL of concurrent_when is
  signal temp : std_logic;
begin

  temp <= a when b = '1' else not a;

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
