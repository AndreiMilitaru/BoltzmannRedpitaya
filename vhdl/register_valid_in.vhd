----------------------------------------------------------------------------------
--! @file register_valid_in.vhd
--! @author Felix Tebbenjohanns
--! @date 4.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


library work;

--! @brief 

entity register_valid_in is
  generic (
    N: integer := 32
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset
    
    
    In_DI : in std_logic_vector(N-1 downto 0);
    Valid_SI : in std_logic;
    
    Out_DO : out std_logic_vector(N-1 downto 0)

    );
end register_valid_in;

architecture Behavioral of register_valid_in is

  signal Out_DP, Out_DN : std_logic_vector(N-1 downto 0);
begin
  
  
  
  process(Out_DP, Valid_SI,In_DI)
  begin
    Out_DN <= Out_DP;
    
    if Valid_SI = '1' then
        Out_DN <= In_DI;
     
    end if;
  end process;
  
  Out_DO <= Out_DP;
  
  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        Out_DP   <= (others=>'0');
      else
        Out_DP   <= Out_DN;
      end if;
    end if;
  end process;

end Behavioral;
