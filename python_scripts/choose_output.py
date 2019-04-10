import os
import sys

if sys.argv[1] == 'help':
    print('\n\n\n')
    print('----------------------------------------')
    print('Code for possible outputs is the following:')
    print('0 ADC_a')
    print('1 sqrt(abs(ADC_a))')
    print('2 abs(ADC_a)')
    print('3 abs(ADC_a) (this will change in future)')
    print('4 ADC_b*sqrt(abs(ADC_a))')
    print('5 ADC2')
    print('----------------------------------------')
    print('Example string: python ' + sys.argv[0] + ' 0 1')
    print('This generates ADC_a on output a and sqrt(abs(ADC_a)) on output b.')
    print('----------------------------------------')
    print('Add as a third argument "1" if the firmware needs to be reflashed.')
    print('----------------------------------------')
    print('\n\n\n')
    sys.exit()

out1 = sys.argv[1]
out2 = sys.argv[2]
code = str(int(out1) + int(out2)*8)

if len(sys.argv) > 3:
    if sys.argv[3] == '1':
        print('Loading the Boltzmann-bitstream...')
        os.system('cat bitfiles/boltzmann.bit > /dev/xdevcfg')
        print('Boltmann-bitstream loaded.')

print('Setting the DAC output...')
os.system('monitor 0x41200000 ' + code)
print('Address 0x4120_0000 set to ' + code + '.')
