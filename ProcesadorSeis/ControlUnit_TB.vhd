
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ControlUnit_TB IS
END ControlUnit_TB;
 
ARCHITECTURE behavior OF ControlUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         Cond : IN  std_logic_vector(3 downto 0);
         AluOp : OUT  std_logic_vector(5 downto 0);
         RFDEST : OUT  std_logic;
         RFSC : OUT  std_logic_vector(1 downto 0);
         WRENMEM : OUT  std_logic;
         wre : OUT  std_logic;
         PCSC : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal Cond : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal AluOp : std_logic_vector(5 downto 0);
   signal RFDEST : std_logic;
   signal RFSC : std_logic_vector(1 downto 0);
   signal WRENMEM : std_logic;
   signal wre : std_logic;
   signal PCSC : std_logic_vector(1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op => op,
          op3 => op3,
          icc => icc,
          Cond => Cond,
          AluOp => AluOp,
          RFDEST => RFDEST,
          RFSC => RFSC,
          WRENMEM => WRENMEM,
          wre => wre,
          PCSC => PCSC
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
		
		op3 <="010101";
		op <= "00"; --- BE -- 
		Cond <= "0001";
		icc <= "0100";
		wait for 20 ns;
		
		op <= "00"; --- BG
		Cond <= "1010";
		icc <= "0000";
		wait for 20 ns;
		
		op <= "00"; --- BGE
		Cond <= "1011";
		icc <= "1000";
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
 