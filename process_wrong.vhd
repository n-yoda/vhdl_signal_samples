library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PROCESS_WRONG is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end PROCESS_WRONG;

architecture RTL of PROCESS_WRONG is
  signal temp : std_logic;
begin

  calc : process(clk)
  begin
    if b = '1' then
      temp <= a;
    else
      temp <= not a;
    end if;
  end process;

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
