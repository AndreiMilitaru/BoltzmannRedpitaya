----------------------------------------------------------------------------------
--! @file pid.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


library work;

--! @brief Simple PID filter with setpoint 0.

entity pid is
  generic (
    N_IN : integer := 16;
    N_OUT : integer := 64;
    N_FACTORS : integer := 32
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset
    
    Kp : in std_logic_vector(N_FACTORS-1 downto 0);
    Ki : in std_logic_vector(N_FACTORS-1 downto 0);
    --Kd : in std_logic_vector(N-1 downto 0);
    
    
    Din_DI  : in  std_logic_vector(N_IN-1 downto 0);
    Dout_DO : out std_logic_vector(N_OUT-1 downto 0)

    );
end pid;

architecture Behavioral of pid is

  constant INT_MAX : std_logic_vector := std_logic_vector(to_signed(2**(N_OUT-1)-1, N_OUT));
  constant INT_MIN : std_logic_vector := std_logic_vector(to_signed((-1) * 2**(N_OUT-1), N_OUT));

  signal Prop_DN, Prop_DP     : std_logic_vector(N_OUT-1 downto 0);
  signal IntSum_DN, IntSum_DP : std_logic_vector(N_OUT-1 downto 0);

  signal Total_D : std_logic_vector(N_OUT-1 downto 0);
begin


  process(Din_DI, Kp, IntSum_DP, Ki, Prop_DP, Total_D)
  variable int_sum_next : std_logic_vector(N_OUT downto 0);
  begin
    Prop_DN   <= std_logic_vector(resize((-1) *  signed(Din_DI) * signed(Kp), N_OUT));
    int_sum_next := std_logic_vector(resize(signed(IntSum_DP) - signed(Din_DI) * signed(Ki), N_OUT+1));

    if signed(int_sum_next) > signed(INT_MAX) then
        IntSum_DN <= INT_MAX;
    elsif signed(int_sum_next) < signed(INT_MIN) then
        IntSum_DN <= INT_MIN;
    else    
        IntSum_DN <= std_logic_vector(resize(signed(int_sum_next), IntSum_DN'length));
    end if;
    
    Total_D <= std_logic_vector(signed(Prop_DP) + signed(IntSum_DP));
    Dout_DO<= Total_D;

  end process;


  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        Prop_DP   <= (others=>'0');
        IntSum_DP <= (others=>'0');
      else
        Prop_DP   <= Prop_DN;
        IntSum_DP <= IntSum_DN;
      end if;
    end if;
  end process;

end Behavioral;
