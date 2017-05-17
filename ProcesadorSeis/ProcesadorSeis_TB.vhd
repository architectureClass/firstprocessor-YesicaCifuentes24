LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY ProcesadorSeis_TB IS
END ProcesadorSeis_TB;
 
ARCHITECTURE behavior OF ProcesadorSeis_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcesadorSeis
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcesadorSeis PORT MAP (
          clk => clk,
          reset => reset,
          Result => Result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
	reset <= '0';		


      -- insert stimulus here 

      wait;
   end process;

END;
