
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUXRFSC is
    Port ( DataMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSC : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXRFSC;

architecture arq_MUXRFSC of MUXRFSC is
--signal DWR_Aux : std_logic_vector(31 downto 0) := 
begin
	process (DataMem,AluResult,PC,RFSC) begin
		case (RFSC) is 
		when "11" => 
		DWR <= DataMem;
		when "00" =>
		DWR <= AluResult;
		when "01" =>
		DWR <= PC;
		when others => 
			DWR <= AluResult;
	end case;
	
end process;
		


end arq_MUXRFSC;

