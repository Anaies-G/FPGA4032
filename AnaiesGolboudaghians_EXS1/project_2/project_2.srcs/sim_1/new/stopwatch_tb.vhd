library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity stopwatch_tb is
end stopwatch_tb;

architecture Behavioral of stopwatch_tb is
component stopwatch
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           sec_100 : out STD_LOGIC_VECTOR (7 downto 0);
           sec : out STD_LOGIC_VECTOR (7 downto 0);
           min : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal clk :STD_LOGIC:= '0';
signal rst, start :STD_LOGIC:= '0';
signal sec_100: std_logic_vector(7 downto 0);

signal sec: std_logic_vector(7 downto 0);
signal min: std_logic_vector(7 downto 0);

constant CLK_PERIOD : time := 2 ps;
begin



    -- Clock generation
    clk <= not clk after CLK_PERIOD/2;

process
begin
rst <= '1';
wait for 4 ps;
rst <= '0';
start <= '1';
wait for 50000 ps;
rst <='1';
start <= '0';


wait;
end process;

U: entity work.stopwatch(behavioral) PORT MAP( clk=>clk,
           rst =>rst,
           start => start,
           sec_100 => sec_100,
           sec => sec,
           min => min);

end Behavioral;

