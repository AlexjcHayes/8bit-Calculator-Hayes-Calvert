----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2021 03:03:16 PM
-- Design Name: 
-- Module Name: Mux_RS_Hayes_Calvert - Behavioral
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

entity Mux_RS_Hayes_Calvert is
    Port ( Sel : in STD_LOGIC;
       A, B: in STD_LOGIC_VECTOR (1 downto 0);
       output : out STD_LOGIC_VECTOR (1 downto 0));
end Mux_RS_Hayes_Calvert;

architecture Behavioral of Mux_RS_Hayes_Calvert is

begin

with Sel select output <=
A when '0', -- add
B when '1',-- sub
"00" when others;

end Behavioral;
