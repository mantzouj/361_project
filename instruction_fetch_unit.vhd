library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity instruction_fetch_unit is
  port (
    clk : in std_logic;
    immediate : in std_logic_vector(15 downto 0);
    brancheq : in std_logic;
    branchneq: in std_logic;
    zero : in std_logic;
    instrOut : out std_logic_vector(31 downto 0)
  );
end instruction_fetch_unit;

architecture structural of instruction_fetch_unit is
   signal zero_not: std_logic;
   signal ext_imm : std_logic_vector(31 downto 0);
   signal be_and_z : std_logic;
   signal bne_and_z : std_logic;
   signal branch : std_logic;
   signal pc : std_logic_vector(29 downto 0);
   signal pc_plus_4 : std_logic_vector(29 downto 0);
   signal pc_plus_imm : std_logic_vector(29 downto 0);
   signal pc_next : std_logic_vector(29 downto 0);
   signal c_out0 : std_logic;
   signal c_out1 : std_logic;
   signal instrAddr : std_logic_vector(31 downto 0);
   signal din : std_logic_vector(31 downto 0);
   
begin
   instrAddr(31 downto 2) <= pc(29 downto 0);
   instrAddr(1 downto 0) <= "00";
   
   extend : entity work.extender_16 port map('1', immediate, ext_imm);
   
   z_not: not_gate port map(zero, zero_not);
   bcheq:  and_gate port map(brancheq, zero, be_and_z);
   bchneq: and_gate port map(branchneq, zero_not, bne_and_z);
   bch_or: or_gate port map(brancheq, branchneq, branch);
   
   pc_4 : fulladder_n generic map(30) port map('1', pc, "000000000000000000000000000000", c_out0,pc_plus_4);
   pc_imm: fulladder_n generic map(30) port map('0', pc_plus_4, ext_imm(29 downto 0), c_out1, pc_plus_imm); --I don't *think* there are any overflow worries for these adders
   
   mux_0 : mux_n generic map(30) port map(branch, pc_plus_4, pc_plus_imm, pc_next);
   
   pc_reg: entity work.register_30 port map(pc_next, clk, '1', pc);
   
   sram_map : sram generic map ("data/sort_corrected_branch.dat") port map ('1', '1', '0', instrAddr, din, instrOut); --edit location of mem_file
  
end structural;
