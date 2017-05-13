LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PSR_TB IS
END PSR_TB;
 
ARCHITECTURE behavior OF PSR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         ncwp : IN  std_logic_vector(4 downto 0);
         cwp : OUT  std_logic_vector(4 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal ncwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal cwp : std_logic_vector(4 downto 0);
   signal c : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          rst => rst,
          nzvc => nzvc,
          ncwp => ncwp,
          cwp => cwp,
          c => c
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
      -- hold reset state for 100 ns.
		rst <='1';
      wait for 100 ns;	
		rst <='0';
		
		nzvc <="0001";
		ncwp <="00001";
		
		wait for 11 ns;
		nzvc <="0110";
		ncwp <="00000";
		
		wait for 10 ns;
		nzvc <="1100";
		ncwp <="00000";
      -- insert stimulus here 

      wait;
   end process;

END;
