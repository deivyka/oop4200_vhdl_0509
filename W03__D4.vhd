-- universal binary counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity UniBitCnt is
  Port (clk, clear, enable, load, direction, reset : in std_logic;
        c_in : in std_logic_vector(7 downto 0);
        c_out : out std_logic_vector(7 downto 0));
end UniBitCnt;

architecture Behavioral of UniBitCnt is
    signal ffin, ffout : std_logic_vector(7 downto 0);
begin

process (clk, reset)
begin
    if (reset = '1') then       -- reset input
        ffout <= (others => '0');
    elsif rising_edge(clk) then
        ffout <= ffin;
    end if;
end process;

ffin <= (others => '0') when (clear = '1')     else -- clear = clear c_out
        ffout           when (enable = '0')    else    
        c_in            when (load = '1')      else -- load = load initial value c_in
        ffout+1         when (direction = '1') else -- count up
        ffout-1;

c_out <= ffout;
end Behavioral;
