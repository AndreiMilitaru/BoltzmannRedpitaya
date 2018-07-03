----------------------------------------------------------------------------------
--! @file constants.vhd
--! @author Felix Tebbenjohanns
--! @date 21.2.2017
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";

--! @brief This is the main settings file.
--! @details Every constant has direct implications on the synthesized hardware.

package constants is
  -- clock frequency
  constant FREQ_UNIT : integer := 1000;
  constant CLK_FREQ : integer := 125000000*FREQ_UNIT;


end package;
