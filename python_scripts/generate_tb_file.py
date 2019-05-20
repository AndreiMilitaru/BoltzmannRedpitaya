from dec2bin import dec2bin
import random
import numpy as np

bits = 16
N_stimuli = 50000

fs = 125e6/4
dt = 1/fs
f = 500000e3
tmax = N_stimuli * dt

"""
with open('tb_file.tv','w') as stimuli:
    max = 2**(bits-1)-1
    min = -2**(bits-1)
    for i in range(N_stimuli):
        input_stimulus = np.random.normal(scale = (max-min) / 10)
        stimuli.write(dec2bin(int(input_stimulus),
                              width = bits,
                              twos_complement = True) + '\n')
"""


with open('tb_file_sine.tv','w') as stimuli:
    t = np.linspace(0.0,tmax,N_stimuli)
    y = 0.9 * np.sin(2*np.pi*f*t)
    for i in range(N_stimuli):
        input_stimulus = int(round(y[i] * 2**(bits-1)))
        stimuli.write(dec2bin(input_stimulus,
                              width = bits,
                              twos_complement = True) + '\n')
