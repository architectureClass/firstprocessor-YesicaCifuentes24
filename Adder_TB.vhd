LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY Adder_TB IS
END Adder_TB;
 
ARCHITECTURE behavior OF Adder_TB IS 
 
    COMPONENT Adder
    PORT(
         Op1 : IN  std_logic_vector(31 downto 0);
         Op2 : IN  std_logic_vector(31 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          DataOut => DataOut
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		Op1 <= "01000000000000000000000000110111";
		Op2 <= "00000000000000000000000000000001";
      wait for 100 ns;	
		Op2 <= "01000000000000000000000000110111";
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
