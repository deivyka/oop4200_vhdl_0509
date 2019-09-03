## W03 D3

Consider an 8-bit shift-left register and its corresponding VHDL description, and assume that we want to expand it in order to support bidirectional shifting (shift-right) and parallel load inputs.


```
-- USN VHDL 101 course
-- 8-bit shift-left register
library ieee;
use ieee.std_logic_1164.all;
entity slr8bits is
    Port ( clk, rst, sin: in std_logic;
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
ffin <= ffout (6 downto 0) & sin;
dout <= ffout;
end arch;
```


Shift registers consist of D flip-flops. An 8-bit shift register consists of 8 D flip-flops. Bidirectional shift registers are able to shift data right or left.


#### 1.	Create a function table describing the operation of the expanded shift-register.


| ctrl | Behaviour 
|---- |-----
| 00  | Hold state
| 01 | left-shift
| 10 | right-shift
| 11 | parallel load


https://www.electrical4u.com/universal-shift-registers/


#### 2.	Expand the VHDL description presented to support the additional operating modes.

```
see W03__D3.vhd and W03__D3_testbench.vhd	

```


#### 3.	Prove the correctness of your solution by simulation in Vivado.

