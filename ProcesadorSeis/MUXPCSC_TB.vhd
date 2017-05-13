
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXPCSC_TB IS
END MUXPCSC_TB;
 
ARCHITECTURE behavior OF MUXPCSC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXPCSC
    PORT(
         CALL : IN  std_logic_vector(31 downto 0);
         BRANCH : IN  std_logic_vector(31 downto 0);
         nPC : IN  std_logic_vector(31 downto 0);
         JUMP : IN  std_logic_vector(31 downto 0);
         PCSC : IN  std_logic_vector(1 downto 0);
         nPCOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CALL : std_logic_vector(31 downto 0) := (others => '0');
   signal BRANCH : std_logic_vector(31 downto 0) := (others => '0');
   signal nPC : std_logic_vector(31 downto 0) := (others => '0');
   signal JUMP : std_logic_vector(31 downto 0) := (others => '0');
   signal PCSC : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal nPCOut : std_logic_vector(31 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXPCSC PORT MAP (
          CALL => CALL,
          BRANCH => BRANCH,
          nPC => nPC,
          JUMP => JUMP,
          PCSC => PCSC,
          nPCOut => nPCOut
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
   CALL <= x"00000000";
   BRANCH <= x"00000000";
   nPC <= x"00000000";
   JUMP <= x"00000000";
   PCSC <= "00";
      wait for 100 ns;	
		
	CALL <= x"0000F000";
   BRANCH <= x"A0000000";
   nPC <= x"0000E000";
   JUMP <= x"00070000";
   PCSC <= "00";
		wait for 10 ns;
		
	CALL <= x"00004000";
   BRANCH <= x"80000000";
   nPC <= x"0000E000";
   JUMP <= x"00070000";
   PCSC <= "01";
		wait for 10 ns;
		
	CALL <= x"00003000";
   BRANCH <= x"70000000";
   nPC <= x"00005000";
   JUMP <= x"00090000";
   PCSC <= "10";
		wait for 10 ns;
	
	CALL <= x"00000020";
   BRANCH <= x"00500000";
   nPC <= x"00000000";
   JUMP <= x"00000040";
   PCSC <= "11";
		wait for 10 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
