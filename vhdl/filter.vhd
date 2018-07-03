----------------------------------------------------------------------------------
--! @file filter.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library work;

--! @brief Divides the frequency of a digtial oscillator

entity filter is
  generic(
    N : integer
    );
  port (
    RefOsc_DI : in std_logic_vector(N-1 downto 0);
    OscIn_DI  : in std_logic;

    MultOut_DO : out std_logic_vector(N-1 downto 0)

    );
end filter;

architecture Behavioral of filter is


begin

  process(OscIn_DI, RefOsc_DI)
  begin
    if OscIn_DI = '1' then              -- '+1'
      MultOut_D <= RefOsc_DI;
    else                                -- '-1'
      MultOut_D <= std_logic_vector(to_signed((-1)*to_integer(signed(RefOsc_DI)), N));
    end if;
  end process;

end Behavioral;
