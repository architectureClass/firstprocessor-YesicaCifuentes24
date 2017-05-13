
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXRFD_TB IS
END MUXRFD_TB;
 
ARCHITECTURE behavior OF MUXRFD_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXRFD
    PORT(
         Rd : IN  std_logic_vector(5 downto 0);
         O7 : IN  std_logic_vector(5 downto 0);
         RFDEST : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rd : std_logic_vector(5 downto 0) := (others => '0');
   signal O7 : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDEST : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXRFD PORT MAP (
          Rd => Rd,
          O7 => O7,
          RFDEST => RFDEST,
          nRD => nRD
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
	Rd <= "000000";
   O7 <= "000000";
   RFDEST <= '0';
      wait for 100 ns;	
		
	Rd <= "100000";
   O7 <= "010000";
   RFDEST <= '1';
		wait for 10 ns;
		
	Rd <= "010010";
   O7 <= "000100";
   RFDEST <= '0';
		wait for 10 ns;
	


      -- insert stimulus here 

      wait;
   end process;

END;
