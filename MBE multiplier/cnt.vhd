library ieee;
USE IEEE.Std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt is 
   
   port(
		tc_n : out std_logic;   
    Clk, reset_n, enable: in std_logic   
   );
end cnt;
architecture Behavioral of cnt is  
signal tmp : std_logic_vector(4 downto 0);
begin  
 process(Clk,reset_n)
 begin 
	if(reset_n = '0') then
		tmp <= (others => '0');
		tc_n<='1';
    elsif(rising_edge(Clk)) then
		if enable = '1' then	
			tmp<=tmp+1;
			if tmp="10001" then
			tc_n<='0';
			end if;
		end if;
    end if;      
 end process;  
end Behavioral; 