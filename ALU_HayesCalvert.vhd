----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2021 07:29:49 PM
-- Design Name: 
-- Module Name: ALU_HayesCalvert - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_HayesCalvert is
    Port ( A, B : in STD_LOGIC_VECTOR (7 downto 0):="00000000";
           OP : in STD_LOGIC_VECTOR (1 downto 0);
           Output : out STD_LOGIC_VECTOR (7 downto 0);
           Equal : out STD_LOGIC:='0' -- this is used for branch instructions
           );
end ALU_HayesCalvert;

architecture Behavioral of ALU_HayesCalvert is

component Eight_Bit_Adder
  Port ( 
A, B: in STD_LOGIC_VECTOR(7 downto 0);
OUTPUT: out STD_LOGIC_VECTOR(7 downto 0);
Cout: out STD_LOGIC
  );

end component;

component Eight_Bit_Subtractor
Port ( Ain,Bin: in STD_LOGIC_VECTOR(7 downto 0);
        OUTPUT: out STD_LOGIC_VECTOR(7 downto 0);
        Cout: out STD_LOGIC
);
end component;

component Mux_2_to_1
    Port ( OP : in STD_LOGIC;
       A, B : in STD_LOGIC_VECTOR (7 downto 0);
       output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

Signal AdderOutput:STD_LOGIC_VECTOR (7 downto 0);
Signal SubOutput:STD_LOGIC_VECTOR (7 downto 0);
--Signal NothingOutput:STD_LOGIC_VECTOR (7 downto 0):="00000000";

begin

mux: Mux_2_to_1 port map(A=>AdderOutput,B=>SubOutput,Op=>Op(0),output =>OUTPUT);
Adder: Eight_Bit_Adder Port map(A=>A, B=>B, OUTPUT => AdderOutput);
Subtractor: Eight_Bit_Subtractor port map(Ain=>A, Bin=>B, Output => SubOutput);

process(A,B,OP)
begin
if(OP = "11")then

    if((A xor B)="00000000")then
    Equal <= '1';
    else 
    Equal <= '0';
    end if;

end if;
--case OP is
--    when "00" => Output <= A + B;
--    Equal <='0';
--    when "01" => Output <= A - B;
--    Equal <='0';
--    when "11" => Equal <= '1';
--    Output <= "00000000";
--    when others => Output <= "00000000";
--    Equal <='0';
--end case;



end process;

end Behavioral;
