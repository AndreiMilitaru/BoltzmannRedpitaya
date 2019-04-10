import os
import sys
import math

if sys.argv[1] == 'help':
    print('\n\n\n')
    print('----------------------------------------')
    print('First argument is gain (1-65536)')
    print('Second argument is cutoff frequency (0.0-1.0)')
    print('Third argument is offset (1-65536)')
    print('Fourth argument is output 1')
    print('Fifth argument is output 2')
    print('Options are: ')
    print('- 0 --> input signal')
    print('- 1 --> out1[15:2]')
    print('- 2 --> out1[13:0]')
    print('- 3 --> out1[17:4]')
    
    print('Sixth argument is the control for the LED lights:')
    print('0 for DAC output/ 1 for gain')
    
    print('Sixth argument is optional and is for refleshing the firmware.')
    
    print('----------------------------------------')
    print('Example string: python ' + sys.argv[0] + ' 30000 150')
    print('----------------------------------------')
    print('Add as a third argument "1" if the firmware needs to be reflashed.')
    print('----------------------------------------')
    print('\n\n\n')
    sys.exit()
    
gain = int(sys.argv[1])
cutoff_f = float(sys.argv[2])
offset = int(sys.argv[3])
switch1 = int(sys.argv[4])
switch2 = int(sys.argv[5])
led = int(sys.argv[6])

alpha = int(cutoff_f * 2**32)

print('True cutoff frequency is: ' + '{:.6f}'.format(round(cutoff_f*2**32)/2**32))

code_g = str(gain + 2**16*offset)
code_a = str(alpha)

if len(sys.argv) > 7:
    if sys.argv[7] == '1':
        print('Loading the mexican_swimmer-bitstream...')
        os.system('cat bitfiles/mexican_swimmer.bit > /dev/xdevcfg')
        print('mexican_swimmer-bitstream loaded.')

code_switch = str(switch1*8 + switch2 + led*2**6)       
print('Setting the DAC output...')
os.system('monitor 0x41210000 ' + code_switch)
print('Address 0x4121_0000 set to ' + code_switch + '.')

print('Setting gain...')
os.system('monitor 0x41200000 ' + code_g)
print('Address 0x4120_0000 set to ' + code_g + '.')

print('Setting cutoff frequency...')
os.system('monitor 0x41220000 ' + code_a)
print('Address 0x4122_0000 set to ' + code_a + '.')

