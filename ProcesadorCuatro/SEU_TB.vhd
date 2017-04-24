
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY SEU_TB IS
END SEU_TB;
 
ARCHITECTURE behavior OF SEU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         Imm13 : IN  std_logic_vector(12 downto 0);
         ImmOut32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal ImmOut32 : std_logic_vector(31 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          Imm13 => Imm13,
          ImmOut32 => ImmOut32
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		Imm13 <= "1000010001000";
		
		wait for 20 ns;
		
		Imm13 <= "0000010001000";
     
	   wait for 20 ns;
		
		Imm13 <= "0100010001000";
     

      -- insert stimulus here 

      wait;
   end process;

END;
