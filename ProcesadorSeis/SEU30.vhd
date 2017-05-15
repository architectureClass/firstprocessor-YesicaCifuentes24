library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEU30 is
    Port ( Imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU30;

architecture Behavioral of SEU30 is

signal result : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";


begin

	process (Imm30) begin
		if (imm30(29)='1') then
			result(31 downto 30) <= (others =>  '1');
			else 
				result(31 downto 30) <= (others =>  '0');
		end if;
		result (29 downto 0) <= Imm30;
	end process;
	ImmOut32 <= result;

end Behavioral;

