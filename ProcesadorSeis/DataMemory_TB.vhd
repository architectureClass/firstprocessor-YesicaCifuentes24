
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY DataMemory_TB IS
END DataMemory_TB;
 
ARCHITECTURE behavior OF DataMemory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         cRD : IN  std_logic_vector(31 downto 0);
         AluResult : IN  std_logic_vector(31 downto 0);
         WRENMEM : IN  std_logic;
         Reset : IN  std_logic;
         DataMem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cRD : std_logic_vector(31 downto 0) := (others => '0');
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal WRENMEM : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal DataMem : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          cRD => cRD,
          AluResult => AluResult,
          WRENMEM => WRENMEM,
          Reset => Reset,
          DataMem => DataMem
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		cRD <= x"00000000";
		AluResult <= x"00000000";
		WRENMEM <= '0';
		Reset <='1';
      wait for 100 ns;	
		Reset <='0';
		
		cRD <= x"000F0A00";
		AluResult <= x"00000005";
		WRENMEM <= '1';
      
		wait for 20 ns;
		
		cRD <= x"000F0F0A";
		AluResult <= x"0000000F";
		WRENMEM <= '1';
		
		wait for 20 ns;
		
		cRD <= x"0AF00F00";
		AluResult <= x"00000005";
		WRENMEM <= '0';
		
		wait for 20 ns;
		cRD <= x"0000FAF0";
		AluResult <= x"0000000F";
		WRENMEM <= '0';
		
		wait for 20 ns;
		cRD <= x"0AF00F00";
		AluResult <= x"00000005";
		WRENMEM <= '0';
		
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
