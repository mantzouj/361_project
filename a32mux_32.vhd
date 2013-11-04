
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

---

entity a32mux_32 is
  port (
	sel   : in  std_logic_vector(4 downto 0);
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	src2  : in  std_logic_vector(31 downto 0);
	src3  : in  std_logic_vector(31 downto 0);	
	src4  : in  std_logic_vector(31 downto 0);
	src5  : in  std_logic_vector(31 downto 0);	
	src6  : in  std_logic_vector(31 downto 0);
	src7  : in  std_logic_vector(31 downto 0);	
	src8  : in  std_logic_vector(31 downto 0);
	src9  : in  std_logic_vector(31 downto 0);
	src10  : in  std_logic_vector(31 downto 0);
	src11  : in  std_logic_vector(31 downto 0);	
	src12  : in  std_logic_vector(31 downto 0);
	src13  : in  std_logic_vector(31 downto 0);	
	src14  : in  std_logic_vector(31 downto 0);
	src15  : in  std_logic_vector(31 downto 0);		
	src16  : in  std_logic_vector(31 downto 0);
	src17  : in  std_logic_vector(31 downto 0);
	src18  : in  std_logic_vector(31 downto 0);
	src19  : in  std_logic_vector(31 downto 0);	
	src20  : in  std_logic_vector(31 downto 0);
	src21  : in  std_logic_vector(31 downto 0);	
	src22  : in  std_logic_vector(31 downto 0);
	src23  : in  std_logic_vector(31 downto 0);	
	src24  : in  std_logic_vector(31 downto 0);
	src25  : in  std_logic_vector(31 downto 0);
	src26  : in  std_logic_vector(31 downto 0);
	src27  : in  std_logic_vector(31 downto 0);	
	src28  : in  std_logic_vector(31 downto 0);
	src29  : in  std_logic_vector(31 downto 0);	
	src30  : in  std_logic_vector(31 downto 0);
	src31  : in  std_logic_vector(31 downto 0);		
	
	z	    : out std_logic_vector(31 downto 0)
  );
end a32mux_32;
  
  architecture structural of a32mux_32 is
  
  component mux_32 is
    port (
	     sel   : in  std_logic;
	     src0  : in  std_logic_vector(31 downto 0);
	     src1  : in  std_logic_vector(31 downto 0);
	     z	    : out std_logic_vector(31 downto 0)
    );
  end component mux_32;

      
  signal tempout1 : std_logic_vector(31 downto 0); signal tempout0 : std_logic_vector(31 downto 0);
  signal tempout2 : std_logic_vector(31 downto 0); signal tempout21 : std_logic_vector(31 downto 0);
  signal tempout3 : std_logic_vector(31 downto 0); signal tempout22 : std_logic_vector(31 downto 0);
  signal tempout4 : std_logic_vector(31 downto 0); signal tempout23 : std_logic_vector(31 downto 0);
  signal tempout5 : std_logic_vector(31 downto 0); signal tempout24 : std_logic_vector(31 downto 0);
  signal tempout6 : std_logic_vector(31 downto 0); signal tempout25 : std_logic_vector(31 downto 0);
  signal tempout7 : std_logic_vector(31 downto 0); signal tempout26 : std_logic_vector(31 downto 0);
  signal tempout8 : std_logic_vector(31 downto 0); signal tempout27 : std_logic_vector(31 downto 0);
  signal tempout9 : std_logic_vector(31 downto 0); signal tempout28 : std_logic_vector(31 downto 0);
  signal tempout10 : std_logic_vector(31 downto 0); signal tempout29 : std_logic_vector(31 downto 0);
  signal tempout11 : std_logic_vector(31 downto 0); signal tempout30 : std_logic_vector(31 downto 0);
  signal tempout12 : std_logic_vector(31 downto 0); signal tempout31 : std_logic_vector(31 downto 0);
  signal tempout13 : std_logic_vector(31 downto 0); signal tempout32 : std_logic_vector(31 downto 0);
  signal tempout14 : std_logic_vector(31 downto 0); signal tempout33 : std_logic_vector(31 downto 0);
  signal tempout15 : std_logic_vector(31 downto 0); signal tempout34 : std_logic_vector(31 downto 0);
  signal tempout16 : std_logic_vector(31 downto 0); signal tempout35 : std_logic_vector(31 downto 0);
  signal tempout17 : std_logic_vector(31 downto 0); signal tempout36 : std_logic_vector(31 downto 0);
  signal tempout18 : std_logic_vector(31 downto 0); signal tempout37 : std_logic_vector(31 downto 0);
  signal tempout19 : std_logic_vector(31 downto 0); signal tempout38 : std_logic_vector(31 downto 0);
  signal tempout20 : std_logic_vector(31 downto 0); signal tempout39 : std_logic_vector(31 downto 0);    
    
  begin
    
    mux0 : mux_32 port map (sel(0), src0, src1, tempout0); mux1 : mux_32 port map (sel(0), src2, src3, tempout1);
    mux2 : mux_32 port map (sel(0), src4, src5, tempout2); mux3 : mux_32 port map (sel(0), src6, src7, tempout3);    
    
    mux4 : mux_32 port map (sel(1), tempout0, tempout1, tempout4); mux5 : mux_32 port map (sel(1), tempout2, tempout3, tempout5);
    mux6 : mux_32 port map (sel(2), tempout4, tempout5, tempout6);
    ------
    
    mux7 : mux_32 port map (sel(0), src8, src9, tempout7); mux8 : mux_32 port map (sel(0), src10, src11, tempout8);
    mux9 : mux_32 port map (sel(0), src12, src13, tempout9); mux10 : mux_32 port map (sel(0), src14, src15, tempout10);    
    
    mux11 : mux_32 port map (sel(1), tempout7, tempout8, tempout11); mux12 : mux_32 port map (sel(1), tempout9, tempout10, tempout12);
    mux13 : mux_32 port map (sel(2), tempout11, tempout12, tempout13);
    ------   
    muxf1 : mux_32 port map (sel(3), tempout6, tempout13, tempout14);
    
    ------------
    
  
     
    mux14 : mux_32 port map (sel(0), src16, src17, tempout15); mux15 : mux_32 port map (sel(0), src18, src19, tempout16);
    mux16 : mux_32 port map (sel(0), src20, src21, tempout17); mux17 : mux_32 port map (sel(0), src22, src23, tempout18);    
    
    mux18 : mux_32 port map (sel(1), tempout15, tempout16, tempout19); mux19 : mux_32 port map (sel(1), tempout17, tempout18, tempout20);
    mux20 : mux_32 port map (sel(2), tempout19, tempout20, tempout21);
    ------   
    mux21 : mux_32 port map (sel(0), src24, src25, tempout22); mux22 : mux_32 port map (sel(0), src26, src27, tempout23);
    mux23 : mux_32 port map (sel(0), src28, src29, tempout24); mux24 : mux_32 port map (sel(0), src30, src31, tempout25);    
    
    mux25 : mux_32 port map (sel(1), tempout22, tempout23, tempout26); mux26 : mux_32 port map (sel(1), tempout24, tempout25, tempout27);
    mux27 : mux_32 port map (sel(2), tempout26, tempout27, tempout28);
    ------  
    muxf2 : mux_32 port map (sel(3), tempout21, tempout28, tempout29);
    
    
    
    
    
    
    
    muxfinal : mux_32 port map (sel(4), tempout14, tempout29, z);
    
                 
end architecture structural;


