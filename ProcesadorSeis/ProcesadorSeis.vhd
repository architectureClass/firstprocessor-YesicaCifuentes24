
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProcesadorSeis is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorSeis;

architecture Behavioral of ProcesadorSeis is

component ProgramCounter
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
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

component SEU22
    Port ( Imm22 : in  STD_LOGIC_VECTOR (21 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SEU30
    Port ( Imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component WindowsManager
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0);
			  nCwp : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component PSR
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : out  STD_LOGIC_VECTOR (4 downto 0);
           c : out  STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUXRFD
    Port ( Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           O7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end component;


component RF
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in STD_LOGIC ;
			  wre : in STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  cRd : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component SEU
    Port ( Imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           ImmOut32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component ControlUnit
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  icc : in STD_LOGIC_VECTOR (3 downto 0);
			  Cond : in STD_LOGIC_VECTOR (3 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0);
			  RFDEST : out STD_LOGIC;
			  RFSC : out STD_LOGIC_VECTOR(1 downto 0);
			  WRENMEM : out STD_LOGIC;
			  wre : out STD_LOGIC;
			  PCSC : out STD_LOGIC_VECTOR(1 downto 0));
end component;

component MUX
    Port ( CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           Operando : out  STD_LOGIC_VECTOR (31 downto 0);
           Isc : in  STD_LOGIC);
end component;

component ALU
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  C : in std_Logic;
           ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PSRModifer
    Port ( crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUXPCSC
    Port ( CALL : in  STD_LOGIC_VECTOR (31 downto 0);
           BRANCH : in  STD_LOGIC_VECTOR (31 downto 0);
           nPC : in  STD_LOGIC_VECTOR (31 downto 0);
           JUMP : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSC : in  STD_LOGIC_VECTOR (1 downto 0);
           nPCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DataMemory
    Port ( cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WRENMEM : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           DataMem : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUXRFSC
    Port ( DataMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSC : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal NextPc : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal PcMux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal PcAdress : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal instructionMemory_Out : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal AdderNextPc : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal AdderBranch : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal AdderCall : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal SEU22_Out : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal SEU30_Out : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal cwp_Out : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal nCwp_Out : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal nRs1_Out : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRs2_Out : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRd_Out : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nzvc_Out : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal c_Out : STD_LOGIC := '0';
signal icc_Out : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal RFDEST_Out : STD_LOGIC := '0';
signal nRDMux_out :STD_LOGIC_VECTOR (5 downto 0) := "000000";

signal dwr_Out :STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal wre_Out : STD_LOGIC := '0';
signal crs1_Out :STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal crs2_Out :STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal crd_Out :STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

signal SEU_Out :STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal AluOp_Out : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal RFSC_out : STD_LOGIC_VECTOR (1 downto 0) := "00";

signal WRENMEM_Out : STD_LOGIC := '0';
signal PCSC_out : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal Operando_Out : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

signal AluResult_Out : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

signal DataMem_Out : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";



--signal 


begin

NextProgramCounter0 : ProgramCounter
    Port map( Data => PcMux,
           rst => reset,
           CLK => clk,
           DataOut => NextPc);
			  
ProgramCounter0 : ProgramCounter
    Port map( Data => NextPc,
           rst => reset,
           CLK => clk,
           DataOut => PcAdress);

AdderNextPc0 : Adder
    Port map( Op1 => x"00000001",
           Op2 => NextPc,
           DataOut => AdderNextPc);

 
InstructionMemory0: InstructionMemory
    Port map( Address => PcAdress,
           rst => reset,
           Instruction => instructionMemory_Out);



SEU220 : SEU22
    Port map( Imm22 =>instructionMemory_Out(21 downto 0),
           ImmOut32 => SEU22_Out);

SEU300 : SEU30
    Port map( Imm30 =>instructionMemory_Out(29 downto 0),
           ImmOut32 => SEU30_Out);

AdderBranch0 : Adder
    Port map( Op1 => SEU22_Out,
           Op2 => NextPc,
           DataOut => AdderBranch);

AdderCall0 : Adder
    Port map( Op1 => SEU30_Out,
           Op2 => NextPc,
           DataOut => AdderCall);
			  
WindowsManager0 : WindowsManager
    Port map( rs1 => instructionMemory_Out(18 downto 14),
			  rs2 => instructionMemory_Out(4 downto 0),
			  rd => instructionMemory_Out(29 downto 25),
			  op => instructionMemory_Out(31 downto 30),
			  op3 => instructionMemory_Out(24 downto 19),
           cwp => cwp_Out,
           nRs1 => nRs1_Out,
           nRs2 => nRs2_Out,
           nRd => nRd_Out,
			  nCwp => nCwp_Out);
	
PSR0: PSR
    Port map( clk => clk,
            rst => reset,
           nzvc => nzvc_Out,
           ncwp => nCwp_Out,
           cwp => cwp_Out,
           c => c_Out,
			  icc => icc_Out); 

 MUXRFD0 : MUXRFD
    Port map ( Rd =>  nRd_Out,
           O7 => "001111",
           RFDEST => RFDEST_Out,
           nRD => nRDMux_out);
			  

RF0 : RF
    Port map ( rs1 => nRs1_Out,
           rs2 => nRs2_Out,
           rd => nRDMux_out,
			  dwr => dwr_Out,
			  reset => reset,
			  wre => wre_Out,
           crs1 => crs1_Out,
           crs2 => crs2_Out,
			  cRd => crd_Out);
			  
SEU0 : SEU
    Port map( Imm13 => instructionMemory_Out(12 downto 0),
           ImmOut32 => SEU_Out );  

ControlUnit0 : ControlUnit
    Port map( op => instructionMemory_Out(31 downto 30),
           op3 => instructionMemory_Out(24 downto 19),
			  icc => icc_Out,
			  Cond => instructionMemory_Out(28 downto 25),
           AluOp => AluOp_Out,
			  RFDEST => RFDEST_Out,
			  RFSC => RFSC_out,
			  WRENMEM => WRENMEM_Out,
			  wre => wre_Out,
			  PCSC => PCSC_out);

MUX0 : MUX
    Port map( CRs2 => crs2_Out,
           Imm32 => SEU_Out ,
           Operando => Operando_Out,
           Isc => instructionMemory_Out(13));

ALU0 : ALU
    Port map( CRs1 => crs1_Out,
           CRs2 => Operando_Out,
			  C => c_Out,
           ALUOp => AluOp_Out,
           AluResult => AluResult_Out);

PSRModifer0 : PSRModifer
    Port map ( crS1 =>crs1_Out,
           crS2  => Operando_Out,
           AluResult => AluResult_Out,
           AluOp => AluOp_Out,
           nzvc => nzvc_Out);

MUXPCSC0 : MUXPCSC
    Port map( CALL => AdderCall,
           BRANCH =>  AdderBranch,
           nPC => AdderNextPc,
           JUMP => AluResult_Out,
           PCSC => PCSC_out,
           nPCOut => PcMux);

DataMemory0 : DataMemory
    Port map( cRD => crd_Out,
           AluResult => AluResult_Out,
           WRENMEM => WRENMEM_Out,
			  Reset => reset,
           DataMem => DataMem_Out);
			  
MUXRFSC0 : MUXRFSC
    Port map( DataMem => DataMem_Out,
           AluResult => AluResult_Out,
           PC => PcAdress,
           RFSC => RFSC_out,
           DWR => dwr_Out);
			  
			  
Result <= dwr_Out;
			  



end Behavioral;

