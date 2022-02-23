----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2021 10:38:59 PM
-- Design Name: 
-- Module Name: Mux_4_to_1 - Behavioral
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

entity Mux_4_to_1 is
    Port ( OP : in STD_LOGIC_VECTOR (1 downto 0);
           A, B, C, D : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end Mux_4_to_1;

architecture Behavioral of Mux_4_to_1 is

begin

output <=A when OP ="00"; -- add
output <=B when OP ="01";-- sub
output <=C when OP ="10"; -- do nothging
output <=D when OP ="11";-- equal



end Behavioral;
