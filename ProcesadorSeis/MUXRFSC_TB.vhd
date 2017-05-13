LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUXRFSC_TB IS
END MUXRFSC_TB;
 
ARCHITECTURE behavior OF MUXRFSC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXRFSC
    PORT(
         DataMem : IN  std_logic_vector(31 downto 0);
         AluResult : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         RFSC : IN  std_logic_vector(1 downto 0);
         DWR : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DataMem : std_logic_vector(31 downto 0) := (others => '0');
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal RFSC : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal DWR : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXRFSC PORT MAP (
          DataMem => DataMem,
          AluResult => AluResult,
          PC => PC,
          RFSC => RFSC,
          DWR => DWR
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
	DataMem <= x"00000000";
   AluResult <= x"00000000";
   PC <= x"00000000";
   RFSC <= "00";  
      wait for 100 ns;	
		
	DataMem <= x"00000100";
   AluResult <= x"00803000";
   PC <= x"00F09000";
   RFSC <= "00"; 
		wait for 10 ns;
		
	DataMem <= x"000A0100";
   AluResult <= x"0000300D";
   PC <= x"00E09000";
   RFSC <= "01"; 
		wait for 10 ns;
		
	DataMem <= x"0A000100";
   AluResult <= x"008A3000";
   PC <= x"00F09000";
   RFSC <= "10"; 
		wait for 10 ns;
		
	DataMem <= x"00A00100";
   AluResult <= x"008030B0";
   PC <= x"00F08500";
   RFSC <= "11";
		wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
