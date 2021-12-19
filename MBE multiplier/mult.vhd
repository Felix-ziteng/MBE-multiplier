LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mult IS
             PORT (a,x : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
						clk, RST_n: IN STD_LOGIC;
						--extension per vedere i 2 MSBs (Modelsim arriva fino a 32 bit), solo per simulare, non ci sarà nel progetto finale
						--DOUT per vedere i 32 LSBs, solo per simulare, non ci sarà nel progetto finale
						--ext : OUT STD_LOGIC_VECTOR(2 DOWNTO 0); 
						--res1,res2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
						--DOUT: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
						res: OUT STD_LOGIC_VECTOR(63 downto 0)
						);
END mult;

ARCHITECTURE Structure OF mult IS 

SIGNAL a1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal outmux :STD_LOGIC_VECTOR(34 downto 0);
signal m_a,a2 :STD_LOGIC_VECTOR(32 downto 0);
signal sel,sel1 : STD_LOGIC_VECTOR(2 downto 0);
signal reset_n : STD_LOGIC;
signal pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16,pp17 :STD_LOGIC_VECTOR(34 downto 0);
signal reg_en : STD_LOGIC;
signal pp_t_1,pp_t_2,pp_t_3,pp_t_4,pp_t_5,pp_t_6,pp_t_7,pp_t_8,pp_t_9,pp_t_10,pp_t_11,pp_t_12,pp_t_13,pp_t_14,pp_t_15,pp_t_16,pp_t_17 :STD_LOGIC_VECTOR(65 downto 0);
signal s,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15 : STD_LOGIC_VECTOR(65 downto 0);

COMPONENT cnt is 
   port(   
    tc_n : out std_logic;   
    Clk, reset_n, enable: in std_logic    
   );
END COMPONENT;

COMPONENT register_d is 
   port(
      Q : out std_logic_vector(31 downto 0);    
    Clk, reset_n, enable: in std_logic;  
      D :in  std_logic_vector(31 downto 0)    
   );
END COMPONENT;

COMPONENT register_dt is 
   port(
      Q : out std_logic_vector(2 downto 0);    
    Clk, reset_n, enable: in std_logic;  
      D :in  std_logic_vector(2 downto 0)    
   );
END COMPONENT;

COMPONENT register_d34 is 
   port(
      Q : out std_logic_vector(34 downto 0);    
    Clk, reset_n, enable: in std_logic;  
      D :in  std_logic_vector(34 downto 0)    
   );
END COMPONENT;

COMPONENT shreg IS 
       PORT ( Q : out std_logic_vector(2 downto 0);    
				Clk, reset_n, enable: in std_logic;  
				D :in  std_logic_vector(31 downto 0)
		   ) ;
END COMPONENT ;

COMPONENT two_comp IS 
       PORT ( x : in  std_logic_vector (31 downto 0);
				y,z : out std_logic_vector   (32 downto 0)
		   ) ;
END COMPONENT ;



COMPONENT mux8to1 is 
   port(
      sel: in std_logic_vector(2 downto 0);
		input0,input1: in std_logic_vector(32 downto 0);
		input2: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(34 downto 0)   
   );
end COMPONENT;

BEGIN 

reset_n <= RST_n;
sh_reg: shreg PORT MAP (sel, clk, reset_n, '1', x);
reg_32: register_d PORT MAP (a1, clk, reset_n, '1', a);
reg_3: register_dt PORT MAP (sel1, clk, reset_n, '1', sel);
comp: two_comp PORT MAP (	a1, m_a,a2);
mux: mux8to1 PORT MAP (sel,a2,m_a,a1,outmux);
--DOUT and ext are just for simulation, the real output is outmux (34 bits)
--DOUT<=outmux(31 downto 0);
--ext<=outmux(34 downto 32);

counter : cnt PORT MAP(reg_en, clk, reset_n, '1');
pp_17 : register_d34 PORT MAP(pp17,clk, reset_n,reg_en,outmux );
pp_16 : register_d34 PORT MAP(pp16,clk, reset_n,reg_en,pp17 );
pp_15 : register_d34 PORT MAP(pp15,clk, reset_n,reg_en,pp16 );
pp_14 : register_d34 PORT MAP(pp14,clk, reset_n,reg_en,pp15);
pp_13 : register_d34 PORT MAP(pp13,clk, reset_n,reg_en,pp14 );
pp_12 : register_d34 PORT MAP(pp12,clk, reset_n,reg_en,pp13 );
pp_11 : register_d34 PORT MAP(pp11,clk, reset_n,reg_en,pp12 );
pp_10 : register_d34 PORT MAP(pp10,clk, reset_n,reg_en,pp11 );
pp_9 : register_d34 PORT MAP(pp9,clk, reset_n,reg_en,pp10 );
pp_8 : register_d34 PORT MAP(pp8,clk, reset_n,reg_en,pp9 );
pp_7 : register_d34 PORT MAP(pp7,clk, reset_n,reg_en,pp8);
pp_6 : register_d34 PORT MAP(pp6,clk, reset_n,reg_en,pp7 );
pp_5 : register_d34 PORT MAP(pp5,clk, reset_n,reg_en,pp6 );
pp_4 : register_d34 PORT MAP(pp4,clk, reset_n,reg_en,pp5 );
pp_3 : register_d34 PORT MAP(pp3,clk, reset_n,reg_en,pp4 );
pp_2 : register_d34 PORT MAP(pp2,clk, reset_n,reg_en,pp3 );
pp_1 : register_d34 PORT MAP(pp1,clk, reset_n,reg_en,pp2 );
--DOUT<=pp17(31 downto 0);


pp_t_1<="0"&pp17(32 downto 4)&pp1(33) & not(pp1(33)) & not(pp1(33)) & pp1(32 downto 0);
pp_t_2<="00"&pp16(33 downto 7)&pp2(34 downto 0)&"00";
s1<=pp_t_1+pp_t_2;
pp_t_3<="000"&pp15(34 downto 11)&pp3(34 downto 0)&"0000";
s2<=s1+pp_t_3;
pp_t_4<="00000"&pp14(34 downto 15)&pp4(34 downto 0)&"000000";
s3<=s2+pp_t_4;
pp_t_5<="0000000"&pp13(34 downto 19)&pp5(34 downto 0)&"00000000";
s4<=s3+pp_t_5;
pp_t_6<="000000000"&pp12(34 downto 23)&pp6(34 downto 0)&"0000000000";
s5<=s4+pp_t_6;
pp_t_7<="00000000000"&pp11(34 downto 27)&pp7(34 downto 0)&"000000000000";
s6<=s5+pp_t_7;
pp_t_8<="0000000000000"&pp10(34 downto 31)&pp8(34 downto 0)&"00000000000000";
s7<=s6+pp_t_8;
pp_t_9<="000000000000000"&pp9(34 downto 0)&"0000000000000000";
s8<=s7+pp_t_9;
pp_t_10<="00000000000000000"&pp10(30 downto 0)&"000000000000000000";
s9<=s8+pp_t_10;
pp_t_11<="0000000000000000000"&pp11(26 downto 0)&"00000000000000000000";
s10<=s9+pp_t_11;
pp_t_12<="000000000000000000000"&pp12(22 downto 0)&"0000000000000000000000";
s11<=s10+pp_t_12;
pp_t_13<="00000000000000000000000"&pp13(18 downto 0)&"000000000000000000000000";
s12<=s11+pp_t_13;
pp_t_14<="0000000000000000000000000"&pp14(14 downto 0)&"00000000000000000000000000";
s13<=s12+pp_t_14;
pp_t_15<="000000000000000000000000000"&pp15(10 downto 0)&"0000000000000000000000000000";
s14<=s13+pp_t_15;
pp_t_16<="00000000000000000000000000000"&pp16(6 downto 0)&"000000000000000000000000000000";
s15<=s14+pp_t_16;
pp_t_17<="000000000000000000000000000000"&pp17(3 downto 0)&"00000000000000000000000000000000";
s<=s15+pp_t_17;
--res1<=s(63 downto 32);
--res2<=s(31 downto 0);
res<=s(63 downto 0);

END Structure;
