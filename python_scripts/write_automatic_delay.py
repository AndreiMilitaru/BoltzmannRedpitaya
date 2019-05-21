'''
@ author: Andrei Militaru
@ date: 21st of May 2019
'''

import subprocess

'''
-------------------------------------------
User defined values:
'''
# number of inputs of each of the signals that need to be multiplexed
input_bits = 16

# number of signals that need to be multiplexed
delay_channels = 256

'''
------------------------------------------
'''

subprocess.run('python write_argv_MUX.py ' + str(input_bits) + ' ' + str(delay_channels))
subprocess.run('python write_argv_shift_register_chain.py ' + str(input_bits) + ' ' + str(delay_channels))
subprocess.run('python write_argv_delay_module.py ' + str(input_bits) + ' ' + str(delay_channels))