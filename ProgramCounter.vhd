Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

process(CLK, rst) begin 
	if(rst = '1') then 
		DataOut <= (others => '0');
	elsif(rising_edge(CLK)) then
		DataOut <= Data;
	end if;

end process;

end Behavioral;
