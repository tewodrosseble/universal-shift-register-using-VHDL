library ieee;
use ieee.std_logic_1164.all;

entity universalshiftregister is port (
d : in std_logic_vector(3 downto 0);
ctrl : in std_logic_vector(1 downto 0);
clk : in std_logic;
reset : in std_logic;
q : out std_logic_vector(3 downto 0));
end entity;

architecture behaviour of universalshiftregister is 
signal r_reg : std_logic_vector(3 downto 0);
signal r_next : std_logic_vector(3 downto 0);

begin 

-- D flip flop
process(reset, clk)
begin 
if (reset = '1') then 
r_reg <= (others=>'0');
elsif (clk'event and clk = '1') then 
r_reg <= r_next;
end if;
end process;

process(ctrl, r_reg, d)
begin 
case ctrl is 
when "00" => r_next <= r_reg;
when "01" => r_next <= r_reg(2 downto 0) & d(0);
when "10" => r_next <= d(3) & r_reg(3 downto 1) ;
when others => r_next <= d;
end case;
end process;
-- output logic 
q <= r_reg;
end behaviour;