-- need to add clear, enable, load, and 8-bit initial count value (see ffin, ffout)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity w03d4 is
  Port (clk, dir, rst : in std_logic;
        cnt_out : out std_logic_vector(7 downto 0));
end w03d4;

architecture Behavioral of w03d4 is
    signal cnt : std_logic_vector(7 downto 0);
begin

process (clk, rst)
begin
    if (rst = '1') then
        cnt <= (others => '0');
    elsif rising_edge(clk) then
        if (dir = '1') then
            cnt <= cnt + '1'; -- count up
        else
            cnt <= cnt - '1'; -- count down
        end if;
    end if;
end process;
cnt_out <= cnt;
end Behavioral;
