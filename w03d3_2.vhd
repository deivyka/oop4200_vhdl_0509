library ieee;
use ieee.std_logic_1164.all;
entity slr8bits is
    Port ( clk, rst, sin: in std_logic;
           ctrl: in std_logic_vector(1 downto 0);
           d: in std_logic_vector (7 downto 0);
           dout: out std_logic_vector (7 downto 0)
           );
end slr8bits;

architecture arch of slr8bits is
signal ffin, ffout: std_logic_vector (7 downto 0);
begin

-- state register section
process (clk, rst)
        begin
            if (rst = '1') then
                ffout <= (others => '0');
            elsif rising_edge(clk) then
                ffout <= ffin;
            end if;
end process;

-- outputs section
with ctrl select
    ffin <=
        ffout                       when "00",
        ffout (6 downto 0) & d(0)   when "01", -- left-shift
        d(7) & ffout(7 downto 1)    when "10", -- right-shift
        d                           when others; -- parallel
dout <= ffout;
end arch;
