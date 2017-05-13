library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX is
    Port ( CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           Operando : out  STD_LOGIC_VECTOR (31 downto 0);
           Isc : in  STD_LOGIC);
end MUX;

architecture arq_MUX of MUX is
 
signal OperandoOut : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

begin

process (CRs2,Imm32,Isc) begin
	
	case (Isc) is 
		when '0' => 
		Operando <= CRs2;
		when '1' =>
		Operando <= Imm32;
		when others => null;
	end case;
	
end process;

end arq_MUX;

