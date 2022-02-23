----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2021 08:20:36 PM
-- Design Name: 
-- Module Name: Eight_Bit_Adder - Behavioral
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

entity Eight_Bit_Adder is
  Port ( 
  A, B: in STD_LOGIC_VECTOR(7 downto 0);
  OUTPUT: out STD_LOGIC_VECTOR(7 downto 0);
  Cout: out STD_LOGIC
  );
end Eight_Bit_Adder;

architecture Behavioral of Eight_Bit_Adder is
Component One_Bit_halfAdder
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Sum : out STD_LOGIC;
       Carry : out STD_LOGIC);
end component;

Component One_Bit_fullAdder
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Sum : out STD_LOGIC;
       Cout : out STD_LOGIC);
end component;

--function CarryAnd(
Signal Cout_Connection: STD_LOGIC_VECTOR(7 downto 0);
Signal Sum_Connection: STD_LOGIC_VECTOR(7 downto 0);


begin
 
Adder_EightBit: for I in 0 to 7 generate
Half_Adder: if I=0 generate
H_A: One_Bit_halfAdder port map(A=>A(I), B=>B(I),Carry => Cout_Connection(0),Sum=>Sum_Connection(I));
end generate Half_Adder;

Full_Adder: if I>0 generate
F_A: One_Bit_fullAdder port map(A=>A(I), B=>B(I),Cin => Cout_Connection(I-1), Cout =>Cout_Connection(I),Sum=>Sum_Connection(I));
end generate Full_Adder;

end generate Adder_EightBit;
Cout <=Cout_Connection(7);
OUTPUT <=Sum_Connection;
end Behavioral;
