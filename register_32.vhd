library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

---

entity register_32 is
    port (
      Din: in std_logic_vector(31 downto 0);
      clk: in std_logic;
      enable : in std_logic;
      --reset: in std_logic;
      Dout: out std_logic_vector(31 downto 0)
      );
  end register_32;
  
  architecture structural of register_32 is
  
  component dff is
      port (
	     clk	: in  std_logic;
	     d	: in  std_logic;
	     q	: out std_logic
      );
  end component dff;
    
  signal tempout : std_logic_vector(31 downto 0);
  signal prein1 : std_logic_vector(31 downto 0);
  signal prein2 : std_logic_vector(31 downto 0);
  signal tempin : std_logic_vector(31 downto 0);
  signal notenable : std_logic;  
  
  
  
    
  begin
    not0 : not_gate port map (enable, notenable);
    
  --  and0a : and_gate port map (tempout(0), notenable, prein1(0));
  --  and0b : and_gate port map (Din(0),enable,prein2(0));
  --  or0 : or_gate port map (prein1(0),prein2(0),tempin(0));
  --  dff0 : dff port map (clk, tempin(0), tempout(0));
    
  --  and1a : and_gate port map (tempout(1), notenable, prein1(1));
  --  and1b : and_gate port map (Din(1),enable,prein2(1));
  --  or1 : or_gate port map (prein1(1),prein2(1),tempin(1));
  --  dff1 : dff port map (clk, tempin(1), tempout(1));     
      
    GEN_dff:
      for i in 0 to 31 generate
        andaX : and_gate port map (tempout(i),notenable,prein1(0));
        andbX : and_gate port map (Din(i),enable,prein2(i));
        orX : or_gate port map (clk, tempin(i), tempout(i));      
        dffX : dff port map (clk, tempin(i), tempout(i));
    end generate GEN_dff;

    Dout <= tempout;

                                       
end architecture structural;
