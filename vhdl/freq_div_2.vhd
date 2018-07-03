----------------------------------------------------------------------------------
--! @file freq_div_2.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library work;

--! @brief Divides the frequency of a digtial oscillator

entity freq_div_2 is
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset

    OscIn_SI  : in  std_logic;
    OscOut_SO : out std_logic

    );
end freq_div_2;

architecture Behavioral of freq_div_2 is


  signal OscInOld_SP          : std_logic;
  signal OscOut_SN, OscOut_SP : std_logic;

begin
  OscOut_SO <= OscOut_SP;

  process(OscInOld_SP, OscIn_SI, OscOut_SP)
  begin
    
    OscOut_SN <= OscOut_SP;
    if OscIn_SI = '1' and OscInOld_SP = '0' then  -- rising edge
      OscOut_SN <= not OscInOld_SP;
    end if;
  end process;

  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        OscInOld_SP <= '0';
        OscOut_SP   <= '0';
      else
        OscInOld_SP <= OscIn_SI;
        OscOut_SP   <= OscOut_SN;
      end if;
    end if;
  end process;
end Behavioral;
