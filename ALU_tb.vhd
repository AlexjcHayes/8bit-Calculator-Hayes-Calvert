----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2021 06:13:20 PM
-- Design Name: 
-- Module Name: TopLevel_REG_tb - Behavioral
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

entity ALU_HayesCalvert_tb is
--  Port ( );
end ALU_HayesCalvert_tb;

architecture Behavioral of ALU_HayesCalvert_tb is

component ALU_HayesCalvert
    Port ( A, B : in STD_LOGIC_VECTOR (7 downto 0);
       OP : in STD_LOGIC_VECTOR (1 downto 0);
       Output : out STD_LOGIC_VECTOR (7 downto 0):="00000000";
       Equal : out STD_LOGIC:='0' -- this is used for branch instructions
       );
end component;
--  Specifies which entity is bound with the component.
-- for shift_reg_0: shift_reg use entity work.shift_reg(rtl);
signal A, B, OUTPUT: std_logic_vector(7 downto 0);
signal OP: std_logic_vector(1 downto 0);
signal Equal: std_logic;
begin
--  Component instantiation.
ALU: ALU_HayesCalvert port map(A=>A, B=>B,OP=>OP,Output=>OUTPUT,Equal=>Equal);
--  This process does the real job.
process
type pattern_type is record
--  The inputs of the shift_reg.
A, B, OUTPUT: std_logic_vector (7 downto 0);
OP: std_logic_vector(1 downto 0);
Equal: std_logic;
--  The expected outputs of the shift_reg.
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := --WRONG test vectors. replace with your own.
(
--    A    |    B     |   Output  |  Op | Equal   
("00000001", "00000011", "00000000", "00", '0'),--
("00000000", "00000010", "00000000", "00", '0'),
("00000111", "00000001", "00000000", "01", '0'),--
("00000000", "00000000", "00000000", "00", '0'),
("11111111", "00000000", "00000000", "10", '0'),--
("00000000", "00000000", "00000000", "00", '0'),
("00000000", "00000000", "00000000", "11", '0'),
("00000001", "00000000", "00000000", "11", '0'),
("00000001", "00000000", "00000000", "10", '0')
); -- Need two vectors to simulate an edge.
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
A <= patterns(n).A;
B <= patterns(n).B;
OP <= patterns(n).OP;
--Equal <= patterns(n).Equal;
--  Wait for the results.
wait for 1 ns;
--  Check the outputs.
assert Output = patterns(n).Output report "bad output value for Output" severity error;
end loop;
assert false report "end of test" severity note;



----  Wait forever; this will finish the simulation.
wait;
end process;


end Behavioral;
