# ADC

add_files -norecurse cores/axis_red_pitaya_adc_v1_0/axis_red_pitaya_adc.v
create_bd_cell -type module -reference axis_red_pitaya_adc axis_red_pitaya_adc_0
connect_bd_net [get_bd_ports adc_clk_n_i] [get_bd_pins axis_red_pitaya_adc_0/adc_clk_n]
connect_bd_net [get_bd_ports adc_clk_p_i] [get_bd_pins axis_red_pitaya_adc_0/adc_clk_p]
connect_bd_net [get_bd_ports adc_dat_a_i] [get_bd_pins axis_red_pitaya_adc_0/adc_dat_a]
connect_bd_net [get_bd_ports adc_dat_b_i] [get_bd_pins axis_red_pitaya_adc_0/adc_dat_b]
connect_bd_net [get_bd_ports adc_csn_o] [get_bd_pins axis_red_pitaya_adc_0/adc_csn]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins axis_red_pitaya_dac_0/s_axis_tvalid]



# DAC

add_files -norecurse cores/axis_red_pitaya_dac_v1_0/axis_red_pitaya_dac.v
create_bd_cell -type module -reference axis_red_pitaya_dac axis_red_pitaya_dac_0
connect_bd_net [get_bd_ports dac_sel_o] [get_bd_pins axis_red_pitaya_dac_0/dac_sel]
connect_bd_net [get_bd_ports dac_wrt_o] [get_bd_pins axis_red_pitaya_dac_0/dac_wrt]
connect_bd_net [get_bd_ports dac_dat_o] [get_bd_pins axis_red_pitaya_dac_0/dac_dat]
connect_bd_net [get_bd_ports dac_rst_o] [get_bd_pins axis_red_pitaya_dac_0/dac_rst]
connect_bd_net [get_bd_ports dac_clk_o] [get_bd_pins axis_red_pitaya_dac_0/dac_clk]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_0
set_property -dict [list CONFIG.PRIM_IN_FREQ.VALUE_SRC USER] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.PRIM_IN_FREQ {125.000} CONFIG.USE_RESET {false}] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {250}] [get_bd_cells clk_wiz_0]
endgroup

connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins axis_red_pitaya_dac_0/locked]
connect_bd_net [get_bd_pins axis_red_pitaya_dac_0/ddr_clk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_pins axis_red_pitaya_dac_0/aclk] [get_bd_pins clk_wiz_0/clk_in1]

connect_bd_net [get_bd_pins axis_red_pitaya_adc_0/adc_clk] [get_bd_pins axis_red_pitaya_dac_0/aclk]


#NCO

create_bd_cell -type module -reference waveform_gen waveform_gen_0

connect_bd_net [get_bd_pins waveform_gen_0/reset] [get_bd_pins rst_ps7_0_125M/peripheral_aresetn]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins waveform_gen_0/en]

connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins axi_gpio_0/gpio_io_o]

connect_bd_net [get_bd_pins waveform_gen_0/clk] [get_bd_pins axis_red_pitaya_adc_0/adc_clk]

















regenerate_bd_layout
