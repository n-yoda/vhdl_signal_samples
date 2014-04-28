library ieee;
use ieee.std_logic_1164.all;

package components is
<% require "./components.rb" %>
<% $components.each do |x| %>
  component <%= x %> is
    port (
      a, b : in std_logic;
      c : out std_logic;
      clk : in std_logic
    );
  end component;
<% end %>
end components;
