----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2021 09:04:17 PM
-- Design Name: 
-- Module Name: Eight_Bit_Subtractor - Behavioral
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

entity Eight_Bit_Subtractor is
Port ( Ain,Bin: in STD_LOGIC_VECTOR(7 downto 0):="00000000";
        OUTPUT: out STD_LOGIC_VECTOR(7 downto 0);
        Cout: out STD_LOGIC
);
end Eight_Bit_Subtractor;

architecture Behavioral of Eight_Bit_Subtractor is
component Eight_Bit_Adder
  Port ( 
A, B: in STD_LOGIC_VECTOR(7 downto 0);
OUTPUT: out STD_LOGIC_VECTOR(7 downto 0);
Cout: out STD_LOGIC
  );
 end component;
 
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
 
 function Vector_xor(vec1,vec2: in STD_LOGIC_VECTOR)return STD_LOGIC_VECTOR is 
    variable result: STD_LOGIC_VECTOR(7 downto 0);
    begin
    for i in vec1' range loop
    result(i):= vec1(i) xor vec2(i);
    end loop;
    return result;
 end function;
 
 
 Signal One_Bit: STD_LOGIC_VECTOR(7 downto 0):="00000001";
 Signal Adder1_out: STD_LOGIC_VECTOR(7 downto 0);
 Signal B_inv: STD_LOGIC_VECTOR(7 downto 0);
 Signal B_xor: STD_LOGIC_VECTOR(7 downto 0);
 
 ------------------------------------------------------
Signal Cout_Connection: STD_LOGIC_VECTOR(7 downto 0);
Signal Cout_Connection2: STD_LOGIC_VECTOR(7 downto 0);
Signal Sum_Connection: STD_LOGIC_VECTOR(7 downto 0):="00000000";
Signal Sum_Connection2: STD_LOGIC_VECTOR(7 downto 0):="00000000";
 
begin
B_xor<=Vector_xor(Bin,"11111111");
FULL_Sub: for I in 0 to 7 generate
INIT: if I=0 generate
F_A:One_Bit_fullAdder port map(A=>Ain(I), B=>B_xor(I),Cin => '1', Cout =>Cout_Connection(I),Sum=>Sum_Connection(I));
end generate INIT;

Full_Adder: if I>0 generate
F_A:One_Bit_fullAdder port map(A=>Ain(I), B=>B_xor(I),Cin => Cout_Connection(I-1), Cout =>Cout_Connection(I),Sum=>Sum_Connection(I));
end generate Full_Adder;

end generate FULL_Sub; 

Cout<=Cout_Connection(7);
OUTPUT<=Sum_Connection;




--B_inv <= not Bin;
--------------------------------------------------
--Subtractor_EightBit1: for I in 0 to 7 generate
--Half_Adder: if I=0 generate
--H_A: One_Bit_halfAdder port map(A=>B_inv(I), B=>One_Bit(I),Carry => Cout_Connection(0),Sum=>Sum_Connection(I));
--end generate Half_Adder;

--Full_Adder: if I>0 generate
--F_A: One_Bit_fullAdder port map(A=>B_inv(I), B=>One_Bit(I),Cin => Cout_Connection(I-1), Cout =>Cout_Connection(I),Sum=>Sum_Connection(I));
--end generate Full_Adder;

--end generate Subtractor_EightBit1;

----Cout <=Cout_Connection(7);
----OUTPUT <=Sum_Connection;


--Subtractor_EightBit2: for I in 0 to 7 generate
--Full_Adder1: if I=0 generate
--F_A: One_Bit_fullAdder port map(A=>Ain(I), B=>Sum_Connection(I),Cin => Cout_Connection(7), Cout =>Cout_Connection2(I),Sum=>Sum_Connection2(I));
--end generate Full_Adder1;

--Full_Adder: if I>0 generate
--F_A: One_Bit_fullAdder port map(A=>Ain(I), B=>Sum_Connection(I),Cin => Cout_Connection2(I-1), Cout =>Cout_Connection2(I),Sum=>Sum_Connection2(I));
--end generate Full_Adder;

--end generate Subtractor_EightBit2;

--OUTPUT <=Sum_Connection2;
--Cout <=Cout_Connection2(7);
---------------------------------------------
--Adder1: Eight_Bit_Adder port map( A => B_inv, B =>C, OUTPUT =>Adder1_out);
--Adder2: Eight_Bit_Adder port map( A =>Ain, B =>Adder1_out, OUTPUT =>OUTPUT);

end Behavioral;
