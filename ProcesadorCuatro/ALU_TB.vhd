LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         CRs1 : IN  std_logic_vector(31 downto 0);
         CRs2 : IN  std_logic_vector(31 downto 0);
			C : in std_Logic;
         ALUOp : IN  std_logic_vector(5 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
	signal C : std_logic := '0';
   signal ALUOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          CRs1 => CRs1,
          CRs2 => CRs2,
			 C=>C,
          ALUOp => ALUOp,
          ALUResult => ALUResult
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		
		CRs1 <= x"0000000F";
		CRs2 <= x"0000008F";
		C<='0';
		ALUOp <= "000000";--AND
		wait for 20 ns;
		
		
		
		CRs1 <= x"0000000F";
		CRs2 <= x"000000AF";
		ALUOp <= "000001";--OR
		wait for 20 ns;
		
		CRs1 <= x"00000009";
		CRs2 <= x"00000005";
		ALUOp <= "000001";--ADD
		wait for 20 ns;
		
		CRs1 <= x"00000009";
		CRs2 <= x"00000005";
		C<='1';
		ALUOp <= "001100";--ADDx
		wait for 20 ns;
		
		CRs1 <= x"00000009";
		CRs2 <= x"00000005";
		ALUOp <= "001000";--SUB
		wait for 20 ns;
		
		CRs1 <= x"00000005";
		CRs2 <= x"00000009";
		ALUOp <= "001000";--SUB
		wait for 20 ns;
		
      wait;
   end process;

END;
