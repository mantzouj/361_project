library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity InstructionFetchUnit is
  port (
    clk : in std_logic;
    immediate : in std_logic_vector(15 downto 0);
    target    : in std_logic_vector(25 downto 0);
    branch    : in std_logic;
    zero      : in std_logic;
    jump      : in std_logic;
    instrOut  : out std_logic_vector(31 downto 0)
  );
end InstructionFetchUnit;

architecture structural of InstructionFetchUnit is
   signal jumpAddress    : std_logic_vector(29 downto 0);
   signal shift_imm      : std_logic_vector(29 downto 0);
   signal b_and_z        : std_logic;
   signal pc             : std_logic_vector(29 downto 0);
   signal pc_plus_4      : std_logic_vector(29 downto 0);
   signal pc_plus_imm    : std_logic_vector(29 downto 0);
   signal pc_plus_branch : std_logic_vector(29 downto 0);
   signal pc_next        : std_logic_vector(29 downto 0);
   signal c_out0         : std_logic;
   signal c_out1         : std_logic;
   signal instrAddr      : std_logic_vector(31 downto 0);
   signal din            : std_logic_vector(31 downto 0);
   
begin
   instrAddr(31 downto 2) <= pc(29 downto 0);
   instrAddr(1 downto 0) <= "00";
   jumpAddress(29 downto 26) <= pc(29 downto 26);
   jumpAddress(25 downto 0) <= target(25 downto 0);
   shift_imm(29) <= immediate(15);
   shift_imm(28) <= immediate(15);
   shift_imm(27) <= immediate(15);
   shift_imm(26) <= immediate(15);
   shift_imm(25) <= immediate(15);
   shift_imm(24) <= immediate(15);
   shift_imm(23) <= immediate(15);
   shift_imm(22) <= immediate(15);
   shift_imm(21) <= immediate(15);
   shift_imm(20) <= immediate(15);
   shift_imm(19) <= immediate(15);
   shift_imm(18) <= immediate(15);
   shift_imm(17) <= immediate(15);
   shift_imm(16) <= immediate(15);
   shift_imm(15 downto 0) <= immediate;
   
   bchzro: and_gate port map(branch, zero, b_and_z);
   
   pc_4 : fulladder_n generic map(30) port map('1', pc, "000000000000000000000000000000", c_out0,pc_plus_4);
   pc_imm: fulladder_n generic map(30) port map('0', pc_plus_4, shift_imm, c_out1,pc_plus_imm); --I don't *think* there are any overflow worries for these adders
   
   mux_0 : mux_n generic map(30) port map(b_and_z, pc_plus_4, pc_plus_imm, pc_plus_branch);
   mux_1 : mux_n generic map(30) port map(jump, pc_plus_branch, jumpAddress, pc_next);
   
   pc_reg: entity work.register_30 port map(pc_next, clk, '1', pc);
   
   sram_map : sram generic map ("data/sort_corrected_branch.dat") port map ('1', '1', '0', instrAddr, din, instrOut); --edit location of mem_file 
  
end structural;
