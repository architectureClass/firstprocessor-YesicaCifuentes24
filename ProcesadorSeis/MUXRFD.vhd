
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXRFD is
    Port ( Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           O7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end MUXRFD;

architecture Behavioral of MUXRFD is

begin
	process (Rd,O7,RFDEST) begin
		
		case (RFDEST) is 
		when '0' => 
		nRD <= Rd;
		when '1' =>
		nRD <= O7;
		when others => 
			nRD <= Rd;
	end case;
	
end process;

end Behavioral;





