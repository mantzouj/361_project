library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

---

entity main_control is
  port (
    op : in std_logic_vector(5 downto 0);
    
    RegDst : out std_logic;
    ALUSrc : out std_logic;
    MemtoReg : out std_logic;
    RegWrite : out std_logic;
    MemWrite : out std_logic;
    Branch : out std_logic;
    Jump : out std_logic;
    ExtOp : out std_logic;
    ALUop : out std_logic_vector(2 downto 0)
    );
  end main_control;
  
  architecture structural of main_control is
  
  component and_gate_6in is
    port (
      t   : in  std_logic;
      u   : in  std_logic;
      v   : in  std_logic;
      w   : in  std_logic;
      x   : in  std_logic;
      y   : in  std_logic;
      z   : out std_logic
      );
  end component and_gate_6in;
  
  signal notop : std_logic_vector(5 downto 0);  
  signal Rtype : std_logic;
  signal LW : std_logic;
  signal SW : std_logic;
  signal BEQ : std_logic;
  signal BNE : std_logic;
  signal ADDI : std_logic;
  signal temp : std_logic_vector(2 downto 0);
  
  
  begin
  not_map : not_gate_n generic map (n => 6) port map (op, notop);
  
  andRtype : and_gate_6in port map (notop(0), notop(1), notop(2), notop(3), notop(4), notop(5), Rtype);
  andLW : and_gate_6in port map (op(0),op(1),notop(2),notop(3),notop(4),op(5),LW);
  andSW : and_gate_6in port map (op(0),op(1),notop(2),op(3),notop(4),op(5),SW);
  andBEQ : and_gate_6in port map (notop(0), notop(1), op(2), notop(3), notop(4), notop(5), BEQ);
  andBNE : and_gate_6in port map (op(0), notop(1), op(2), notop(3), notop(4), notop(5), BNE);
  andADDI : and_gate_6in port map (notop(0), notop(1), notop(2), op(3), notop(4), notop(5), ADDI);
  
  orRegWr0 : or_gate port map (Rtype,LW,temp(0));
  orRegWr1 : or_gate port map (ADDI, temp(0), RegWrite);
  
  orALUSrc0 : or_gate port map (LW,SW,temp(1));
  orALUSrc1 : or_gate port map (ADDI,temp(1),ALUSrc);
    
  orRegDst0 : or_gate port map (Rtype, ADDI, RegDst);
    
  MemtoReg <= LW;
  MemWrite <= SW;
  
  orBranch0 : or_gate port map (BEQ, BNE, Branch);
  
  orExtOp0 : or_gate port map (LW, SW, temp(2));
  orExtOp1 : or_gate port map (ADDI, temp(2),ExtOp);
  


  orALU0op0 : or_gate port map (BEQ, BNE, ALUop(0));
  orALU1op1 : or_gate port map (ADDI, '0', ALUop(1));
  orALU2op2 : or_gate port map (Rtype, '0', ALUop(2));
    
  
  Jump <= '0';                             
end structural;
