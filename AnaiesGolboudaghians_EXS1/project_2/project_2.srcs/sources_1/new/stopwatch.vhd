library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;  

entity stopwatch is
    Port ( 
        clk     : in STD_LOGIC;
        rst     : in STD_LOGIC;
        start   : in STD_LOGIC;
        sec_100 : out STD_LOGIC_VECTOR (7 downto 0);
        sec     : out STD_LOGIC_VECTOR (7 downto 0);
        min     : out STD_LOGIC_VECTOR (7 downto 0)
    );
end stopwatch;

architecture Behavioral of stopwatch is
    signal s_100 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal s      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal m      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin

process(clk, rst)
begin
    if rst = '1' then
        s_100 <= (others => '0');
        s     <= (others => '0');
        m     <= (others => '0');
    elsif rising_edge(clk) then
        if start = '1' then
            s_100 <= s_100 + 1;
            if s_100 = 99 then
                s_100 <= (others => '0');
                s <= s + 1;
                if s = 59 then
                    s <= (others => '0');
                    m <= m + 1;
                    if m = 59 then
                        m <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;


sec_100 <= s_100;
sec     <= s;
min     <= m;

end Behavioral;