library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;


entity PSRModifer is
    Port ( crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRModifer;

architecture arq_PSRModifer of PSRModifer is
signal nzvc_Salida : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal registro1 : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
signal registro2 : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
signal resultadoTemporal : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
begin

	process(crS1, crS2, AluResult, AluOp) begin
		
		
		if((AluOp="001010") or (AluOp="001111")) then --ADDcc - ADDxcc
			nzvc_Salida<="0000";
			nzvc_Salida(3) <= AluResult(31);
			
			if(AluResult=x"00000000") then
				nzvc_Salida(2) <= '1';
			end if;
			
			if((crS1(31)='1' and crS2(31)='1' and AluResult(31)='0') or (crS1(31)='0' and crS2(31)='0' and AluResult(31)='1')) then
				nzvc_Salida(1) <= '1';
			end if;
			
			if((crS1(31)='1' and crS2(31)='1') or (AluResult(31)='0' and (crS1(31)='1' or crS2(31)='1'))) then
				nzvc_Salida(0) <= '1';
			end if;
			
		end if;
		
		if((AluOp="001001") or (AluOp="010000")) then --SUBcc -- SUBXcc
			nzvc_Salida<="0000";
			nzvc_Salida(3) <= AluResult(31);
			
			if(AluResult=x"00000000") then
				nzvc_Salida(2) <= '1';
			end if;
			
			if((crS1(31)='1' and crS2(31)='0' and AluResult(31)='0') or (crS1(31)='0' and crS2(31)='1' and AluResult(31)='1')) then
				nzvc_Salida(1) <= '1';
			end if;
			
			if((crS1(31)='0' and crS2(31)='1') or (AluResult(31)='1' and (crS1(31)='0' or crS2(31)='1'))) then
				nzvc_Salida(0) <= '1';
			end if;
			
		end if;
		
		if((AluOp="010001") or (AluOp="010011") or (AluOp="010010") or (AluOp="010100") or (AluOp="010101") or (AluOp="010110")) then --ANDcc--ANDNcc--ORcc--ORNcc--XORcc-XNORcc
			nzvc_Salida<="0000";
			nzvc_Salida(3) <= AluResult(31);
			
			if(AluResult=x"00000000") then
				nzvc_Salida(2) <= '1';
			end if;
			
		end if;
			
		
	end process;
	nzvc<=nzvc_Salida;

end arq_PSRModifer;

