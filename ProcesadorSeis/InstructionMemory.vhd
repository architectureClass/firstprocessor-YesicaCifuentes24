library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity InstructionMemory is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture arq_InstructionMemory of InstructionMemory is

type instructions is array (0 to 100) of std_logic_vector (31 downto 0);

impure function InitRomFromFile (RomFileName : in string) return instructions is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : instructions;
		begin
			for I in instructions'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
end function;

signal myInstructions : instructions := InitRomFromFile("dato.txt");

begin
	process(Address, rst) begin
		if(rst='1') then
			Instruction <=(others => '0');--x"00000000";
		else
			Instruction <=myInstructions(conv_integer(Address));
		end if;
	end process;
end arq_InstructionMemory;

