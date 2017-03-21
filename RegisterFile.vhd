library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity RF is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in STD_LOGIC ;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is

type reg is array (0 to 31) of std_logic_vector (31 downto 0);
 
--signal myReg : reg :=(x"00000000", x"00000000", x"00000000", x"00000000",
--							 x"00000001", x"00000002", x"00000003", x"00000000",
--							 x"00000000", x"00000000", x"00000000", x"00000000",
--							 x"00000000", x"00000000", x"00000011", x"FFFFFFF7",
--							 x"0000000E", x"00000009", x"00000000", x"00000000",
--							 x"00000008", x"00000000", x"00000000", x"00000000",
--							 x"00000000", x"00000000", x"00000000", x"00000000",
--							 x"00000000", x"00000000", x"00000000", x"00000000");

signal myReg : reg := (others => x"00000000");

begin

process(rs1,rs2,rd,dwr, reset)
	begin 
	
		myReg(0) <= x"00000000";
		
		if reset = '0' then
			if(rd/="00000")then
				Myreg(conv_integer(rd)) <= dwr; 
			end if;
			crs1 <= Myreg(conv_integer(rs1));
			crs2 <= Myreg(conv_integer(rs2));
		else --inicializaciones
			crs1 <= (others => '0');
			crs2 <= (others => '0');
	--		myReg(16) <= x"00000011";
	--		myReg(17) <= x"FFFFFFF7";
	--		myReg(18) <= x"0000000E";
		end if;
	end process;

end Behavioral;