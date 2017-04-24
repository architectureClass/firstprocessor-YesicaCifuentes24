library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity RF is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in STD_LOGIC ;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture arq_RF of RF is

type reg is array (0 to 519) of std_logic_vector (31 downto 0);
 
 impure function InitRomFromFile (RomFileName : in string) return reg is
	FILE RomFile : text open read_mode is RomFileName;
	variable RomFileLine : line;
	variable temp_bv : bit_vector(31 downto 0);
	variable temp_mem : reg;
	begin
		for I in reg'range loop
			readline (RomFile, RomFileLine);
			read(RomFileLine, temp_bv);
			temp_mem(i) := to_stdlogicvector(temp_bv);
		end loop;
	return temp_mem;
end function;

signal myReg : reg := InitRomFromFile("valores.txt");

begin

process(rs1,rs2,rd,dwr, reset)
	begin 	
		myReg(0) <= x"00000000";--garantiza g0
		if reset = '0' then
			if(rd/="00000")then
				Myreg(conv_integer(rd)) <= dwr; 
			end if;
			crs1 <= Myreg(conv_integer(rs1));
			crs2 <= Myreg(conv_integer(rs2));
		else --inicializaciones
			crs1 <= (others => '0');
			crs2 <= (others => '0');
		end if;
	end process;

end arq_RF;