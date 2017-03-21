LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ProgramCounter_TB IS
END ProgramCounter_TB;
 
ARCHITECTURE behavior OF ProgramCounter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         Data : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         CLK : IN  std_logic;
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          Data => Data,
          rst => rst,
          CLK => CLK,
          DataOut => DataOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
	
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Data <= "01000000000000000000000000110111";
      wait for 100 ns;
		rst <= '1';
      wait for CLK_period*10;
		rst <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
