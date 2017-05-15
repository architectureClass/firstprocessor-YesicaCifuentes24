
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY SEU22_TB IS
END SEU22_TB;
 
ARCHITECTURE behavior OF SEU22_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU22
    PORT(
         Imm22 : IN  std_logic_vector(21 downto 0);
         ImmOut32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal ImmOut32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU22 PORT MAP (
          Imm22 => Imm22,
          ImmOut32 => ImmOut32
        );

   
   -- Stimulus process
   stim_proc: process
   begin	
      Imm22 <= "0000000000000000000000";
      wait for 100 ns;	
		
		Imm22 <= "0000010000000000010000";
		wait for 10 ns;
		Imm22 <= "1000000000000000000000";
		wait for 10 ns;
		Imm22 <= "0100000000000000000001";
		wait for 10 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
