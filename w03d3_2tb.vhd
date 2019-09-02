library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity w03d3_2tb is
end w03d3_2tb;

architecture Behavioral of w03d3_2tb is
    constant clk_period : time := 10ns;

component slr8bits
    port (clk, rst: in std_logic;
          ctrl: in std_logic_vector(1 downto 0);
          d: in std_logic_vector(7 downto 0);
          dout: out std_logic_vector(7 downto 0));
end component;

signal clk, rst, sin : std_logic;
signal ctrl : std_logic_vector(1 downto 0);
signal d : std_logic_vector(7 downto 0);
signal dout : std_logic_vector(7 downto 0);

begin

uut: slr8bits port map(
        clk => clk, rst => rst,
        ctrl => ctrl, d => d, dout => dout
    );

-- clock process
clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
end process;

stim: process
begin
    rst <= '1';
    wait for clk_period*2;
    rst <= '0';
    ctrl <= "10"; -- right shift
    d <= "11111111"; 
    wait for clk_period*7;
    ctrl <= "01"; -- left shift
    wait for clk_period*7;
    rst <= '0';
    ctrl <= "11"; -- parallel
    

end process;
end;
