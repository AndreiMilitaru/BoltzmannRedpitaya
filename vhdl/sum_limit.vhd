----------------------------------------------------------------------------------
--! @file sum_limit.vhd
--! @author Felix Tebbenjohanns
--! @date 7.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


library work;


entity sum_limit is
  generic (
    N : integer := 16
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset
    
    A_DI : in std_logic_vector(N-1 downto 0);
    B_DI : in std_logic_vector(N-1 downto 0);
    Valid_SI : in std_logic;
    
    C_DO : out std_logic_vector(N-1 downto 0);
    Valid_SO : out std_logic

    );
end sum_limit;

architecture Behavioral of sum_limit is
  
  signal C_DN, C_DP     : std_logic_vector(N - 1 downto 0);
begin

    C_DO <= C_DP;

  process(AMult_DP, BMult_DP, Valid_SI, A_DI, B_DI, WA_DI, WB_DI)  
      variable sum_long : std_logic_vector(N downto 0);
      constant MAX: std_logic_vector(N-1 downto 0) := (N-1=>'0', others => '1');
      constant MIN: std_logic_vector(N-1 downto 0) := (N-1=>'1', others => '0');
  begin
    
    sum_long := std_logic_vector(resize(signed(A_DI), N+1) + signed(B_DI));
    
    if (signed(sum_long) > signed(MAX)) then
        C_DN <= MAX;
    elsif (signed(sum_long) < signed(MIN)) then
        C_DN <= MIN;
    else
        C_DN <= std_logic_vector(resize(signed(sum_long), N_OUT));
    end if;
    
  end process;


  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        C_DP <= (others => '0');
        Valid_SO <= '0';
      else
        C_DP <= C_DN;
        Valid_SO <= Valid_SI;
      end if;
    end if;
  end process;

end Behavioral;
