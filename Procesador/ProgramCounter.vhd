Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture arq_ProgramCounter of ProgramCounter is

signal DataValue : std_logic_vector(31 downto 0) := x"00000000";

begin

process(CLK, rst) begin 
	if(rst = '1') then 
		DataValue <= (others => '0');
	elsif(rising_edge(CLK)) then
		DataValue <= Data;
	end if;

end process;

DataOut <= DataValue;

end arq_ProgramCounter;
