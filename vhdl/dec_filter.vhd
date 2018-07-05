----------------------------------------------------------------------------------
--! @file dec_filter.vhd
--! @author Felix Tebbenjohanns
--! @date 4.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


library work;

--! @brief Simple decimation filter

entity dec_filter is
  generic (
    DEC : integer := 1024;
    CEILLOGDEC : integer := 10;
    N: integer := 32;
    N_OUT : integer := 32;
    DIV : integer := 1024
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset
    
    
    In_DI : in std_logic_vector(N-1 downto 0);
    Valid_SI : in std_logic;
    
    Out_DO : out std_logic_vector(N_OUT-1 downto 0);
    Valid_SO : out std_logic

    );
end dec_filter;

architecture Behavioral of dec_filter is

  signal Counter_DP, Counter_DN : integer range 0 to DEC-1;
  signal Sum_DP, Sum_DN : std_logic_vector(N+CEILLOGDEC-1 downto 0);
  
  signal Out_DP, Out_DN : std_logic_vector(N_OUT-1 downto 0);
begin
  
  process(Counter_DP, Sum_DP, Out_DP, Valid_SI, In_DI)
  begin
    Counter_DN <= Counter_DP;
    Sum_DN <= Sum_DP;
    Out_DN <= Out_DP;
    
    if Valid_SI = '1' then
        Counter_DN<=(Counter_DP+1) mod DEC;
        Sum_DN <= std_logic_vector(signed(Sum_DP) + signed(In_DI));
        
        if Counter_DP = N-1 then
            Sum_DN <= std_logic_vector(to_signed(0, Sum_DN'length));
            Out_DN <= std_logic_vector(resize(signed(Sum_DP) / DIV, Out_DN'length));
        end if;
    end if;
  end process;
  
  Out_DO <= Out_DP;
  
  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        Out_DP   <= (others=>'0');
        Counter_DP   <= 0;
        Sum_DP   <= (others=>'0');
      else
        Out_DP   <= Out_DN;
        Counter_DP   <= Counter_DN;
        Sum_DP   <= Sum_DN;
      end if;
    end if;
  end process;

end Behavioral;
