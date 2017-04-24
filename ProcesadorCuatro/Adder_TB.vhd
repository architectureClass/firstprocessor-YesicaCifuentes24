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
 
--	signal dataResult : std_logic_vector(31 downto 0) :=x"00000000";
	--shared variable resultado : std_logic_vector(31 downto 0) := x"00000000";
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
		Op1 <= x"00000001";
		Op2 <= x"00000000";--0
		
      wait for 20 ns;	
		Op2 <= x"00000001";
		
      wait for 20 ns;
		Op2 <= x"00000002";
      wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
