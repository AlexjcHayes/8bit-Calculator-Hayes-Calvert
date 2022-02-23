----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 11:48:28 PM
-- Design Name: 
-- Module Name: One_Bit_DFlipFlop - Behavioral
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

entity One_Bit_DFlipFlop is
    Port ( Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           WE: in STD_LOGIC;
           Q : out STD_LOGIC:='0');
end One_Bit_DFlipFlop;

architecture Behavioral of One_Bit_DFlipFlop is

begin
process(CLK)
begin
    if(rising_edge(CLK) and WE='1') then
        Q<=Load;
    end if;
end process;

end Behavioral;
