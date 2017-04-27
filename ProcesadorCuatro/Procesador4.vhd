library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Procesador4 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador4;

architecture Arq_Procesador4 of Procesador4 is
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

component WindowsManager
	Port (
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
		rd : in  STD_LOGIC_VECTOR (4 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		op3 : in  STD_LOGIC_VECTOR (5 downto 0);
		cwp : in  STD_LOGIC_VECTOR (4 downto 0);
		nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
		nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
		nRd : out  STD_LOGIC_VECTOR (5 downto 0);
		nCwp : out  STD_LOGIC_VECTOR (4 downto 0)
	);
end component;

component RF 
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in STD_LOGIC ;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PSR
	Port ( 
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
		ncwp : in  STD_LOGIC_VECTOR (4 downto 0);
		cwp : out  STD_LOGIC_VECTOR (4 downto 0);
		c : out  STD_LOGIC
	);
end component;


component ControlUnit 
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component PSRModifer
	Port ( 
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;


component ALU 
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  C : in std_Logic;
           ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SEU
	Port ( Imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX
Port ( CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           Operando : out  STD_LOGIC_VECTOR (31 downto 0);
           Isc : in  STD_LOGIC);
end component;



signal ProgramState : std_logic_vector(31 downto 0) := (others => '0');
signal ProgramPosition : std_logic_vector(31 downto 0) := (others => '0');
signal NextProgramState : std_logic_vector(31 downto 0) := (others => '0');
signal Instructions : std_logic_vector(31 downto 0) := (others => '0');
signal AluSalida : std_logic_vector(31 downto 0) := (others => '0');
signal Crs1RF : std_logic_vector(31 downto 0) := (others => '0');
signal Crs2RF : std_logic_vector(31 downto 0) := (others => '0');
signal Operation : std_logic_vector(5 downto 0) := (others => '0');
signal Salida32 : std_logic_vector (31 downto 0) := (others => '0');
signal MuxOut : std_logic_vector (31 downto 0) := (others => '0');
signal cwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
signal nCwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
signal nRs1_Aux : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
signal nRs2_Aux : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
signal nRd_Aux : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
signal nzvc_Aux : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal c_Aux : std_logic := '0';
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

process(clk) begin
	
end process;

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

WindowsManager0 : WindowsManager
	Port map(
		rs1 => Instructions(18 downto 14),
		rs2 => Instructions(4 downto 0),
		rd => Instructions(29 downto 25),
		op => Instructions(31 downto 30),
		op3 => Instructions(24 downto 19),
		cwp => cwp_Aux,
		nRs1 => nRs1_Aux,
		nRs2 => nRs2_Aux,
		nRd => nRd_Aux,
		nCwp => nCwp_Aux
	);

RF0 : RF
	Port map(
		rs1 => nRs1_Aux,
		rs2 => nRs2_Aux,
		rd => nRd_Aux,
		dwr => AluSalida,
		reset => reset,
		crs1 => Crs1RF,
		crs2 => Crs2RF
	);
	
PSR0 : PSR
	Port map( 
		clk =>clk,
		rst => reset,
		nzvc => nzvc_Aux,
		ncwp => nCwp_Aux,
		cwp => cwp_Aux,
		c => c_Aux
	);
	
	
	
SEU0 : SEU
	port map (
		Imm13 => Instructions (12 downto 0),
      ImmOut32 => Salida32
	);

MUX0 : MUX
	 port map (
		CRs2 => Crs2RF,
      Imm32 => Salida32,
      Operando => MuxOut,
      Isc => Instructions (13)
	);
		
ControlUnit0 : ControlUnit
	Port map(
		op => Instructions(31 downto 30),
		op3 => Instructions(24 downto 19),
		ALUOp => Operation
	);
	
PSRModifer0 : PSRModifer
	Port map( 
		crS1 => Crs1RF,
		crS2 => MuxOut,
		AluResult => AluSalida,
		AluOp => Operation,
		nzvc => nzvc_Aux
	);
	
ALU0 : ALU 
	Port map(
		CRs1 => Crs1RF,
		CRs2 => MuxOut,
		C => c_Aux,
		ALUOp => Operation,
		ALUResult => AluSalida
	);

AluResult <= AluSalida;


end Arq_Procesador4;

