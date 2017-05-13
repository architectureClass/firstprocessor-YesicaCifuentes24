LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PSRModifier_TB IS
END PSRModifier_TB;
 
ARCHITECTURE behavior OF PSRModifier_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRModifer
    PORT(
         crS1 : IN  std_logic_vector(31 downto 0);
         crS2 : IN  std_logic_vector(31 downto 0);
         AluResult : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRModifer PORT MAP (
          crS1 => crS1,
          crS2 => crS2,
          AluResult => AluResult,
          AluOp => AluOp,
          nzvc => nzvc
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		crS1 <= x"F0000000";
		crS2 <= x"F0000000";
		AluResult <= x"F0000000";
		AluOp <= "000000";
		
		wait for 20 ns;
		crS1 <= x"F0000003";
		crS2 <= x"F0000009";
		AluResult <= x"00000003";
		AluOp <= "001001";--SUBcc
		
		wait for 20 ns;
		crS1 <= x"A0000002";
		crS2 <= x"0000000F";
		AluResult <= x"00000020";
		AluOp <= "001001";--SUBcc
		wait for 20 ns;
		
		wait for 20 ns;
		crS1 <= x"0000000B";
		crS2 <= x"F0000003";
		AluResult <= x"00000020";
		AluOp <= "001001";--SUBcc
		wait for 20 ns;
		
		wait for 20 ns;
		crS1 <= x"A000002A";
		crS2 <= x"B000003B";
		AluResult <= x"A0000022";
		AluOp <= "001001";--SUBcc
		wait for 20 ns;
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
