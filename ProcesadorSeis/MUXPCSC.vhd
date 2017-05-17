library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity MUXPCSC is
    Port ( CALL : in  STD_LOGIC_VECTOR (31 downto 0);
           BRANCH : in  STD_LOGIC_VECTOR (31 downto 0);
           nPC : in  STD_LOGIC_VECTOR (31 downto 0);
           JUMP : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSC : in  STD_LOGIC_VECTOR (1 downto 0);
           nPCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXPCSC;

architecture arq_MUXPCSC of MUXPCSC is
signal nPCOut_Aux : std_logic_vector(31 downto 0) := x"00000000";
begin

process (CALL,BRANCH,nPC,JUMP,PCSC) begin
	
	case (PCSC) is 
		when "10" => 
		nPCOut_Aux <= CALL;
		when "11" =>
		nPCOut_Aux <= BRANCH;
		when "00" =>
		nPCOut_Aux <= nPC;
		when "01" =>
		nPCOut_Aux <= JUMP;
		when others => 
			nPCOut_Aux <= nPC;
	end case;
	
end process;
nPCOut <= nPCOut_Aux;

end arq_MUXPCSC;

