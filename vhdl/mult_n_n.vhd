----------------------------------------------------------------------------------
--! @file mult_n_n.vhd
--! @author Felix Tebbenjohanns
--! @date 9.9.2020
----------------------------------------------------------------------------------


--    Multiplys a n-bit number with a n-bit number
--
--    Copyright (C) 2020  Felix Tebbenjohanns
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.



--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library work;

--! @brief Multiplies a signed value of N bits with another N-bit value and negates result.
--  We use signed notation, therefore the inputs will be between -2^(N-1) and 2^(N-1)-1.
--  After multiplication, we will have the result between -2^(2N-2) + 2^(N-1) and 2^(2N-2). 
--  After negation, we have a number between -2^(2N-2) and 2^(2N-2) - 2^(N-1) which fits into a 2N-1 bit output number.

entity mult_n_n is
  generic(
    N : integer
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset
    
    A_DI : in std_logic_vector(N-1 downto 0);
    B_DI : in std_logic_vector(N-1 downto 0);

    C_DO : out std_logic_vector(2*N-2 downto 0)

    );
end mult_n_n;

architecture Behavioral of mult_n_n is

signal C_DN : std_logic_vector(2*N-2 downto 0);
signal A_DP, B_DP : std_logic_vector(N-1 downto 0);
begin

  process(B_DP, A_DP)
  begin                    
     C_DN <= std_logic_vector(to_signed((to_integer(signed(B_DP))*to_integer(signed(A_DP)))-1, 2*N-1));
  end process;


  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        C_DO   <= (others=>'0');
        A_DP <= (others=> '0');
        B_DP <= (others=> '0');
      else
        C_DO   <= C_DN;
        A_DP <= A_DI;
        B_DP <= B_DI;
      end if;
    end if;
  end process;
end Behavioral;
