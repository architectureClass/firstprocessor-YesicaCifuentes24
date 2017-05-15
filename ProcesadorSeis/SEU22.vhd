
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEU22 is
    Port ( Imm22 : in  STD_LOGIC_VECTOR (21 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU22;

architecture Behavioral of SEU22 is

signal result : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";


begin

	process (Imm22) begin
		if (imm22(21)='1') then
			result(31 downto 22) <= (others =>  '1');
			else 
				result(31 downto 22) <= (others =>  '0');
		end if;
		result (21 downto 0) <= Imm22;
	end process;
	ImmOut32 <= result;

end Behavioral;


