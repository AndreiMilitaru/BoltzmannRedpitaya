'''
@ author: Andrei Militaru
@ date: 2nd of April 2019
'''

import numpy as np
import sys

'''
-------------------------------------------
User defined values:
'''
input_bits = 15
output_bits = 14
path = '../vhdl/'
module_name = 'sine'
hdl = '.v'
current_dir = 'https://git.ee.ethz.ch/andreimi/boltzmann_redpitaya/tree/master/python_scripts/'
'''
------------------------------------------
'''

gain = 2**(output_bits-1) - 1
boundary = 2**(input_bits-1) - 1


def func(x):
    global gain
    global boundary
    return int(round(gain * np.sin(np.pi/float(boundary)*float(x))))

def for_script(x):
    y = func(x)
    return str(np.abs(y))
    

with open(path + module_name + hdl,'w') as script:
    inputs = [i for i in range(-2**(input_bits-1), 2**(input_bits-1))]

    script.write('/////////////////////////////////////////////////////////\n')
    script.write('// author: Andrei Militaru \n')
    script.write('// date: 18th of September 2019 \n')
    script.write('// Script automatically generated by ' + current_dir + sys.argv[0] + '\n')
    script.write('/////////////////////////////////////////////////////////\n')

    script.write('module ' + module_name + ' (\n')
    script.write('\tinput wire [' + str(input_bits-1) + ':0] data_i,\n')
    script.write('\tinput wire clk_i,\n')
    script.write('\tinput wire rst_i,\n')
    script.write('\toutput wire signed [' + str(output_bits-1) + ':0] data_o\n')
    script.write('\t);\n\n')
    script.write('\treg signed [' + str(output_bits-1) + ':0] data_d, data_q;\n')
    script.write('\tassign data_o = data_q;\n\n')

    script.write('\talways @(posedge clk_i) begin\t\t// internal flip flop\n')
    script.write('\t\tif (rst_i) begin\n')
    script.write('\t\t\tdata_q <= ' + str(input_bits) + '\'d0;\n')
    script.write('\t\tend else begin\n')
    script.write('\t\t\tdata_q <= data_d;\n')
    script.write('\t\tend\n')
    script.write('\tend\n\n')

    script.write('\talways @(data_i) begin\t\t// implementation of look up table\n')
    script.write('\t\tcase(data_i)\n')

    indentation = '\t\t\t'
    for value in inputs:
        out_str = for_script(value)
        out_value = func(value)
        sign_str = '-' if out_value < 0 else ''
        in_sign_str = '-' if value < 0 else ''
        comment = '\t// ' + str(gain) + ' * sin(pi/' + str(boundary) + ' ' + str(value) + ') = ' + '{:d}'.format(func(value)) + '\n'
        to_script = indentation + in_sign_str + str(input_bits) + '\'d' + str(np.abs(value)) + (
                    ': ' + 'data_d = ' + sign_str + str(output_bits) + '\'d' + out_str + ';' + comment)
        script.write(to_script)
    script.write('\t\t\tdefault: data_d = ' + str(output_bits) + '\'d0;\n')
    script.write('\t\tendcase\n')
    script.write('\tend\n')
    script.write('endmodule\n')
