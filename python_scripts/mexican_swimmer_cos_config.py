import os
import sys
import math
from dec2bin import dec2bin, bin2dec

if sys.argv[1] == 'help':
    print('\n\n\n')
    print('----------------------------------------')
    print('First argument is gain (float: 0-1)')
    print('Second argument is output 1')
    print('Third argument is output 2')
    print('Options are: ')
    print('- 0 --> input signal')
    print('- 1 --> rescaled input signal')
    print('- 2 --> unwrapped Wiener process')
    print('- 3 --> sine')
    print('- 4 --> cosine')
    print('- 5 --> wrapped Wiener process')
    print('Fourth argument is the choise of which input to choose:')
    print('1 chooses input 1 and 0 chooses input 2.\n')
    print('Fifth argument is optional and is for refleshing the firmware.')
    print('----------------------------------------')
    print('\n\n\n')
    sys.exit()
    
gain = float(sys.argv[1])
switch1 = int(sys.argv[2])
switch2 = int(sys.argv[3])
which_input = int(sys.argv[4])

code_g = str(int(round(gain*2**32)))

if len(sys.argv) > 5:
    if sys.argv[5] == '1':
        print('Loading the mexican_swimmer-bitstream...')
        os.system('cat bitfiles/mexican_swimmer_cos.bit > /dev/xdevcfg')
        print('mexican_swimmer_cos-bitstream loaded.')

code_switch = str(switch1*2**1 + which_input + switch2*2**4)       

print('Setting the DAC output...')
os.system('monitor 0x41210000 ' + code_switch)
print('Address 0x4121_0000 set to ' + code_switch + '.')

print('Setting gain...')
os.system('monitor 0x41200000 ' + code_g)
print('Address 0x4120_0000 set to ' + code_g + '.')