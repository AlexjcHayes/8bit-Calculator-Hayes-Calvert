----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2021 02:19:50 PM
-- Design Name: 
-- Module Name: Calculator_HayesCalvert_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculator_HayesCalvert_tb is
-- Port ( Instr: in STD_Logic_vector(7 downto 0);
--clock: in STD_Logic);
end Calculator_HayesCalvert_tb;

architecture Behavioral of Calculator_HayesCalvert_tb is

component Calculator_Hayes_Calvert
 Port ( Instruction: in STD_Logic_vector(7 downto 0);
CLK: in STD_Logic);
end component Calculator_Hayes_Calvert;

Signal Instr: STD_Logic_vector(7 downto 0);
Signal clock: STD_Logic;
begin

Calculator: Calculator_Hayes_Calvert port map(Instruction=>Instr, CLK=> clock);

process
type pattern_type is record
--  The inputs of the shift_reg.
Instr: STD_LOGIC_VECTOR(7 downto 0);
clock: STD_LOGIC;

--  The expected outputs of the shift_reg.
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := --WRONG test vectors. replace with your own.
(
("10001010",'0'),
("10001010",'1'), -- load value -6 into register 1 
("10011011",'0'),
("10010011",'1'),-- load value -5 into register 2 
("00100001",'0'),
("00100001",'1'), -- add  ((-6) +(-5)=-11)
("11000000",'0'),
("11000000",'1'), -- print value from register 1
("11000100",'0'), 
("11000100",'1'),-- print value from register 2
("11001000",'0'), 
("11001000",'1'),-- print value from register 3
("10000010",'0'),
("10000010",'1'), -- load value 2 into register 1 
("10011011",'0'),
("10010010",'1'),-- load value -5 into register 2 
("01100001",'0'),
("01100001",'1'), -- subtract  (2 -(-5)=7)
("11000000",'0'),
("11000000",'1'), -- print value from register 1
("11000100",'0'), 
("11000100",'1'),-- print value from register 2
("11001000",'0'), 
("11001000",'1')-- print value from register 3

); -- Need two vectors to simulate an edge.
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
Instr <= patterns(n).Instr;
clock <= patterns(n).clock;
--Equal <= patterns(n).Equal;
--  Wait for the results.
wait for 1 ns;
--  Check the outputs.
--assert Output = patterns(n).Output report "bad output value for Output" severity error;
end loop;
assert false report "end of test" severity note;



----  Wait forever; this will finish the simulation.
wait;
end process;

end Behavioral;
