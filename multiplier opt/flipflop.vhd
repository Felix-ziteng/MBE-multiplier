library ieee;
USE IEEE.Std_logic_1164.all;

entity flipflop is 
   port(
      Q : out std_logic;    
    Clk, reset_n, enable: in std_logic;  
      D :in  std_logic    
   );
end flipflop;

architecture Behavioral of flipflop  is  
begin  
 process(Clk,reset_n)
 begin 
	if(reset_n = '0') then
		Q <= '0';
    elsif(rising_edge(Clk)) then
		if enable = '1' then	
			Q <= D;
		end if;
    end if;      
 end process;  
end Behavioral; 