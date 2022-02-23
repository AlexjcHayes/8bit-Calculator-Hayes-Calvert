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

entity TopLevel_REG_tb is
--  Port ( );
end TopLevel_REG_tb;

architecture Behavioral of TopLevel_REG_tb is

component Top_Level_REG
  Port ( rs1, rs2, ws: in STD_LOGIC_VECTOR(1 downto 0);
wd: in STD_LOGIC_VECTOR(7 downto 0);
we, clk: in STD_LOGIC;
rd1, rd2: out STD_LOGIC_VECTOR(7 downto 0));
end component;
--  Specifies which entity is bound with the component.
-- for shift_reg_0: shift_reg use entity work.shift_reg(rtl);
signal we, clk : std_logic;
signal wd,rd1,rd2: std_logic_vector(7 downto 0);
signal rs1,rs2,ws : std_logic_vector(1 downto 0);
begin
--  Component instantiation.
REG: Top_Level_REG port map (rs1 => rs1, rs2 => rs2, ws => ws, wd => wd, we => we, clk => clk, rd1 => rd1, rd2 => rd2);

--  This process does the real job.
process
type pattern_type is record
--  The inputs of the shift_reg.
rs1, rs2, ws: std_logic_vector(1 downto 0);
wd: std_logic_vector (7 downto 0);
clk,we: std_logic;
--  The expected outputs of the shift_reg.
rd1, rd2: std_logic_vector (7 downto 0);
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := --WRONG test vectors. replace with your own.
(
-- RS1| RS2| ws  |     wd    | clk | we |   rd1   |   rd2    
("00", "00", "00", "00000000", '0', '0',"00000000","00000000"),
("01", "01", "01", "00001111", '1', '1',"00000000","00000000"),
("01", "01", "01", "00001111", '0', '1',"00000000","00000000"),
("01", "01", "01", "00001111", '1', '1',"00000000","00000000")

); -- Need two vectors to simulate an edge.
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
rs1 <= patterns(n).rs1;
rs2 <= patterns(n).rs2;
ws <= patterns(n).ws;
wd <= patterns(n).wd;
clk <= patterns(n).clk;
we <= patterns(n).we;
--rd1 <= patterns(n).rd1;
--rd2 <= patterns(n).rd2;
--  Wait for the results.
wait for 1 ns;
--  Check the outputs.
assert rd1 = patterns(n).rd1 report "bad output value for rd1" severity error;
assert rd2 = patterns(n).rd2 report "bad output value for rd2" severity error;
end loop;
assert false report "end of test" severity note;



----  Wait forever; this will finish the simulation.
wait;
end process;


end Behavioral;
