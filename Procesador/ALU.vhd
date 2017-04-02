library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is
--signal i : std_logic := '0';
signal result : std_logic_vector (31 downto 0) := x"00000000";
begin
	process(CRs1, CRs2, ALUOP) begin
		case(ALUOp) is
			when "000000" =>--AND
				result <= CRs1 and CRs2;
			when "000001" =>--OR
				result <= CRs1 or CRs2;
			when "000010" =>
				result <= CRs1 xor CRs2;
			when "000011" =>
				result <= CRs1 xnor CRs2;
				
			when "000111" =>
				result <= CRs1 + CRs2;
				
			when "001000" =>
				result <= CRs1-CRs2;
			when "001101" =>
				result <= CRs1 and not (CRs2);
			when "001110" =>
				
				result <= CRs1 or not (CRs2);
			
			when others => 
			result <= x"00000000";
		end case;
	end process;
	AluResult <= result;
end arq_ALU;

