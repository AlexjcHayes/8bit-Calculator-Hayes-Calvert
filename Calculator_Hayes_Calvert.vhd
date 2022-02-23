----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 06:29:23 PM
-- Design Name: 
-- Module Name: Calculator_Hayes_Calvert - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculator_Hayes_Calvert is
 Port ( Instruction: in STD_Logic_vector(7 downto 0);
 CLK: in STD_Logic);
end Calculator_Hayes_Calvert;

architecture Behavioral of Calculator_Hayes_Calvert is

component ALU_HayesCalvert is
Port ( A, B : in STD_LOGIC_VECTOR (7 downto 0):="00000000";
           OP : in STD_LOGIC_VECTOR (1 downto 0);
           Output : out STD_LOGIC_VECTOR (7 downto 0);
           Equal : out STD_LOGIC:='0' -- this is used for branch instructions
           );
end component ALU_HayesCalvert;

component Top_Level_REG
Port ( rs1, rs2, ws: in STD_LOGIC_VECTOR(1 downto 0);
  wd: in STD_LOGIC_VECTOR(7 downto 0);
  we, clk: in STD_LOGIC;
  rd1, rd2: out STD_LOGIC_VECTOR(7 downto 0));
end component Top_Level_REG;

component Mux_2_to_1 -- this is used to select the correct in put for WD in the Top_level_Reg
Port ( OP : in STD_LOGIC;
           A, B: in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component Mux_2_to_1;

component Display_Hayes_Calvert
 Port ( Value: in STD_Logic_VECTOR(7 downto 0);
       enable,clock:in STD_Logic;
       reg: in STD_LOGIC_VECTOR(1 downto 0));
end component Display_Hayes_Calvert;

Signal ALU_OUTPUT: STD_Logic_vector(7 downto 0);
Signal Load_Value_8_Bit: STD_LOGIC_VECTOR(7 downto 0);
Signal Op_Code: STD_Logic;
Signal WD_Mux_Output:STD_LOGIC_VECTOR(7 downto 0); 
Signal Op_Code_Not: STD_Logic;
Signal RD1:STD_LOGIC_VECTOR(7 downto 0);
Signal RD2: STD_LOGIC_VECTOR(7 downto 0);
Signal DISP_EN:STD_Logic; -- used for the enable to display the values
begin


WD_Mux: Mux_2_to_1 port map(OP =>Instruction(7), B=>Load_Value_8_Bit , A => ALU_OUTPUT,output=>WD_Mux_Output);

TP_REG: Top_Level_REG port map(rs1 =>Instruction(3 downto 2), rs2 => Instruction(1 downto 0),ws => Instruction(5 downto 4),wd => WD_Mux_Output,we =>Op_Code_Not, clk =>CLK,rd1 =>RD1,rd2=>RD2);

ALU: ALU_HayesCalvert port map(A=>RD1, B=>RD2, OP=>Instruction(7 downto 6),output=>ALU_OUTPUT);

DISP: Display_Hayes_Calvert port map(clock=>CLK,enable=>DISP_EN,value=>RD1,reg=>Instruction(3 downto 2));

Load_Value_8_Bit<= std_logic_vector(resize(signed(Instruction(3 downto 0)),8)); -- sign extend the load value to 8 bits
Op_Code_Not <=not (Instruction(7) and Instruction(6)); -- this is for the WE for the TP_REG_File
DISP_EN<=(Instruction(7) and Instruction(6));


end Behavioral;
