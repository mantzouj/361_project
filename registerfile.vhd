library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

---

entity registerfile is
  port (
    WRenable: in std_logic;
    clk : in std_logic;
    RA : in std_logic_vector(4 downto 0);
    RB : in std_logic_vector(4 downto 0);
    RW : in std_logic_vector(4 downto 0);
    busW : in std_logic_vector(31 downto 0);
    
    busA : out std_logic_vector(31 downto 0);
    busB : out std_logic_vector(31 downto 0)
    );
  end registerfile;
  
  architecture structural of registerfile is
  
 -- component dec_n is
--  generic (
--    n	: integer
--  );
--  port (
 --   src	: in std_logic_vector(n-1 downto 0);
--    z	: out std_logic_vector((2**n)-1 downto 0)
--  );
--  end component dec_n;

  component a32mux_32 is
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
  end component a32mux_32;


  
  component register_32 is
    port (
      Din: in std_logic_vector(31 downto 0);
      clk: in std_logic;
      enable : in std_logic;
      --reset: in std_logic;
      Dout: out std_logic_vector(31 downto 0)
      );
  end component register_32;
      
  
  signal decoderoutput : std_logic_vector(31 downto 0);
  signal tempdecoderoutput : std_logic_vector(31 downto 0);
  signal register0temp : std_logic_vector(31 downto 0); signal register11temp : std_logic_vector(31 downto 0);
  signal register1temp : std_logic_vector(31 downto 0); signal register12temp : std_logic_vector(31 downto 0);
  signal register2temp : std_logic_vector(31 downto 0); signal register13temp : std_logic_vector(31 downto 0);
  signal register3temp : std_logic_vector(31 downto 0); signal register14temp : std_logic_vector(31 downto 0);
  signal register4temp : std_logic_vector(31 downto 0); signal register15temp : std_logic_vector(31 downto 0);
  signal register5temp : std_logic_vector(31 downto 0); signal register16temp : std_logic_vector(31 downto 0);
  signal register6temp : std_logic_vector(31 downto 0); signal register17temp : std_logic_vector(31 downto 0);
  signal register7temp : std_logic_vector(31 downto 0); signal register18temp : std_logic_vector(31 downto 0);
  signal register8temp : std_logic_vector(31 downto 0); signal register19temp : std_logic_vector(31 downto 0);
  signal register9temp : std_logic_vector(31 downto 0); signal register20temp : std_logic_vector(31 downto 0);
  signal register10temp : std_logic_vector(31 downto 0); signal register21temp : std_logic_vector(31 downto 0);
  signal register22temp : std_logic_vector(31 downto 0); signal register26temp : std_logic_vector(31 downto 0);
  signal register23temp : std_logic_vector(31 downto 0); signal register27temp : std_logic_vector(31 downto 0);
  signal register24temp : std_logic_vector(31 downto 0); signal register28temp : std_logic_vector(31 downto 0);
  signal register25temp : std_logic_vector(31 downto 0); signal register29temp : std_logic_vector(31 downto 0);    
  signal register30temp : std_logic_vector(31 downto 0); signal register31temp : std_logic_vector(31 downto 0);    
  
  begin
  decoder_map : dec_n generic map (n => 5) port map (RW, tempdecoderoutput);
  and0 : and_gate port map (WRenable, tempdecoderoutput(0), decoderoutput(0)); and16 : and_gate port map (WRenable, tempdecoderoutput(16), decoderoutput(16));
  and1 : and_gate port map (WRenable, tempdecoderoutput(1), decoderoutput(1)); and17 : and_gate port map (WRenable, tempdecoderoutput(17), decoderoutput(17));
  and2 : and_gate port map (WRenable, tempdecoderoutput(2), decoderoutput(2)); and18 : and_gate port map (WRenable, tempdecoderoutput(18), decoderoutput(18));
  and3 : and_gate port map (WRenable, tempdecoderoutput(3), decoderoutput(3)); and19 : and_gate port map (WRenable, tempdecoderoutput(19), decoderoutput(19));
  and4 : and_gate port map (WRenable, tempdecoderoutput(4), decoderoutput(4)); and20 : and_gate port map (WRenable, tempdecoderoutput(20), decoderoutput(20));
  and5 : and_gate port map (WRenable, tempdecoderoutput(5), decoderoutput(5)); and21 : and_gate port map (WRenable, tempdecoderoutput(21), decoderoutput(21));
  and6 : and_gate port map (WRenable, tempdecoderoutput(6), decoderoutput(6)); and22 : and_gate port map (WRenable, tempdecoderoutput(22), decoderoutput(22));
  and7 : and_gate port map (WRenable, tempdecoderoutput(7), decoderoutput(7)); and23 : and_gate port map (WRenable, tempdecoderoutput(23), decoderoutput(23));
  and8 : and_gate port map (WRenable, tempdecoderoutput(8), decoderoutput(8)); and24 : and_gate port map (WRenable, tempdecoderoutput(24), decoderoutput(24));
  and9 : and_gate port map (WRenable, tempdecoderoutput(9), decoderoutput(9)); and25 : and_gate port map (WRenable, tempdecoderoutput(25), decoderoutput(25));
  and10 : and_gate port map (WRenable, tempdecoderoutput(10), decoderoutput(10)); and26 : and_gate port map (WRenable, tempdecoderoutput(26), decoderoutput(26));
  and11 : and_gate port map (WRenable, tempdecoderoutput(11), decoderoutput(11)); and27 : and_gate port map (WRenable, tempdecoderoutput(27), decoderoutput(27));
  and12 : and_gate port map (WRenable, tempdecoderoutput(12), decoderoutput(12)); and28 : and_gate port map (WRenable, tempdecoderoutput(28), decoderoutput(28));
  and13 : and_gate port map (WRenable, tempdecoderoutput(13), decoderoutput(13)); and29 : and_gate port map (WRenable, tempdecoderoutput(29), decoderoutput(29));
  and14 : and_gate port map (WRenable, tempdecoderoutput(14), decoderoutput(14)); and30 : and_gate port map (WRenable, tempdecoderoutput(30), decoderoutput(30));
  and15 : and_gate port map (WRenable, tempdecoderoutput(15), decoderoutput(15)); and31 : and_gate port map (WRenable, tempdecoderoutput(31), decoderoutput(31));  
  
    ----register 0 is always 0?
  register_320 : register_32 port map ("00000000000000000000000000000000", clk, '1', register0temp);  register_3216 : register_32 port map (busW, clk, decoderoutput(16), register16temp);
  register_321 : register_32 port map (busW, clk, decoderoutput(1), register1temp);  register_3217 : register_32 port map (busW, clk, decoderoutput(17), register17temp);
  register_322 : register_32 port map (busW, clk, decoderoutput(2), register2temp);  register_3218 : register_32 port map (busW, clk, decoderoutput(18), register18temp);
  register_323 : register_32 port map (busW, clk, decoderoutput(3), register3temp);  register_3219 : register_32 port map (busW, clk, decoderoutput(19), register19temp);      
  register_324 : register_32 port map (busW, clk, decoderoutput(4), register4temp);  register_3220 : register_32 port map (busW, clk, decoderoutput(20), register20temp);
  register_325 : register_32 port map (busW, clk, decoderoutput(5), register5temp);  register_3221 : register_32 port map (busW, clk, decoderoutput(21), register21temp);     
  register_326 : register_32 port map (busW, clk, decoderoutput(6), register6temp);  register_3222 : register_32 port map (busW, clk, decoderoutput(22), register22temp);
  register_327 : register_32 port map (busW, clk, decoderoutput(7), register7temp);  register_3223 : register_32 port map (busW, clk, decoderoutput(23), register23temp);
  register_328 : register_32 port map (busW, clk, decoderoutput(8), register8temp);  register_3224 : register_32 port map (busW, clk, decoderoutput(24), register24temp);
  register_329 : register_32 port map (busW, clk, decoderoutput(9), register9temp);  register_3225 : register_32 port map (busW, clk, decoderoutput(25), register25temp);
  register_3210 : register_32 port map (busW, clk, decoderoutput(10), register10temp);  register_3226 : register_32 port map (busW, clk, decoderoutput(26), register26temp);
  register_3211 : register_32 port map (busW, clk, decoderoutput(11), register11temp);  register_3227 : register_32 port map (busW, clk, decoderoutput(27), register27temp);      
  register_3212 : register_32 port map (busW, clk, decoderoutput(12), register12temp);  register_3228 : register_32 port map (busW, clk, decoderoutput(28), register28temp);
  register_3213 : register_32 port map (busW, clk, decoderoutput(13), register13temp);  register_3229 : register_32 port map (busW, clk, decoderoutput(29), register29temp);     
  register_3214 : register_32 port map (busW, clk, decoderoutput(14), register14temp);  register_3230 : register_32 port map (busW, clk, decoderoutput(30), register30temp);
  register_3215 : register_32 port map (busW, clk, decoderoutput(15), register15temp);  register_3231 : register_32 port map (busW, clk, decoderoutput(31), register31temp);      
      
  --Two multiplexers, one for outA and one for outB
  
  muxA : a32mux_32 port map (RA, register0temp, register1temp, register2temp, register3temp, register4temp, register5temp, register6temp, register7temp, register8temp, register9temp, register10temp, register11temp, register12temp, register13temp, register14temp, register15temp, register16temp, register17temp, register18temp, register19temp, register20temp, register21temp, register22temp, register23temp, register24temp, register25temp, register26temp, register27temp, register28temp, register29temp, register30temp, register31temp, busA);
  muxB : a32mux_32 port map (RB, register0temp, register1temp, register2temp, register3temp, register4temp, register5temp, register6temp, register7temp, register8temp, register9temp, register10temp, register11temp, register12temp, register13temp, register14temp, register15temp, register16temp, register17temp, register18temp, register19temp, register20temp, register21temp, register22temp, register23temp, register24temp, register25temp, register26temp, register27temp, register28temp, register29temp, register30temp, register31temp, busB);
  
  
  

  
  --GEN_register:
  --  for i in 0 to 31 generate
--      register_32X : register_32 port map (busW, clk, WRenable, register0temp); ---make output register 1 temp, 2 temp, 3 temp, etc....can't use generate? copy all
  --end generate GEN_register;

    
                               
end architecture structural;

