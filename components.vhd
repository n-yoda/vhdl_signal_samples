library ieee;
use ieee.std_logic_1164.all;

package components is


  component concurrent_when is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component concurrent_select is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component concurrent_procedure is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component concurrent_function is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component process_case is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component process_if is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component process_wait is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

  component variable_procedure is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;

end components;
