----------------------------------------------------------------------------------
--! @file vco.vhd
--! @author Felix Tebbenjohanns
--! @date 2.7.2018
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library work;

--! @brief Digital VCO with sine- and square output

entity vco is
  generic(
    CENTER_FREQ      : integer;
    FREQ_RANGE       : integer;
    INPUT_BIT_WIDTH  : integer;
    OUTPUT_BIT_WITDH : integer
    );
  port (
    Clk_CI    : in std_logic;           --! Clock
    Reset_RBI : in std_logic;           --! input reset

    Voltage_DI : in std_logic_vector(INPUT_BIT_WIDTH-1 downto 0);

    Square_DO : out std_logic;
    Sine_DO   : out std_logic_vector(OUTPUT_BIT_WITDH-1 downto 0)
    );
end vco;

architecture Behavioral of vco is

  constant MAX_FREQ : integer := (CENTER_FREQ*FREQ_UNIT + FREQ_RANGE*FREQ_UNIT/2);
  constant MIN_FREQ : integer := (CENTER_FREQ*FREQ_UNIT - FREQ_RANGE*FREQ_UNIT/2);


  signal Square_SP, Square_SN   : std_logic;
  signal Counter_DP, Counter_DN : integer range 0 to CLK_FREQ/MIN_FREQ;

  signal CounterThreshold_D : integer range 0 to CLK_FREQ/MIN_FREQ;

begin

  Sine_DO   <= (others+ > '0');
  Square_DO <= Square_SP;

  CounterThreshold_D <= CLK_FREQ/(CENTER_FREQ*FREQ_UNIT + to_integer(signed(Voltage_DI))*FREQ_RANGE*FREQ_UNIT/(2**(INPUT_BIT_WIDTH)));


  process(CounterThreshold_D, Counter_DP, Square_SP)
  begin
    Square_SN <= Square_SP;
    if Counter_DP >= CounterThreshold_D then
      Counter_DN <= 0;
      Square_SN  <= not Square_SP;
    else
      Counter_DN <= Counter_DP+1;
    end if;
  end process;

  process(Clk_CI)
  begin
    if rising_edge(Clk_CI) then
      if Reset_RBI = '0' then
        Counter_DP <= 0;
        Square_SP  <= '0';
      else
        Counter_DP <= Counter_DN;
        Square_SP  <= Square_SN;
      end if;
    end if;
  end process;
end Behavioral;
