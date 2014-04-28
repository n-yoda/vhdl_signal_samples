library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity process_case is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end process_case;

architecture RTL of process_case is
  signal temp : std_logic;
begin

  calc : process(a, b)
  begin
    case b is
      when '1' =>
        temp <= a;
      when others =>
        temp <= not a;
    end case;
  end process;

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
