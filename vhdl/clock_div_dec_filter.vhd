----------------------------------------------------------------------------------
--! @file clock_div_dec_filter.vhd
--! @author Felix Tebbenjohanns
--! @date 4.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;

-- see https://forums.xilinx.com/t5/7-Series-FPGAs/How-to-divide-a-clock-by-2-with-a-simple-primitive-without-Clock/td-p/783488

entity clock_div_dec_filter is
  generic (
    N       : integer := 12;
    LOG_DIV : integer := 2
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset

    In_DI : in std_logic_vector(N-1 downto 0);

    Clk_CO : out std_logic
    Out_DO : out std_logic_vector(N+LOG_DIV-1 downto 0);
    );
end clock_div_dec_filter;

architecture Behavioral of clock_div_dec_filter is

  signal ClkOut_C               : std_logic;
  signal CounterMax_S           : std_logic;
  signal Counter_SP, Counter_SN : std_logic_vector(LOG_DIV-1 downto 0);
  signal Sum_DP, Sum_DN         : std_logic_vector(N+LOG_DIV-1 downto 0);

  signal Out_DP, Out_DN : std_logic_vector(N+LOG_DIV-1 downto 0);

begin
  Out_DO     <= Out_DP;
  Counter_SN <= std_logic_vector((unsigned(Counter_SP) + 1) mod (2**LOG_DIV));

  CounterMax_S <= '1' when (unsigned(Counter_DP) = 2**LOG_DIV-1) else '0';

  BUFGCE_inst : BUFGCE                  -- see Xilinx UG768
    port map (
      O  => ClkOut_C,
      I  => Clk_CI,
      CE => CounterMax_S
      );

  Clk_CO <= ClkOut_C;

  process(CounterMax_S, In_DI, Out_DP, Sum_DP)
  begin
    Sum_DN <= std_logic_vector(signed(Sum_DP) + signed(In_DI));
    Out_DN <= Out_DP;

    if CounterMax_S = '1' then
      Sum_DN <= std_logic_vector(resize(signed(In_DI), Sum_DN'length));
      Out_DN <= Sum_DP;
    end if;
  end process;


  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        Sum_DP     <= (others => '0');
        Out_DP     <= (others => '0');
        Counter_SP <= (others => '0');
      else
        Sum_DP     <= Sum_DN;
        Out_DP     <= Out_DN;
        Counter_SP <= Counter_SN;
      end if;
    end if;
  end process;
end Behavioral;
