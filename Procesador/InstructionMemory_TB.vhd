LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY InstructionMemory_TB IS
END InstructionMemory_TB;
 
ARCHITECTURE behavior OF InstructionMemory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          Address => Address,
          rst => rst,
          Instruction => Instruction
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Address <= x"00000000";
		rst <='0';
		
		wait for 20 ns;
		Address <= x"00000001";
		rst <='0';
		
		wait for 20 ns;
		Address <= x"00000002";
		rst <='0';
		
		wait for 5 ns;
		rst <='1';
		
		wait for 5 ns;
		rst <= '0';
		wait for 10 ns;
		
		Address <= x"00000000";
		rst <='0';
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
