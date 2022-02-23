----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2021 08:12:19 PM
-- Design Name: 
-- Module Name: One_Bit_fullAdder - Behavioral
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

entity One_Bit_fullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end One_Bit_fullAdder;

architecture Behavioral of One_Bit_fullAdder is
Signal AB_XOR: STD_LOGIC;
Signal C_AB: STD_LOGIC;
Signal AB_and: STD_LOGIC;
begin
AB_XOR <= A xor B;
C_AB <= AB_XOR and Cin;
AB_and <= A and B;
Cout <= C_AB or AB_and;
Sum <= AB_Xor xor Cin;



end Behavioral;
