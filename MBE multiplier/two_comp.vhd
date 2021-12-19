library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity two_comp is  
  port 
  ( 
     x : in  std_logic_vector (31 downto 0);
     y,z : out std_logic_vector   (32 downto 0)
  );
end entity two_comp;

architecture be of two_comp is

signal tmp :std_logic_vector (31 downto 0);
signal tmp_2 :std_logic_vector (32 downto 0);

begin

  tmp<=not(x);
  y(31 downto 0) <= tmp+1;
  y(32)<='1';
  
  tmp_2(31 downto 0) <= tmp+1;
  tmp_2(32)<='1';
  
  z(32 downto 1)<=tmp_2(31 downto 0);
  z(0)<='0';

end architecture;