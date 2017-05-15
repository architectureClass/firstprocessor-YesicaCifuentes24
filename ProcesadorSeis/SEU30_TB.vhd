
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEU30_TB IS
END SEU30_TB;
 
ARCHITECTURE behavior OF SEU30_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU30
    PORT(
         Imm30 : IN  std_logic_vector(29 downto 0);
         ImmOut32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm30 : std_logic_vector(29 downto 0) := (others => '0');

 	--Outputs
   signal ImmOut32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU30 PORT MAP (
          Imm30 => Imm30,
          ImmOut32 => ImmOut32
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      Imm30 <= "000000000000000000000000000000";
      wait for 100 ns;	
		
		Imm30 <= "000001000000000001000000000000";
		wait for 10 ns;
		Imm30 <= "100000000000000000000000000000";
		wait for 10 ns;
		Imm30 <= "010000000000000000000100000000";
		wait for 10 ns;
      wait;
   end process;

END;
