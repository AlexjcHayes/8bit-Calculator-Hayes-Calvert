----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 01:25:42 PM
-- Design Name: 
-- Module Name: 324HayesCalvertMux - Behavioral
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

entity HayesCalvertMux is
    generic(numBits: positive);
    Port ( A: in STD_LOGIC_VECTOR (numbits-1 downto 0);
           B: in STD_LOGIC_VECTOR (numbits-1 downto 0);
           C: in STD_LOGIC_VECTOR (numbits-1 downto 0);
           D: in STD_LOGIC_VECTOR (numbits-1 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (numbits-1 downto 0));
end HayesCalvertMux;

architecture Behavioral of HayesCalvertMux is

begin

with SEL select
Y<= A when "00",
    B when "01",
    C when "10",
    D when others;



end Behavioral;
