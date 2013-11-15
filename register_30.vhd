
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

---

entity register_30 is
    port (
      Din: in std_logic_vector(29 downto 0);
      clk: in std_logic;
      enable : in std_logic;
      reset : in std_logic;
      aload : in std_logic;
      Dout: out std_logic_vector(29 downto 0)
      );
  end register_30;
  
  architecture structural of register_30 is
  
  component dffr_a is
    port (
	   clk	   : in  std_logic;
     arst   : in  std_logic;
     aload  : in  std_logic;
     adata  : in  std_logic;
	   d	     : in  std_logic;
     enable : in  std_logic;
	   q	     : out std_logic
  );
  end component dffr_a;
    
  signal tempout : std_logic_vector(29 downto 0);
  signal tempin : std_logic_vector(29 downto 0);  
  signal startaddress : std_logic_vector(29 downto 0);
    
  begin
  
  
  startaddress <= "000000000100000000000000001000";
      
      
  GEN_dffr_a:
    for i in 0 to 29 generate
      
      muxX : mux port map (enable, tempout(i), Din(i), tempin(i));    
      dffr_aX : dffr_a port map (clk, reset, aload, startaddress(i), tempin(i), enable, tempout(i));
  end generate GEN_dffr_a;
    
  Dout <= tempout;

                                       
end architecture structural;
