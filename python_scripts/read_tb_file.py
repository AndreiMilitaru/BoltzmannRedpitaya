from dec2bin import dec2bin, bin2dec
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
import sys
sys.path.append("C:/Users/m21/Documents/git_projects/gradient_descent")
from function import set_ax


with open('tb_file.tv','r') as stimuli:
    inputs = stimuli.readlines()
    
input_data = [bin2dec(i[:-1], twos_complement = True) for i in inputs]
N = len(input_data)
    
output_files = ['tb_file_resp1.tv',
                'tb_file_resp2.tv',
                'tb_file_resp3.tv',
                'tb_file_resp4.tv',
                'tb_file_resp5.tv',
                'tb_file_resp6.tv',
                'tb_file_resp7.tv']
                
N_files = len(output_files)
                
output_data = []
                
alphas = np.array([1e-5,1e-4,1e-3,1e-2,1e-1,0.5,1.0])
                
for current_file in output_files:
    with open(current_file,'r') as response:
        output_binary = response.readlines()
        output_data.append([bin2dec(i[:-1],
                                     twos_complement = True) for i in output_binary[:N]])

N = len(input_data)

dt = 8/125e6

time = np.linspace(0,N*dt,N)
fs = 1/dt

fig = plt.figure(figsize = (7,5))
#ax1 = fig.add_subplot(211)
ax2 = fig.add_subplot(111)

xlabel1 = 'Time [ms]'
xlabel2 = 'Frequency [kHz]'
ylabel2 = r'PSD [bits$^2$/Hz]'
ylabel1 = 'Amplitude [bits]'
#ax1.plot(time/1e-3, input_data,linewidth = 0.5, label = 'input')

freq, PSD = signal.welch(input_data, fs = fs, nperseg = int(N//4))
ax2.semilogy(freq/1e3, PSD, linewidth = 2, label = 'input')

for i in range(N_files):
    #ax1.plot(time/1e-3, output_data[i],linewidth = 0.5, label = r'$\alpha$ = {:f}'.format(alphas[i]))
    freq, PSD = signal.welch(output_data[i], fs = fs, nperseg = int(N//4))
    ax2.loglog(freq/1e3, PSD, linewidth = 2, label = r'$\alpha$ = {:1.0e}'.format(alphas[i]))
    
title = 'Testbench results'

#set_ax(ax1, xlabel = xlabel1, ylabel = ylabel1, legend = True)
set_ax(ax2, xlabel = xlabel2, ylabel = ylabel2, legend = True, title = title)

plt.tight_layout()

fig.savefig('Z:/shared/Programming/for_Redpitaya/plots/testbench_mexican_swimmer.pdf')
fig.savefig('Z:/shared/Programming/for_Redpitaya/plots/testbench_mexican_swimmer.png')
plt.show()

"""
with open('tb_file_sine.tv','r') as stimuli:
    inputs = stimuli.readlines()
    
with open('tb_file_sine_out.tv','r') as stimuli:
    outputs = stimuli.readlines()
N = len(inputs)
inputs_num = [bin2dec(i[:-1], twos_complement = True) for i in inputs]
outputs_num = [bin2dec(i[:-1], twos_complement = True) for i in outputs[:N]]

plt.plot(np.array(inputs_num))
plt.plot(np.array(outputs_num))
plt.show()
"""