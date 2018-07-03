----------------------------------------------------------------------------------
--! @file lpf.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library work;

--! @brief Phase lpf

entity lpf is
  generic(
    N_IN  : integer;
    N_OUT : integer
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset

    Din_DI  : in  std_logic_vector(N_IN-1 downto 0);
    Dout_DO : out std_logic_vector(N_OUT-1 downto 0)

    );
end lpf;

architecture Behavioral of lpf is

begin


  process(Din_DI)
  begin
    Dout_DO <= std_logic_vector(to_signed(to_integer(signed(Din_DI)), N_OUT));

  end process;


  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
      else
      end if;
    end if;
  end process;

end Behavioral;
