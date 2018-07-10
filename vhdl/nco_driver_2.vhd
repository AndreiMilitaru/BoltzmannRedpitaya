----------------------------------------------------------------------------------
--! @file nco_driver_2.vhd
--! @author Felix Tebbenjohanns
--! @date 6.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


library work;

entity nco_driver_2 is
  generic (
    N : integer := 32
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset
    
    NcoSet_DI : in std_logic_vector(N-1 downto 0);
    
    PidEn_SI : in std_logic;
    
    PidIn_DI : in std_logic_vector(N-1 downto 0);
    PidValid_SI : in std_logic;
    
    NcoOut_DO : out std_logic_vector(N-1 downto 0)

    );
end nco_driver_2;

architecture Behavioral of nco_driver_2 is

  signal Out_DN, Out_DP: std_logic_vector(N-1 downto 0);
begin

    process(NcoSet_DI, Out_DP, PidValid_SI, PidEn_SI, PIDIn_DI)
    begin
        Out_DN <= NcoSet_DI;
        
        
        if PidEn_SI = '1' then 
            Out_DN <= Out_DP;
            
            if PidValid_SI = '1' then
                
                Out_DN <= std_logic_vector(signed(PIDIn_DI) + signed(NcoSet_DI));
            
            end if;
        end if;
    
    end process;
    NcoOut_DO <= Out_DP;
    
    
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
