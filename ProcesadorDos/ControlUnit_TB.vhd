LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY ControlUnit_TB IS
END ControlUnit_TB;
 
ARCHITECTURE behavior OF ControlUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         ALUOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOp : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op => op,
          op3 => op3,
          ALUOp => ALUOp
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		op <= "10";
		op3 <="000000";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000001";--AND--ALUOp <= "000000";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000010";--OR--ALUOp <= "000001";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000011";--XOR--ALUOp <= "000010";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000111";--XNOR--ALUOp <= "000011";
		wait for 20 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
