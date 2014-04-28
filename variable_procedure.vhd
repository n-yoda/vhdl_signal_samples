library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity variable_procedure is
  port (
    a, b : in std_logic;
    c : out std_logic;
    clk : in std_logic
  );
end variable_procedure;

architecture RTL of variable_procedure is
  signal temp : std_logic;

  procedure proc(z : out std_logic;
                 x, y : in std_logic) is
  begin
    if y = '1' then
      z := y;
    else
      z := not y;
    end if;
  end proc;

begin

  calc : process(a, b)
    variable temp_var : std_logic;
  begin
    proc(temp_var, a, b);
    temp <= temp_var;
  end process;

  cycle : process(clk)
  begin
    if rising_edge(clk) then
      c <= temp;
    end if;
  end process;

end RTL;
