library ieee;
use ieee.std_logic_1164.all;

entity mux8to1 is
  port(
		sel: in std_logic_vector(2 downto 0);
		input0,input1: in std_logic_vector(32 downto 0);
		input2: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(34 downto 0)
		);
end entity;

architecture syn of mux8to1 is

signal m_z,z,a,m_a,a2,m_a2 : std_logic_vector(34 downto 0);

begin

m_a2(32 downto 0)<=input0;
m_a2(34 downto 33)<="10";
m_a(32 downto 0)<=input1;
m_a(34 downto 33)<="10";
a(31 downto 0)<=input2;
a(34 downto 32)<="110";
a2(31 downto 1)<=input2(30 downto 0);
a2(34 downto 32)<="110";
a2(0)<='0';
z<="11000000000000000000000000000000000";
m_z<="11000000000000000000000000000000000";




  with sel select
	output <= z when "000",
			  a when "001",
			  a when "010",
			  a2 when "011",
			  m_a2 when "100",
			  m_a when "101",
			  m_a when "110",
			  m_z when "111",
			  z when others;

end architecture;