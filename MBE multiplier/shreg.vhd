library ieee;
USE IEEE.Std_logic_1164.all;

entity shreg is 
   port(
      Q : out std_logic_vector(2 downto 0);    
    Clk, reset_n, enable: in std_logic;  
      D :in  std_logic_vector(31 downto 0)    
   );
end shreg;

architecture Behavioral of shreg is  

signal tmp : std_logic_vector (32 downto 0);

begin 

 process(Clk,reset_n)
 begin 
	if(reset_n = '0') then
		Q <= (others => '0');
		tmp(32 downto 1)<=D;
		tmp(0)<='0';
    elsif(rising_edge(Clk)) then
		if enable = '1' then	
			
			
Q<=tmp(2 downto 0);
tmp(0)<=tmp(2);
tmp(1)<=tmp(3);
tmp(2)<=tmp(4);
tmp(3)<=tmp(5);
tmp(4)<=tmp(6);
tmp(5)<=tmp(7);
tmp(6)<=tmp(8);
tmp(7)<=tmp(9);
tmp(8)<=tmp(10);
tmp(9)<=tmp(11);
tmp(10)<=tmp(12);
tmp(11)<=tmp(13);
tmp(12)<=tmp(14);
tmp(13)<=tmp(15);
tmp(14)<=tmp(16);
tmp(15)<=tmp(17);
tmp(16)<=tmp(18);
tmp(17)<=tmp(19);
tmp(18)<=tmp(20);
tmp(19)<=tmp(21);
tmp(20)<=tmp(22);
tmp(21)<=tmp(23);
tmp(22)<=tmp(24);
tmp(23)<=tmp(25);
tmp(24)<=tmp(26);
tmp(25)<=tmp(27);
tmp(26)<=tmp(28);
tmp(27)<=tmp(29);
tmp(28)<=tmp(30);
tmp(29)<=tmp(31);
tmp(30)<=tmp(32);
tmp(31)<='0';
tmp(32)<='0';


		end if;
    end if;      
 end process;  

end Behavioral; 