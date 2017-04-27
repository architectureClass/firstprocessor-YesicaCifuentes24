library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture arq_ControlUnit of ControlUnit is

--result <= "000000";--AND
--result <= "000001";--OR
--result <= "000010";--XOR
--result <= "000011";--XNOR
--result <= "000111";--ADD
--result <= "001000";--SUB

--result <= "001001";--SUBcc
--result <= "001010";--ADDcc
--result <= "001011";--SUBX
--result <= "001100";--ADDx
--result <= "001101";--ANDN
--result <= "001110";--ORN
--result <= "001111";--ADDxcc
--result <= "010000";--SUBxcc
--result <= "010001";--ANDcc
--result <= "010010";--ORcc
--result <= "010011";--ANDNcc
--result <= "010100";--ORNcc
--result <= "010101";--XORcc
--result <= "010110";--XNORcc
--result <= "010111";--sll
--result <= "011000";--srl
--result <= "011001";--save
--result <= "011010";--restore



--signal op2 : std_logic_vector (2 downto 0) := "000";
signal result : std_logic_vector (5 downto 0) := "111111";
begin
	process(op, op3) begin
		case(op) is
		
			when "10" =>
				if(op3="000001") then--AND
					result <= "000000";
				end if;
				if(op3="000010") then--	OR
					result <= "000001";
				end if;
				if(op3="000011") then--	XOR
					result <= "000010";
				end if;
				if(op3="000111") then--	XNOR
					result <= "000011";
				end if;
			
				
				if(op3="000000") then--	ADD
					result <= "000111";
				end if;
				if(op3="000100") then--	SUB
					result <= "001000";
				end if;
				if(op3="000101") then--	ANDN
					result <= "001101";
				end if;
					if(op3="000110") then--	ORN
					result <= "001110";
				end if;
				
			
				--instrucciones con Conditional Codes
				if(op3="010100") then--SUBcc
					result <= "001001";
				end if;
				if(op3="010000") then--ADDcc
					result <= "001010";
				end if;
				if(op3="010001") then--ANDcc
					result <= "010001";
				end if;
				if(op3="010010") then--ORcc
					result <= "010010";
				end if;
				if(op3="010101") then--ANDNcc
					result <= "010011";
				end if;
				if(op3="010110") then--ORNcc
					result <= "010100";
				end if;
				if(op3="010011") then--XORcc
					result <= "010101";
				end if;
				
				if(op3="010111") then--XNORcc
					result <= "010110";
				end if;
				
				
				--instrucciones con Carry
				if(op3="001100") then--SUBX
					result <= "001011";
				end if;
				if(op3="001000") then--ADDX
					result <= "001100";
				end if;
				
				--instrucciones con carry y Conditional Codes
				if(op3="011000") then--ADDxcc
					result <= "001111";
				end if;
				
				if(op3="011100") then--SUBxcc
					result <= "010000";
				end if;
				
				--instrucciones con
				
				if(op3="100101") then--sll
					result <= "010111";
				end if;
				
				if(op3="100110") then--slr
					result <= "011000";
				end if; 
			--- instrucciones save y restore
			if(op3="111100") then--save
					result <= "011001";
				end if; 
			if(op3="111101") then--restore
					result <= "011010";
				end if; 
		
			--when "11" =>
			when others => result <= "111111";
		end case;
	
	
	end process;

aluop <= result;

end arq_ControlUnit;

