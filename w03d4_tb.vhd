library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity w03d4_tb is
end w03d4_tb;

architecture Behavioral of w03d4_tb is
    constant clk_period : time := 10ns;

component w03d4
    port (clk, dir, rst: in std_logic;
          cnt_out: out std_logic_vector(7 downto 0));
end component;

signal clk, dir, rst : std_logic;
signal cnt_out : std_logic_vector(7 downto 0);

begin

uut: w03d4 port map(
            clk => clk, dir => dir, rst => rst, cnt_out => cnt_out
        );

clk_process: process
begin 
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

stim: process
begin
    rst <='1';
    wait for clk_period;
    rst <='0';
    dir <= '1';
    wait for clk_period*16;
    dir <= '0';
    wait for clk_period*16;
end process;
end;