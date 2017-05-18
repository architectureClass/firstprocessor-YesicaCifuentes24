
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXRFD is
    Port ( Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           O7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end MUXRFD;

architecture Behavioral of MUXRFD is
signal nRD_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
begin
	process (Rd,O7,RFDEST) begin
		
		case (RFDEST) is 
		when '0' => 
		nRD_Aux <= Rd;
		when '1' =>
		nRD_Aux <= O7;
		when others => 
			nRD_Aux <= Rd;
	end case;
	
end process;

nRD <= nRD_Aux;

end Behavioral;





