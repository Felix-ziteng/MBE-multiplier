LIBRARY ieee;

USE ieee.std_logic_1164.all;

--register
ENTITY reg IS
PORT (
      CLK:	IN STD_LOGIC;
      EN:	IN STD_LOGIC;
      D_IN:	IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      D_OUT:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF reg IS

BEGIN

reg_process: process(CLK)
  begin

    if CLK'event and CLK = '1' then
      if EN = '1' then
        D_OUT <= D_IN;
      end if;
    end if;
  end process;

  END behavioral;
--configuration CFG_reg of reg is
--for behavioral
  --end for;
--end CFG_FPmul;
