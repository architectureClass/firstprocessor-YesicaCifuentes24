library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Procesador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0);
			  programStateValue : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Procesador;

architecture arq_Procesador of Procesador is

component ProgramCounter
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component Adder
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component InstructionMemory 
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RF 
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in STD_LOGIC ;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ControlUnit 
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component ALU 
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal ProgramState : std_logic_vector(31 downto 0) := (others => '0');
signal ProgramPosition : std_logic_vector(31 downto 0) := (others => '0');
signal NextProgramState : std_logic_vector(31 downto 0) := (others => '0');
signal Instructions : std_logic_vector(31 downto 0) := (others => '0');
signal AluSalida : std_logic_vector(31 downto 0) := (others => '0');
signal Crs1RF : std_logic_vector(31 downto 0) := (others => '0');
signal Crs2RF : std_logic_vector(31 downto 0) := (others => '0');
signal Operation : std_logic_vector(5 downto 0) := (others => '0');

begin
	
ProgramCounter0 : ProgramCounter
	Port map(
		Data => ProgramState,
		rst => reset,
		CLK => clk,
		DataOut =>ProgramPosition
	);
	
NextProgramCounter0 : ProgramCounter
	Port map(
		Data => NextProgramState,
		rst => reset,
		CLK => clk,
		DataOut => ProgramState
	);



Adder0 : Adder
	Port map(
		Op1 =>x"00000001",
		Op2 =>ProgramState,
		DataOut =>NextProgramState
	);

InstructionMemory0 : InstructionMemory
	Port map( 
		Address =>ProgramPosition,
		rst =>reset,
		Instruction => Instructions
	);

RF0 : RF
	Port map(
		rs1 => Instructions(18 downto 14),
		rs2 => Instructions(4 downto 0),
		rd => Instructions(29 downto 25),
		dwr => AluSalida,
		reset => reset,
		crs1 => Crs1RF,
		crs2 => Crs2RF
	);

ControlUnit0 : ControlUnit
	Port map(
		op => Instructions(31 downto 30),
		op3 => Instructions(24 downto 19),
		ALUOp => Operation
	);
	
ALU0 : ALU 
	Port map(
		CRs1 => Crs1RF,
		CRs2 => Crs2RF,
		ALUOp => Operation,
		ALUResult => AluSalida
	);

AluResult <= AluSalida;
programStateValue <= ProgramPosition;
end arq_Procesador;

