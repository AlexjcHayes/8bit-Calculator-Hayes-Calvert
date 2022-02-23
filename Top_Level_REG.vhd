----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2021 12:11:03 AM
-- Design Name: 
-- Module Name: Top_Level_REG - Behavioral
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

entity Top_Level_REG is
  Port ( rs1, rs2, ws: in STD_LOGIC_VECTOR(1 downto 0);
  wd: in STD_LOGIC_VECTOR(7 downto 0);
  we, clk: in STD_LOGIC;
  rd1, rd2: out STD_LOGIC_VECTOR(7 downto 0));
end Top_Level_REG;

architecture Behavioral of Top_Level_REG is
component Eight_Bit_Register
Port ( Load : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           CLK, WE : in STD_LOGIC);
end component; 

component HayesCalvertMux
    generic(numBits: positive:=8);
Port ( A: in STD_LOGIC_VECTOR (numbits-1 downto 0);
       B: in STD_LOGIC_VECTOR (numbits-1 downto 0);
       C: in STD_LOGIC_VECTOR (numbits-1 downto 0);
       D: in STD_LOGIC_VECTOR (numbits-1 downto 0);
       SEL : in STD_LOGIC_VECTOR (1 downto 0);
       Y : out STD_LOGIC_VECTOR (numbits-1 downto 0));
end component; 

component Decoder_1_to_4
    Port ( we : in STD_LOGIC;
       ws: in STD_LOGIC_VECTOR(1 downto 0);
       A, B, C, D : out STD_LOGIC);
end component;

signal y1: STD_LOGIC;
signal y2: STD_LOGIC;
signal y3: STD_LOGIC;
signal y4: STD_LOGIC;
signal Reg_output1: STD_LOGIC_VECTOR( 7 downto 0);
signal Reg_output2: STD_LOGIC_VECTOR( 7 downto 0);
signal Reg_output3: STD_LOGIC_VECTOR( 7 downto 0);
signal Reg_output4: STD_LOGIC_VECTOR( 7 downto 0);

begin

we_Decoder: Decoder_1_to_4 port map(we => we, ws => ws, A => y1, B => y2, C => y3, D => y4);

Reg1:Eight_Bit_Register port map(Load => wd, WE=>y1, CLK =>clk, Q => Reg_output1);
Reg2:Eight_Bit_Register port map(Load => wd, WE=>y2, CLK =>clk, Q => Reg_output2);
Reg3:Eight_Bit_Register port map(Load => wd, WE=>y3, CLK =>clk, Q => Reg_output3);
Reg4:Eight_Bit_Register port map(Load => wd, WE=>y4, CLK =>clk, Q => Reg_output4);

mux1: HayesCalvertMux port map(A => Reg_output1, B =>Reg_output2, C => Reg_output3, D => Reg_output4, SEL => rs1, Y => rd1);
mux2: HayesCalvertMux port map(A => Reg_output1, B =>Reg_output2, C => Reg_output3, D => Reg_output4, SEL => rs2, Y => rd2);


end Behavioral;
