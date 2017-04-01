library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Adder is
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is

--signal constante: std_logic_vector(31 downto 0):= "00000000000000000000000000000100";
--signal aux: std_logic_vector(31 downto 0):=(others=>'0');

begin
	process (Op2, Op1)
		begin
			DataOut<=Op2+Op1;
	end process;

end Behavioral;