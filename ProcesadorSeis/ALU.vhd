library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  C : in std_Logic;
           ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is
--signal i : std_logic := '0';
signal result : std_logic_vector (31 downto 0) := x"00000000";
begin
	process(CRs1, CRs2, ALUOP, C) begin
		case(ALUOp) is
			when "000000" =>--AND
				result <= CRs1 and CRs2;
			when "000001" =>--OR
				result <= CRs1 or CRs2;
			when "000010" => --XOR
				result <= CRs1 xor CRs2;
			when "000011" =>--XNOR
				result <= CRs1 xnor CRs2;
				
			when "000111" => --ADD
				result <= CRs1 + CRs2;
			when "001000" =>--SUB
				result <= CRs1-CRs2;
			
			
			when "001001" => --SUBcc
				result <= CRs1 -CRs2;
			when "001010" => --ADDcc
				result <= CRs1 + CRs2;
			when "001011" => --SUBx
				result <= CRs1 - CRs2 - C;
			when "001100" => --ADDx
				result <= CRs1 + CRs2 + C;
			when "001101" => --ANDN
				result <= CRs1 and not (CRs2);
			when "001110" => --ORN
				result <= CRs1 or not (CRs2);
			when "001111" => --ADDxcc
				result <= CRs1 + CRs2 + C;
			when "010000" => --SUBxcc
				result <= CRs1 - CRs2 - C;
			when "010001" => --ANDcc
				result <= CRs1 and CRs2;
			when "010010" => --ORcc
				result <= CRs1 or CRs2;
			when "010011" => --ANDNcc
				result <= CRs1 and not(CRs2);
			when "010100" => --ORNcc
				result <= CRs1 or not(CRs2);
			when "010101" => --XORcc
				result <= CRs1 xor CRs2;
			when "010110" => --XNORcc
				result <= CRs1 xnor CRs2;
			when "010111" => --sll
				result <= to_stdlogicvector(to_bitvector(CRs1) sll conv_integer(CRs2));
			when "011000" => --srl
				result <= to_stdlogicvector(to_bitvector(CRs1) sll conv_integer(CRs2));
			
			
			when "011001" => --save
				result <= CRs1 + CRs2;
			
			when "011010" => --restore
				result <= CRs1 + CRs2;
			
			when "011011" => -- jmpl
				result <= CRs1 + CRs2;
				
			when "011101" => --st
				result <= CRs1 + CRs2;
			when "011100" => --ld
				result <= CRs1 + CRs2;
			
			when others => 
			result <= x"00000000";
		end case;
	end process;
	AluResult <= result;
end arq_ALU;

