----------------------------------------------------------------------------------
--! @file signed_width_convert.vhd
--! @author Felix Tebbenjohanns
--! @date 3.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


library work;

--! @brief converts a signed numver from one size to another

entity signed_width_convert is
  generic (
    N_IN : integer := 16;
    N_OUT : integer := 32
    );
  port (

    Din_DI  : in  std_logic_vector(N_IN-1 downto 0);
    Dout_DO : out std_logic_vector(N_OUT-1 downto 0)

    );
end signed_width_convert;

architecture Behavioral of signed_width_convert is

begin

     Dout_DO <= std_logic_vector(resize(signed(Din_DI), N_OUT));



end Behavioral;
