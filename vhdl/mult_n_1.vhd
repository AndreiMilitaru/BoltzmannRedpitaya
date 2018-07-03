----------------------------------------------------------------------------------
--! @file mult_n_1.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library work;

--! @brief Multiplies a signed value of N bits with a 1-bit value

entity mult_n_1 is
  generic(
    N : integer
    );
  port (
    A_DI : in std_logic_vector(N-1 downto 0);
    B_DI : in std_logic;

    C_DO : out std_logic_vector(N-1 downto 0)

    );
end mult_n_1;

architecture Behavioral of mult_n_1 is


begin

  process(B_DI, A_DI)
  begin
    if B_DI = '1' then                  -- '+1'
      C_DO <= A_DI;
    else                                -- '-1'
      C_DO <= std_logic_vector(to_signed((-1)*to_integer(signed(A_DI)), N));
    end if;
  end process;

end Behavioral;
