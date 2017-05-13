
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY MUX_TB IS
END MUX_TB;
 
ARCHITECTURE behavior OF MUX_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         CRs2 : IN  std_logic_vector(31 downto 0);
         Imm32 : IN  std_logic_vector(31 downto 0);
         Operando : OUT  std_logic_vector(31 downto 0);
         Isc : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Imm32 : std_logic_vector(31 downto 0) := (others => '0');
   signal Isc : std_logic := '0';

 	--Outputs
   signal Operando : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          CRs2 => CRs2,
          Imm32 => Imm32,
          Operando => Operando,
          Isc => Isc
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	CRs2 <= x"00005000";
	Imm32 <= x"00000004";
	Isc <= '1';
	 wait for 10 ns;
	CRs2 <= x"00005000";
	Imm32 <= x"00000004";
	Isc <= '0';
	
	

      -- insert stimulus here 

      wait;
   end process;

END;
