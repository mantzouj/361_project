library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

---
entity data_mem is
    port (
      Din: in std_logic_vector(31 downto 0);
      clk: in std_logic;
      WRenable : in std_logic;
      Address : in std_logic_vector(31 downto 0);
      Dout: out std_logic_vector(31 downto 0)
      );
end data_mem;
  
architecture structural of data_mem is
  
component syncram is
  generic (
	mem_file : string
  );
  port (
     clk   : in  std_logic;
	   cs	  : in	std_logic;
	   oe	  :	in	std_logic;
	   we	  :	in	std_logic;
	   addr  : in	std_logic_vector(31 downto 0);
	   din	  :	in	std_logic_vector(31 downto 0);
	   dout  :	out std_logic_vector(31 downto 0)
  );
end component syncram;
    
  signal tempout : std_logic_vector(31 downto 0);
  signal prein1 : std_logic_vector(31 downto 0);
  signal prein2 : std_logic_vector(31 downto 0);
  signal tempin : std_logic_vector(31 downto 0);
  signal notenable : std_logic;    
  begin
    syncram0 : syncram generic map (mem_file => "") port map (clk, '1', '1', WRenable, Address, Din, Dout);
                                             
end architecture structural;
