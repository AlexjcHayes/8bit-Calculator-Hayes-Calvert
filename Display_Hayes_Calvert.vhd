----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 09:45:56 PM
-- Design Name: 
-- Module Name: Display_Hayes_Calvert - Behavioral
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

entity Display_Hayes_Calvert is
 Port ( Value: in STD_Logic_VECTOR(7 downto 0);
        enable,clock:in STD_Logic;
        reg: in STD_LOGIC_VECTOR(1 downto 0));
end Display_Hayes_Calvert;

architecture Behavioral of Display_Hayes_Calvert is

Signal Display: STD_LOGIC; -- this is used control when values are sent to be displayed

begin

Display<=enable and clock;


process(Display)
begin
if(rising_edge(Display))
then
    report "The value in register " & integer' image(to_integer(unsigned(reg)));
    report "is " & integer'image(to_integer(signed(Value)));

end if;

end process;


end Behavioral;
