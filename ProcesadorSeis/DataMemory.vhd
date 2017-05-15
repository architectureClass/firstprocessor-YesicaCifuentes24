library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity DataMemory is
    Port ( cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WRENMEM : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           DataMem : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type reg is array (0 to 519) of std_logic_vector (31 downto 0);
signal myReg : reg := (others => x"00000000");
signal Aux_DataMem: std_logic_vector (31 downto 0) := x"00000000";

begin

process(cRD,AluResult,Reset,WRENMEM) begin
	if (Reset = '1') then
		myReg <= (others => x"00000000");
	else 
		if (WRENMEM = '1' and 520>AluResult) then
			myReg(conv_integer(AluResult)) <= cRD;
		end if;
		if(520>AluResult) then
			Aux_DataMem <= myReg(conv_integer(AluResult));
		end if;
	end if;
end process;

DataMem <= Aux_DataMem;

end Behavioral;

