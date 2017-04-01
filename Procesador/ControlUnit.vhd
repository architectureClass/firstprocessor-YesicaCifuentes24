library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture arq_ControlUnit of ControlUnit is

--ALUOp <= "000000";--AND
--ALUOp <= "000001";--OR
--ORN
--ANDN
--ALUOp <= "000010";--XOR
--ALUOp <= "000011";--XNOR



--ALUOp <= "000111";--ADD
--ALUOp <= "001000";--SUB


signal op2 : std_logic_vector (2 downto 0) := "000";
begin
	process(op, op3) begin
		case(op) is
		--	when "00" =>
		--		op2 <=op3(5 downto 3);
		--	if(op2="010") then
		--	ALUOp <="001011";
		--		end if;
		--	when "01" =>
			--	ALUOP<="001001";--CALL
			when "10" =>
				if(op3="000001") then--AND
					ALUOp <= "000000";
				end if;
				if(op3="000010") then--	OR
					ALUOp <= "000001";
				end if;
				if(op3="000011") then--	XOR
					ALUOp <= "000010";
				end if;
				if(op3="000111") then--	XNOR
					ALUOp <= "000011";
				end if;
			--	if(op3="100101") then--	SLL
				--	ALUOp <= "000100";
				--end if;
			--	if(op3="100110") then--	SRL
				--	ALUOp <= "000101";
			--	end if;
			--	if(op3="100110") then--	SRA
				--	ALUOp <= "000110";
				--end if;
				
				if(op3="000000") then--	ADD
					ALUOp <= "000111";
				end if;
				if(op3="000100") then--	SUB
					ALUOp <= "001000";
				end if;
				if(op3="000101") then--	ANDN
					ALUOp <= "001101";
				end if;
					if(op3="000110") then--	ORN
					ALUOp <= "001110";
				end if;
				
			--	if(op3="111000") then--JMPL
			--		ALUOp <= "001010";
			--	end if;
			
			--	if(op3="010100") then--SUBcc
				--	ALUOp <= "001100";
			--	end if;
			

			--when "11" =>
			when others => null;
		end case;
			
	
	
	end process;

end arq_ControlUnit;

