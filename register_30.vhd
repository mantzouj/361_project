
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
      Dout: out std_logic_vector(29 downto 0)
      );
  end register_30;
  
  architecture structural of register_30 is
  
  component dff is
      port (
	     clk	: in  std_logic;
	     d	: in  std_logic;
	     q	: out std_logic
      );
  end component dff;
    
  signal tempout : std_logic_vector(29 downto 0);
  signal tempin : std_logic_vector(29 downto 0);  
    
  begin
      
  GEN_dff:
    for i in 0 to 29 generate
      muxX : mux port map (enable, tempout(i), Din(i), tempin(i));    
      dffX : dff port map (clk, tempin(i), tempout(i));
  end generate GEN_dff;
    
  Dout <= tempout;

                                       
end architecture structural;
