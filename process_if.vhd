library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity process_if is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end process_if;

architecture RTL of process_if is
  signal temp : std_logic;
begin

  calc : process(a, b)
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
