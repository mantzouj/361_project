library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity and_gate_6in is
  port (
    t   : in  std_logic;
    u   : in  std_logic;
    v   : in  std_logic;
    w   : in  std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end and_gate_6in;

architecture structural of and_gate_6in is

signal temp : std_logic_vector (3 downto 0);


begin
  and0 : and_gate port map (t, u, temp(0));
  and1 : and_gate port map (v, w, temp(1));
  and2 : and_gate port map (x, y, temp(2));
  and3 : and_gate port map (temp(0),temp(1),temp(3));
  and4 : and_gate port map (temp(3), temp(2), z);
end architecture structural;
