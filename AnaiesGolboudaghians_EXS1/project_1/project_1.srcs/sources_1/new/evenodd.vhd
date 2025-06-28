library IEEE;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
use IEEE.NUMERIC_STD.ALL;

entity evenodd is 
Port (a:in STD_LOGIC_VECTOR (7 downto 0);
b: out STD_LOGIC_VECTOR (7 downto 0));
end evenodd;

architecture Behavioral of evenodd is
signal q: std_logic;
signal y, z, w, s, two: std_logic_vector(7 downto 0);
begin
q <=((((((((a(7) xor a(6))xor a(5))xor a(4))xor a(3))xor a(2))xor a(1))xor a(0)));
y <= a + x"2F";
z <= a-x"25";
w <= (y(0)&y(7)&y(6)&y(5)&y(4)&y(3)&y(2)&y(1));
s <= (z(6)&z(5)&z(4)&z(3)&z(2)&z(1)&z(0)&z(7));
with q select 
b <= (s) when ('1'),
 (w) when ('0'),
 (x"00") when others;


end Behavioral;
