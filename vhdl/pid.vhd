----------------------------------------------------------------------------------
--! @file pid.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library work;

--! @brief Simple PID filter

entity pid is
  generic(
    N_IN    : integer;
    N_OUT   : integer;
    Kp      : integer;
    Ki      : integer;
    Kd      : integer;
    OUT_MAX : integer
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset

    Din_DI  : in  std_logic_vector(N_IN-1 downto 0);
    Dout_DO : out std_logic_vector(N_OUT-1 downto 0)

    );
end pid;

architecture Behavioral of pid is
  signal Prop_DN, Prop_DP     : integer;
  signal IntSum_DN, IntSum_DP : integer;

  signal Dold_DN, Dold_DP : integer;
  signal Diff_D           : integer;

  signal Total_D : integer
begin


  process(Diff_D, Din_DI, Dold_DN, Dold_DP, IntSum_DP, Prop_DP, Total_D)
  begin
    Prop_DN   <= (-1) * to_integer(signed(Din_DI)) * Kp;
    IntSum_DN <= IntSum_DP - to_integer(signed(Din_DI)) * Ki;

    Dold_DN <= to_integer(signed(Din_DI));
    Diff_D  <= (Dold_DP - Dold_DN) * Kd;

    Total_D <= Prop_DP + IntSum_DP + Diff_D;

    if Total_D > OUT_MAX then
      Dout_DO <= (N_OUT-1 => '0', others => '1');
    elsif Total_D < (-1)*OUT_MAX then
      Dout_DO <= (N_OUT-1 => '1', others => '0');
    else
      Dout_DO <= std_logic_vector(to_signed(Total_D*OUT_MAX/(2**(N_OUT-1)), N_OUT));
    end if;
  end process;


  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        Prop_DP   <= 0;
        IntSum_DP <= 0;
        Dold_DP   <= 0;
      else
        Prop_DP   <= Prop_DN;
        IntSum_DP <= IntSum_DN;
        Dold_DP   <= Dold_DN;
      end if;
    end if;
  end process;

end Behavioral;
