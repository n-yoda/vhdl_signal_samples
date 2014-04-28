library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity process_wait is
  port(
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end process_wait;

architecture behaviour of process_wait is
  signal temp : std_logic;
begin

  calc : process
  begin
    loop
      if b = '1' then
        temp <= a;
      else
        temp <= not a;
      end if;
      wait on a, b;
    end loop;
  end process;

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end behaviour;
