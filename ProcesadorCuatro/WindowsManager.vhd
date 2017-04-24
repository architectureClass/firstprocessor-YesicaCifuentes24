
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0);
			  nCwp : out  STD_LOGIC_VECTOR (4 downto 0));
end WindowsManager;

architecture arq_WindowsManager of WindowsManager is
signal nCwp_Aux : STD_LOGIC_VECTOR (4 downto 0) :="00000";
signal nRs1_Aux : STD_LOGIC_VECTOR (5 downto 0) :="000000";
signal nRs2_Aux : STD_LOGIC_VECTOR (5 downto 0) :="000000";
signal nRd_Aux : STD_LOGIC_VECTOR (5 downto 0) :="000000";


begin
	process(rs1, rs2, rd, op, op3) begin
		
		if(rs1>=24 and rs1<=31) then--valores de entrada
			nRs1_Aux<=rs1-(cwp*16);
		end if;
		
		if((rs1>=16 and rs1<=23) or (rs1>=8 and rs1<=15)) then--valores locales - valores de salida
			nRs1_Aux<=rs1+(cwp*16);
		end if;

		if(rs2>=24 and rs2<=31) then--valores de entrada
			nRs2_Aux<=rs2-(cwp*16);
		end if;
		
		if((rs2>=16 and rs2<=23) or (rs1>=8 and rs1<=15)) then--valores locales - valores de salida
			nRs2_Aux<=rs2+(cwp*16);
		end if;
		
		if(op="10") then
			if(op3="111100") then--SAVE
				if(cwp=1) then
					nCwp_Aux <= cwp-1;
				end if;
			end if;
			if(op3="111101") then
				if(cwp=0) then
					nCwp_Aux <= cwp+1;
				end if;
			end if;
		end if;
		

		if(rd>=24 and rd<=31) then--valores de entrada
			nRd_Aux<=rd-(cwp*16);
		end if;
		
		if((rd>=16 and rd<=23) or (rd>=8 and rd<=15)) then--valores locales - valores de salida
			nRd_Aux<=rd+(cwp*16);
		end if;
		

	end process;
	
end arq_WindowsManager;

