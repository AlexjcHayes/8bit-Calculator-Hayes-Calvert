----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2021 12:52:28 AM
-- Design Name: 
-- Module Name: Decoder_1_to_4 - Behavioral
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

entity Decoder_1_to_4 is
    Port ( we : in STD_LOGIC;
           ws: in STD_LOGIC_VECTOR(1 downto 0);
           A, B, C, D : out STD_LOGIC);
end Decoder_1_to_4;

architecture Behavioral of Decoder_1_to_4 is

begin

process(we,ws)
begin
    case ws is
        when "00" => A <= we;
        B <= '0';
        C <= '0';
        D <= '0';
        when "01" => B <= we;
        A <= '0';
        C <= '0';
        D <= '0';
        when "10" => C <= we;
        A <= '0';
        B <= '0';
        D <= '0';
        when "11" => D <= we;
        A <= '0';
        B <= '0';
        C <= '0';
        when others => D <= '1'; -- this should never be hit so it doesn't matter
        A <= '0';
        B <= '0';
        C <= '0';
    end case;
end process;
end Behavioral;
