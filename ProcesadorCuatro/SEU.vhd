
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SEU is
    Port ( Imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arq_SEU of SEU is
signal result : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";


begin

	process (Imm13) begin
		if (imm13(12)='1') then
			result(31 downto 13) <= (others =>  '1');
			else 
				result(31 downto 13) <= (others =>  '0');
		end if;
		result (12 downto 0) <= Imm13;
	end process;
	ImmOut32 <= result;

end arq_SEU;

