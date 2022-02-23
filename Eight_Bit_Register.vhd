----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 11:55:57 PM
-- Design Name: 
-- Module Name: Eight_Bit_Register - Behavioral
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

entity Eight_Bit_Register is
    Port ( Load: in STD_LOGIC_VECTOR (7 downto 0);
            WE: in STD_LOGIC; -- hopefully this will tie everything together correctly
            --WE: in STD_LOGIC_VECTOR(7 downto 0); -- might need this if the Top level port mapping breaks
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC);
end Eight_Bit_Register;

architecture Behavioral of Eight_Bit_Register is

component One_Bit_DFlipFlop
port(Load,CLK,WE: in STD_LOGIC;
    Q: out STD_LOGIC);
end component;


begin

Eightbit_REG: for I in 0 to 7 generate

OneBit_REG: One_Bit_DFlipFlop port map (Load => Load(I), We => WE, Q => Q(I),CLK => CLK);


end generate Eightbit_REG;


end Behavioral;
