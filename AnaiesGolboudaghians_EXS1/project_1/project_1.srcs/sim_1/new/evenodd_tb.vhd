library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity evenodd_tb is
end evenodd_tb;

architecture Behavioral of evenodd_tb is
component evenodd
PORT(
a: in std_logic_vector(7 downto 0);
b: out STD_LOGIC_VECTOR (8 downto 0)
);
end component;
signal a: std_logic_vector(7 downto 0):= (others => '0');
signal b: std_logic_vector(7 downto 0):= (others => '0');
begin
process
begin

a <= x"4B";
wait for 2 ps;
a <= x"7A";
wait;
end process;

U: entity work.evenodd(behavioral) PORT MAP(a=>a, b=>b);

end Behavioral;
