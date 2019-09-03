## W03 D4

Consider an 8-bit universal binary counter supporting an asynchronous reset input plus four synchronous inputs to clear the outputs, to enable the operation of the counter, to load an 8-bit initial count value (c_in(7:0)), and to define the counting direction (up / down).


#### 1. Use the template below to create a function table describing the operation of this circuit.

reset  | clear  | enable | load   | direction | c_in(7:0)       | c_out(7:0)
------ | ------ | ------ | ------ | ------    | --------------- | ------ 
1      | X      | X      | X      | X         | X               | X
0      | 1      | X      | X      | X         | X               | Clear to 0
0      | 0      | 1      | X      | 1         | X               | Count up
0      | 0      | 1      | 1      | 1         | load input      | Count up


*not done*


#### 2. Create a VHDL design file complying with the functional requirements presented in the previous table.

```see W03__D4.vhd ```

#### 3. Prove the correctness of your design by simulation in Vivado.

``` run W03__D4_testbench.vhd ``` *not done*

#### 4. How would you change the function table and design file if you wanted to change the relative priority of the clear and load inputs?

The use of a Case-statement will remove priority.
