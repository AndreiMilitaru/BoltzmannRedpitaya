import os
import sys
import math
from dec2bin import dec2bin, bin2dec

if sys.argv[1] == 'help':
    print('\n\n\n')
    print('----------------------------------------')
    print('First argument is gain (1-65536)')
    print('Second argument is cutoff frequency (0.0-1.0)')
    print('Third argument is offset (1-65536)')
    print('Fourth argument is output')
    print('Fifth argument is bool: 1 chooses input1 and 0 chooses input2')
    print('Options are: ')
    print('- 0 --> input signal')
    print('- 1 --> out1[15:2]')
    print('- 2 --> out1[13:0]')
    print('- 3 --> out1[17:4]')
    print('- 4 --> out1[19:6]')
    print('- 5 --> out1[21:8]')
    
    print('Sixth argument is optional and is for refleshing the firmware.')
    print('----------------------------------------')
    print('\n\n\n')
    sys.exit()
    
gain = int(sys.argv[1])
cutoff_f = float(sys.argv[2])
offset = int(sys.argv[3])
switch1 = int(sys.argv[4])
which_input = int(sys.argv[5])

alpha = int(cutoff_f * 2**58)
alpha_bits = dec2bin(alpha, width=58)
separation = 26
alpha_gpio1 = bin2dec(alpha_bits[:separation])
alpha_gpio2 = bin2dec(alpha_bits[separation:])

code_g = str(gain + 2**16*offset)

if len(sys.argv) > 6:
    if sys.argv[6] == '1':
        print('Loading the mexican_swimmer-bitstream...')
        os.system('cat bitfiles/mexican_swimmerHD.bit > /dev/xdevcfg')
        print('mexican_swimmer-bitstream loaded.')

code_switch = str(switch1*8 + which_input + alpha_gpio1*2**6)       

print('Setting the DAC output...')
os.system('monitor 0x41210000 ' + code_switch)
print('Address 0x4121_0000 set to ' + code_switch + '.')

print('Setting gain...')
os.system('monitor 0x41200000 ' + code_g)
print('Address 0x4120_0000 set to ' + code_g + '.')

print('Setting cutoff frequency...')
os.system('monitor 0x41220000 ' + str(alpha_gpio2))
print('Address 0x4122_0000 set to ' + str(alpha_gpio2) + '.')

