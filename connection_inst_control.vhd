library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;


entity connection_inst_control is
  port (
    clk : in std_logic;
    ALUin1: in std_logic_vector(31 downto 0);
    ALUin2: in std_logic_vector(31 downto 0);
    ALUout : out std_logic_vector(31 downto 0)
  );
end connection_inst_control;

architecture structural of connection_inst_control is

component main_control is
  port (
    op : in std_logic_vector(5 downto 0);
    
    RegDst : out std_logic;
    ALUSrc : out std_logic;
    MemtoReg : out std_logic;
    RegWrite : out std_logic;
    MemWrite : out std_logic;
    BranchEQ : out std_logic;
    BranchNEQ: out std_logic;
    ExtOp : out std_logic;
    ALUop : out std_logic_vector(2 downto 0)
    );
  end component main_control;
      
component instruction_fetch_unit is
  port (
    clk : in std_logic;
    immediate : in std_logic_vector(15 downto 0);
    brancheq : in std_logic;
    branchneq: in std_logic;
    zero : in std_logic;
    instrOut : out std_logic_vector(31 downto 0)
  );
end component instruction_fetch_unit;      
      
component alu_control is
  port (
    --Inputs
    ALUop : in std_logic_vector(2 downto 0);
    funct: in std_logic_vector(5 downto 0);
    
    --Outputs
    ALUctrl: out std_logic_vector(2 downto 0);
    Shift: out std_logic --Additional signal for data path (says whether ALU input is shamt or not)
  );
end component alu_control;      

component alu_32 is 
    port(
          control: in std_logic_vector(2 downto 0); 
          x : in std_logic_vector(31 downto 0); 
          y : in std_logic_vector(31 downto 0); 
          z : out std_logic_vector(31 downto 0);
          overflow: out std_logic;
          zero_flag: out std_logic;
          cout: out std_logic 
           );
end component alu_32;

  signal instruction: std_logic_vector(31 downto 0);
  signal RegDst : std_logic;
  signal ALUSrc : std_logic;
  signal MemtoReg : std_logic;
  signal RegWrite : std_logic;
  signal MemWrite : std_logic;
  signal BranchEQ : std_logic;
  signal BranchNEQ: std_logic;
  signal ExtOp : std_logic;
  signal ALUop : std_logic_vector(2 downto 0);
  signal ALUctrl : std_logic_vector(2 downto 0);
  signal Shift : std_logic;
  signal overflow: std_logic;
  signal Zero: std_logic;
  signal cout: std_logic;
  

  begin 
  alu320 : alu_32 port map (ALUctrl, ALUin1, ALUin2, ALUout, overflow, Zero, cout);
  alucontrol0 : alu_control port map (ALUop, instruction(5 downto 0), ALUctrl, shift);
  maincontrol0 : main_control port map (instruction(31 downto 26), RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, BranchEQ, BranchNEQ, ExtOp, ALUop);
  instructionfetch0 : instruction_fetch_unit port map (clk, instruction(15 downto 0), BranchEQ, BranchNEQ, Zero, instruction); 
 
 end architecture structural;
