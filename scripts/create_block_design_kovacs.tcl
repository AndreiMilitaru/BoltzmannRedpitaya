
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axis_red_pitaya_adc, input_extractor, axis_red_pitaya_dac, dac_out_switch, delay_wrapper, delay_max256clocks, delay_max256clocks, offset_rescaler, sqrtLUT

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z010clg400-1
}


# CHANGE DESIGN NAME HERE
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: soc
proc create_hier_cell_soc { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_soc() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M03_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M04_AXI

  # Create pins
  create_bd_pin -dir O -type clk FCLK_CLK0
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_IMPORT_BOARD_PRESET {cfg/red_pitaya.xml} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {6} \
 ] $ps7_0_axi_periph

  # Create instance: rst_ps7_0_125M, and set properties
  set rst_ps7_0_125M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_125M ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M00_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M01_AXI] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins M02_AXI] [get_bd_intf_pins ps7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M03_AXI] [get_bd_intf_pins ps7_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins M04_AXI] [get_bd_intf_pins ps7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins rst_ps7_0_125M/interconnect_aresetn]
  connect_bd_net -net M00_ACLK_1 [get_bd_pins clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/M02_ACLK] [get_bd_pins ps7_0_axi_periph/M03_ACLK] [get_bd_pins ps7_0_axi_periph/M04_ACLK] [get_bd_pins ps7_0_axi_periph/M05_ACLK]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/M02_ARESETN] [get_bd_pins ps7_0_axi_periph/M03_ARESETN] [get_bd_pins ps7_0_axi_periph/M04_ARESETN] [get_bd_pins ps7_0_axi_periph/M05_ARESETN]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins FCLK_CLK0] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins rst_ps7_0_125M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_125M/ext_reset_in]
  connect_bd_net -net rst_ps7_0_125M_peripheral_aresetn [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_125M/peripheral_aresetn]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Processing
proc create_hier_cell_Processing { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Processing() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 15 -to 0 -type data A
  create_bd_pin -dir I -from 15 -to 0 -type data B
  create_bd_pin -dir I -from 15 -to 0 -type data B1
  create_bd_pin -dir I -from 15 -to 0 -type data B2
  create_bd_pin -dir I -from 15 -to 0 -type data B3
  create_bd_pin -dir O -from 15 -to 0 -type data S
  create_bd_pin -dir I clk_i
  create_bd_pin -dir O -from 15 -to 0 data_o
  create_bd_pin -dir O -from 15 -to 0 data_o1
  create_bd_pin -dir O -from 15 -to 0 data_o2
  create_bd_pin -dir O -from 15 -to 0 data_o3
  create_bd_pin -dir I rst_i
  create_bd_pin -dir I -from 7 -to 0 sel_i

  # Create instance: delay_wrapper_0, and set properties
  set block_name delay_wrapper
  set block_cell_name delay_wrapper_0
  if { [catch {set delay_wrapper_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delay_wrapper_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: delayed_input, and set properties
  set block_name delay_max256clocks
  set block_cell_name delayed_input
  if { [catch {set delayed_input [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delayed_input eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: delayed_volatility, and set properties
  set block_name delay_max256clocks
  set block_cell_name delayed_volatility
  if { [catch {set delayed_volatility [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delayed_volatility eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: extract_bits, and set properties
  set extract_bits [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 extract_bits ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DIN_WIDTH {32} \
CONFIG.DOUT_WIDTH {16} \
 ] $extract_bits

  # Create instance: final_sum, and set properties
  set final_sum [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 final_sum ]
  set_property -dict [ list \
CONFIG.A_Width {32} \
CONFIG.B_Value {00000000000000000000000000000000} \
CONFIG.B_Width {32} \
CONFIG.CE {false} \
CONFIG.Implementation {Fabric} \
CONFIG.Latency {0} \
CONFIG.Out_Width {32} \
 ] $final_sum

  # Create instance: noise_adjuster, and set properties
  set noise_adjuster [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 noise_adjuster ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $noise_adjuster

  # Create instance: noise_amplifier, and set properties
  set noise_amplifier [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 noise_amplifier ]
  set_property -dict [ list \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {0} \
CONFIG.PortAWidth {16} \
CONFIG.PortBWidth {16} \
 ] $noise_amplifier

  # Create instance: offset_rescaler_0, and set properties
  set block_name offset_rescaler
  set block_cell_name offset_rescaler_0
  if { [catch {set offset_rescaler_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $offset_rescaler_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: shift_singularity, and set properties
  set shift_singularity [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 shift_singularity ]
  set_property -dict [ list \
CONFIG.A_Width {16} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.CE {false} \
CONFIG.Implementation {Fabric} \
CONFIG.Latency {0} \
CONFIG.Out_Width {16} \
 ] $shift_singularity

  # Create instance: sqrtLUT_0, and set properties
  set block_name sqrtLUT
  set block_cell_name sqrtLUT_0
  if { [catch {set sqrtLUT_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sqrtLUT_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: sqrt_noise_multiplier_1, and set properties
  set sqrt_noise_multiplier_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 sqrt_noise_multiplier_1 ]
  set_property -dict [ list \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {4} \
CONFIG.PortAWidth {16} \
CONFIG.PortBWidth {16} \
 ] $sqrt_noise_multiplier_1

  # Create port connections
  connect_bd_net -net B1_1 [get_bd_pins B1] [get_bd_pins sqrt_noise_multiplier_1/A]
  connect_bd_net -net B3_1 [get_bd_pins B3] [get_bd_pins offset_rescaler_0/data_i]
  connect_bd_net -net adc_adc_a [get_bd_pins A] [get_bd_pins delayed_input/data_i] [get_bd_pins shift_singularity/A]
  connect_bd_net -net adc_adc_b [get_bd_pins B] [get_bd_pins sqrt_noise_multiplier_1/B]
  connect_bd_net -net c_addsub_0_S [get_bd_pins S] [get_bd_pins shift_singularity/S] [get_bd_pins sqrtLUT_0/data_i]
  connect_bd_net -net clk_1 [get_bd_pins clk_i] [get_bd_pins delay_wrapper_0/clk_i] [get_bd_pins delayed_input/clk_i] [get_bd_pins delayed_volatility/clk_i] [get_bd_pins sqrtLUT_0/clk_i] [get_bd_pins sqrt_noise_multiplier_1/CLK]
  connect_bd_net -net delay_max256clocks_1_data_o [get_bd_pins data_o1] [get_bd_pins delayed_volatility/data_o]
  connect_bd_net -net delay_max256clocks_2_data_o [get_bd_pins data_o2] [get_bd_pins delayed_input/data_o]
  connect_bd_net -net delay_wrapper_0_data_o [get_bd_pins data_o3] [get_bd_pins delay_wrapper_0/data_o]
  connect_bd_net -net extract_bits_Dout [get_bd_pins delay_wrapper_0/data_i] [get_bd_pins extract_bits/Dout]
  connect_bd_net -net final_sum_S [get_bd_pins extract_bits/Din] [get_bd_pins final_sum/S]
  connect_bd_net -net noise_amplifier_P [get_bd_pins final_sum/A] [get_bd_pins noise_amplifier/P]
  connect_bd_net -net offset_rescaler_0_data_o [get_bd_pins final_sum/B] [get_bd_pins offset_rescaler_0/data_o]
  connect_bd_net -net sel_i_1 [get_bd_pins sel_i] [get_bd_pins delay_wrapper_0/sel_i] [get_bd_pins delayed_input/sel_i] [get_bd_pins delayed_volatility/sel_i]
  connect_bd_net -net sqrtLUT_0_data_o [get_bd_pins data_o] [get_bd_pins delayed_volatility/data_i] [get_bd_pins noise_amplifier/B] [get_bd_pins sqrtLUT_0/data_o]
  connect_bd_net -net sqrt_noise_multiplier_1_P [get_bd_pins noise_adjuster/Din] [get_bd_pins sqrt_noise_multiplier_1/P]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins rst_i] [get_bd_pins delay_wrapper_0/rst_i] [get_bd_pins delayed_input/rst_i] [get_bd_pins delayed_volatility/rst_i] [get_bd_pins sqrtLUT_0/rst_i]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins B2] [get_bd_pins shift_singularity/B]
  connect_bd_net -net xlslice_0_Dout1 [get_bd_pins noise_adjuster/Dout] [get_bd_pins noise_amplifier/A]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Output_formatting
proc create_hier_cell_Output_formatting { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Output_formatting() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 31 -to 0 Din
  create_bd_pin -dir I -from 15 -to 0 Din1
  create_bd_pin -dir I -from 15 -to 0 Din2
  create_bd_pin -dir I -from 15 -to 0 Din3
  create_bd_pin -dir I -from 15 -to 0 Din4
  create_bd_pin -dir I -from 15 -to 0 Din5
  create_bd_pin -dir I -from 15 -to 0 Din6
  create_bd_pin -dir I -from 15 -to 0 Din7
  create_bd_pin -dir O -from 13 -to 0 Dout
  create_bd_pin -dir O -from 13 -to 0 Dout1
  create_bd_pin -dir O -from 13 -to 0 Dout2
  create_bd_pin -dir O -from 13 -to 0 Dout3
  create_bd_pin -dir O -from 13 -to 0 Dout4
  create_bd_pin -dir O -from 13 -to 0 Dout5
  create_bd_pin -dir O -from 13 -to 0 Dout6
  create_bd_pin -dir O -from 13 -to 0 Dout7

  # Create instance: DC, and set properties
  set DC [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 DC ]
  set_property -dict [ list \
CONFIG.DIN_FROM {13} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {32} \
CONFIG.DOUT_WIDTH {14} \
 ] $DC

  # Create instance: delayed_input, and set properties
  set delayed_input [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 delayed_input ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $delayed_input

  # Create instance: delayed_sqrt, and set properties
  set delayed_sqrt [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 delayed_sqrt ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $delayed_sqrt

  # Create instance: final_output, and set properties
  set final_output [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 final_output ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $final_output

  # Create instance: initial_input, and set properties
  set initial_input [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 initial_input ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $initial_input

  # Create instance: initial_noise, and set properties
  set initial_noise [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 initial_noise ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $initial_noise

  # Create instance: offset_input, and set properties
  set offset_input [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 offset_input ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $offset_input

  # Create instance: sqrt_input, and set properties
  set sqrt_input [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sqrt_input ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {14} \
 ] $sqrt_input

  # Create port connections
  connect_bd_net -net DC_Dout [get_bd_pins Dout] [get_bd_pins DC/Dout]
  connect_bd_net -net Din7_1 [get_bd_pins Din7] [get_bd_pins delayed_input/Din]
  connect_bd_net -net GPIO_gpio_io_o3 [get_bd_pins Din] [get_bd_pins DC/Din]
  connect_bd_net -net adc_adc_a [get_bd_pins Din6] [get_bd_pins initial_input/Din]
  connect_bd_net -net adc_adc_b [get_bd_pins Din3] [get_bd_pins initial_noise/Din]
  connect_bd_net -net c_addsub_0_S [get_bd_pins Din4] [get_bd_pins offset_input/Din]
  connect_bd_net -net delay_max256clocks_0_data_o [get_bd_pins Din2] [get_bd_pins final_output/Din]
  connect_bd_net -net delay_max256clocks_1_data_o [get_bd_pins Din5] [get_bd_pins delayed_sqrt/Din]
  connect_bd_net -net delayed_input_Dout [get_bd_pins Dout7] [get_bd_pins delayed_input/Dout]
  connect_bd_net -net delayed_sqrt_Dout [get_bd_pins Dout5] [get_bd_pins delayed_sqrt/Dout]
  connect_bd_net -net final_output_Dout [get_bd_pins Dout2] [get_bd_pins final_output/Dout]
  connect_bd_net -net initial_input_Dout [get_bd_pins Dout6] [get_bd_pins initial_input/Dout]
  connect_bd_net -net initial_noise_Dout [get_bd_pins Dout3] [get_bd_pins initial_noise/Dout]
  connect_bd_net -net offset_input_Dout [get_bd_pins Dout4] [get_bd_pins offset_input/Dout]
  connect_bd_net -net sqrtLUT_0_data_o [get_bd_pins Din1] [get_bd_pins sqrt_input/Din]
  connect_bd_net -net sqrt_input_Dout [get_bd_pins Dout1] [get_bd_pins sqrt_input/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Control_bits
proc create_hier_cell_Control_bits { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Control_bits() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 31 -to 0 Din1
  create_bd_pin -dir I -from 31 -to 0 Din2
  create_bd_pin -dir O -from 15 -to 0 Dout1
  create_bd_pin -dir O -from 15 -to 0 Dout2
  create_bd_pin -dir O -from 7 -to 0 Dout3
  create_bd_pin -dir O -from 15 -to 0 Dout4

  # Create instance: final_offset, and set properties
  set final_offset [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 final_offset ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $final_offset

  # Create instance: gain, and set properties
  set gain [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 gain ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DOUT_WIDTH {16} \
 ] $gain

  # Create instance: offset_inside_sqrt, and set properties
  set offset_inside_sqrt [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 offset_inside_sqrt ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $offset_inside_sqrt

  # Create instance: sel, and set properties
  set sel [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sel ]
  set_property -dict [ list \
CONFIG.DIN_FROM {13} \
CONFIG.DIN_TO {6} \
CONFIG.DOUT_WIDTH {8} \
 ] $sel

  # Create port connections
  connect_bd_net -net GPIO_gpio_io_o1 [get_bd_pins Din1] [get_bd_pins gain/Din] [get_bd_pins offset_inside_sqrt/Din]
  connect_bd_net -net Net [get_bd_pins Din2] [get_bd_pins final_offset/Din] [get_bd_pins sel/Din]
  connect_bd_net -net final_offset_Dout [get_bd_pins Dout4] [get_bd_pins final_offset/Dout]
  connect_bd_net -net gain_Dout [get_bd_pins Dout1] [get_bd_pins gain/Dout]
  connect_bd_net -net sel_Dout [get_bd_pins Dout3] [get_bd_pins sel/Dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins Dout2] [get_bd_pins offset_inside_sqrt/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: dac
proc create_hier_cell_dac { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_dac() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk Clk_CI
  create_bd_pin -dir I -from 13 -to 0 In0_DI
  create_bd_pin -dir I -from 13 -to 0 In1_DI
  create_bd_pin -dir I -from 13 -to 0 In2_DI
  create_bd_pin -dir I -from 13 -to 0 In3_DI
  create_bd_pin -dir I -from 13 -to 0 In4_DI
  create_bd_pin -dir I -from 13 -to 0 In5_DI
  create_bd_pin -dir I -from 13 -to 0 In6_DI
  create_bd_pin -dir I -from 13 -to 0 In7_DI
  create_bd_pin -dir I -type rst Reset_RBI
  create_bd_pin -dir I -from 2 -to 0 SwitchDac0_SI
  create_bd_pin -dir I -from 2 -to 0 SwitchDac1_SI
  create_bd_pin -dir I Valid0_SI
  create_bd_pin -dir I Valid1_SI
  create_bd_pin -dir I Valid2_SI
  create_bd_pin -dir I Valid3_SI
  create_bd_pin -dir I Valid4_SI
  create_bd_pin -dir I Valid5_SI
  create_bd_pin -dir I Valid6_SI
  create_bd_pin -dir I Valid7_SI
  create_bd_pin -dir O -type clk dac_clk
  create_bd_pin -dir O -from 13 -to 0 dac_dat
  create_bd_pin -dir O -type rst dac_rst
  create_bd_pin -dir O dac_sel
  create_bd_pin -dir O dac_wrt

  # Create instance: axis_red_pitaya_dac_0, and set properties
  set block_name axis_red_pitaya_dac
  set block_cell_name axis_red_pitaya_dac_0
  if { [catch {set axis_red_pitaya_dac_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_red_pitaya_dac_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKIN1_JITTER_PS {80.0} \
CONFIG.CLKOUT1_JITTER {104.759} \
CONFIG.CLKOUT1_PHASE_ERROR {96.948} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {250.000} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.000} \
CONFIG.MMCM_CLKIN1_PERIOD {8.000} \
CONFIG.MMCM_CLKIN2_PERIOD {10.000} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.000} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_IN_FREQ {125} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: dac_out_switch_0, and set properties
  set block_name dac_out_switch
  set block_cell_name dac_out_switch_0
  if { [catch {set dac_out_switch_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dac_out_switch_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net Clk_CI_1 [get_bd_pins Clk_CI] [get_bd_pins axis_red_pitaya_dac_0/aclk] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins dac_out_switch_0/Clk_CI]
  connect_bd_net -net In0_DI_1 [get_bd_pins In0_DI] [get_bd_pins dac_out_switch_0/In0_DI]
  connect_bd_net -net In1_DI_1 [get_bd_pins In1_DI] [get_bd_pins dac_out_switch_0/In1_DI]
  connect_bd_net -net In2_DI_1 [get_bd_pins In2_DI] [get_bd_pins dac_out_switch_0/In2_DI]
  connect_bd_net -net In3_DI_1 [get_bd_pins In3_DI] [get_bd_pins dac_out_switch_0/In3_DI]
  connect_bd_net -net In4_DI_1 [get_bd_pins In4_DI] [get_bd_pins dac_out_switch_0/In4_DI]
  connect_bd_net -net In5_DI_1 [get_bd_pins In5_DI] [get_bd_pins dac_out_switch_0/In5_DI]
  connect_bd_net -net In6_DI_1 [get_bd_pins In6_DI] [get_bd_pins dac_out_switch_0/In6_DI]
  connect_bd_net -net In7_DI_1 [get_bd_pins In7_DI] [get_bd_pins dac_out_switch_0/In7_DI]
  connect_bd_net -net Reset_RBI_1 [get_bd_pins Reset_RBI] [get_bd_pins dac_out_switch_0/Reset_RBI]
  connect_bd_net -net SwitchDac0_SI_1 [get_bd_pins SwitchDac0_SI] [get_bd_pins dac_out_switch_0/SwitchDac0_SI]
  connect_bd_net -net SwitchDac1_SI_1 [get_bd_pins SwitchDac1_SI] [get_bd_pins dac_out_switch_0/SwitchDac1_SI]
  connect_bd_net -net Valid0_SI_1 [get_bd_pins Valid0_SI] [get_bd_pins dac_out_switch_0/Valid0_SI]
  connect_bd_net -net Valid1_SI_1 [get_bd_pins Valid1_SI] [get_bd_pins dac_out_switch_0/Valid1_SI]
  connect_bd_net -net Valid2_SI_1 [get_bd_pins Valid2_SI] [get_bd_pins dac_out_switch_0/Valid2_SI]
  connect_bd_net -net Valid3_SI_1 [get_bd_pins Valid3_SI] [get_bd_pins dac_out_switch_0/Valid3_SI]
  connect_bd_net -net Valid4_SI_1 [get_bd_pins Valid4_SI] [get_bd_pins dac_out_switch_0/Valid4_SI]
  connect_bd_net -net Valid5_SI_1 [get_bd_pins Valid5_SI] [get_bd_pins dac_out_switch_0/Valid5_SI]
  connect_bd_net -net Valid6_SI_1 [get_bd_pins Valid6_SI] [get_bd_pins dac_out_switch_0/Valid6_SI]
  connect_bd_net -net Valid7_SI_1 [get_bd_pins Valid7_SI] [get_bd_pins dac_out_switch_0/Valid7_SI]
  connect_bd_net -net axis_red_pitaya_dac_0_dac_clk [get_bd_pins dac_clk] [get_bd_pins axis_red_pitaya_dac_0/dac_clk]
  connect_bd_net -net axis_red_pitaya_dac_0_dac_dat [get_bd_pins dac_dat] [get_bd_pins axis_red_pitaya_dac_0/dac_dat]
  connect_bd_net -net axis_red_pitaya_dac_0_dac_rst [get_bd_pins dac_rst] [get_bd_pins axis_red_pitaya_dac_0/dac_rst]
  connect_bd_net -net axis_red_pitaya_dac_0_dac_sel [get_bd_pins dac_sel] [get_bd_pins axis_red_pitaya_dac_0/dac_sel]
  connect_bd_net -net axis_red_pitaya_dac_0_dac_wrt [get_bd_pins dac_wrt] [get_bd_pins axis_red_pitaya_dac_0/dac_wrt]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axis_red_pitaya_dac_0/ddr_clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins axis_red_pitaya_dac_0/locked] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net dac_out_switch_0_DacOut_DO [get_bd_pins axis_red_pitaya_dac_0/s_axis_tdata] [get_bd_pins dac_out_switch_0/DacOut_DO]
  connect_bd_net -net dac_out_switch_0_Valid_SO [get_bd_pins axis_red_pitaya_dac_0/s_axis_tvalid] [get_bd_pins dac_out_switch_0/Valid_SO]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: adc
proc create_hier_cell_adc { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_adc() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 15 -to 0 adc_a
  create_bd_pin -dir O -from 15 -to 0 adc_b
  create_bd_pin -dir O adc_clk
  create_bd_pin -dir I -type clk adc_clk_n
  create_bd_pin -dir I -type clk adc_clk_p
  create_bd_pin -dir O adc_csn
  create_bd_pin -dir I -from 13 -to 0 adc_dat_a
  create_bd_pin -dir I -from 13 -to 0 adc_dat_b

  # Create instance: axis_red_pitaya_adc_verilog, and set properties
  set block_name axis_red_pitaya_adc_verilog
  set block_cell_name axis_red_pitaya_adc_verilog0
  if { [catch {set axis_red_pitaya_adc_verilog0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_red_pitaya_adc_verilog0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: input_extractor_0, and set properties
  set block_name input_extractor
  set block_cell_name input_extractor_0
  if { [catch {set input_extractor_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $input_extractor_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net adc_clk_n_1 [get_bd_pins adc_clk_n] [get_bd_pins axis_red_pitaya_adc_verilog0/adc_clk_n]
  connect_bd_net -net adc_clk_p_1 [get_bd_pins adc_clk_p] [get_bd_pins axis_red_pitaya_adc_verilog0/adc_clk_p]
  connect_bd_net -net adc_dat_a_1 [get_bd_pins adc_dat_a] [get_bd_pins axis_red_pitaya_adc_verilog0/adc_dat_a]
  connect_bd_net -net adc_dat_b_1 [get_bd_pins adc_dat_b] [get_bd_pins axis_red_pitaya_adc_verilog0/adc_dat_b]
  connect_bd_net -net axis_red_pitaya_adc_0_adc_clk [get_bd_pins adc_clk] [get_bd_pins axis_red_pitaya_adc_verilog0/adc_clk]
  connect_bd_net -net axis_red_pitaya_adc_0_adc_csn [get_bd_pins adc_csn] [get_bd_pins axis_red_pitaya_adc_verilog0/adc_csn]
  connect_bd_net -net axis_red_pitaya_adc_0_m_axis_tdata [get_bd_pins axis_red_pitaya_adc_verilog0/m_axis_tdata] [get_bd_pins input_extractor_0/bundle_i]
  connect_bd_net -net input_extractor_0_adcA_o [get_bd_pins adc_a] [get_bd_pins input_extractor_0/adcA_o]
  connect_bd_net -net input_extractor_0_adcB_o [get_bd_pins adc_b] [get_bd_pins input_extractor_0/adcB_o]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: GPIO
proc create_hier_cell_GPIO { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_GPIO() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 GPIO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 GPIO2

  # Create pins
  create_bd_pin -dir O -type clk FCLK_CLK0
  create_bd_pin -dir O -from 31 -to 0 gpio2_io_o
  create_bd_pin -dir O -from 31 -to 0 gpio2_io_o1
  create_bd_pin -dir O -from 31 -to 0 gpio2_io_o2
  create_bd_pin -dir O -from 31 -to 0 gpio_io_o
  create_bd_pin -dir O -from 31 -to 0 gpio_io_o1
  create_bd_pin -dir O -from 31 -to 0 gpio_io_o2
  create_bd_pin -dir O -from 31 -to 0 gpio_io_o3
  create_bd_pin -dir O -from 31 -to 0 gpio_io_o4
  create_bd_pin -dir I -type clk s_axi_aclk

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_0

  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [ list \
CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_1

  # Create instance: axi_gpio_2, and set properties
  set axi_gpio_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_2 ]
  set_property -dict [ list \
CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_2

  # Create instance: axi_gpio_3, and set properties
  set axi_gpio_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_3 ]

  # Create instance: soc
  create_hier_cell_soc $hier_obj soc

  # Create interface connections
  connect_bd_intf_net -intf_net soc_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins soc/DDR]
  connect_bd_intf_net -intf_net soc_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins soc/FIXED_IO]
  connect_bd_intf_net -intf_net soc_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins soc/M00_AXI]
  connect_bd_intf_net -intf_net soc_M01_AXI [get_bd_intf_pins axi_gpio_1/S_AXI] [get_bd_intf_pins soc/M01_AXI]
  connect_bd_intf_net -intf_net soc_M02_AXI [get_bd_intf_pins axi_gpio_2/S_AXI] [get_bd_intf_pins soc/M02_AXI]
  connect_bd_intf_net -intf_net soc_M03_AXI [get_bd_intf_pins axi_gpio_3/S_AXI] [get_bd_intf_pins soc/M03_AXI]

  # Create port connections
  connect_bd_net -net axi_gpio_0_gpio2_io_o [get_bd_pins gpio2_io_o] [get_bd_pins axi_gpio_0/gpio2_io_i] [get_bd_pins axi_gpio_0/gpio2_io_o]
  connect_bd_net -net axi_gpio_0_gpio_io_o1 [get_bd_pins gpio_io_o] [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins axi_gpio_0/gpio_io_o]
  connect_bd_net -net axi_gpio_1_gpio2_io_o [get_bd_pins gpio2_io_o1] [get_bd_pins axi_gpio_1/gpio2_io_i] [get_bd_pins axi_gpio_1/gpio2_io_o]
  connect_bd_net -net axi_gpio_1_gpio_io_o [get_bd_pins gpio_io_o1] [get_bd_pins axi_gpio_1/gpio_io_i] [get_bd_pins axi_gpio_1/gpio_io_o]
  connect_bd_net -net axi_gpio_2_gpio2_io_o [get_bd_pins gpio2_io_o2] [get_bd_pins axi_gpio_2/gpio2_io_i] [get_bd_pins axi_gpio_2/gpio2_io_o]
  connect_bd_net -net axi_gpio_2_gpio_io_o [get_bd_pins gpio_io_o3] [get_bd_pins axi_gpio_2/gpio_io_i] [get_bd_pins axi_gpio_2/gpio_io_o]
  connect_bd_net -net axi_gpio_3_gpio_io_o [get_bd_pins gpio_io_o2] [get_bd_pins axi_gpio_3/gpio_io_i] [get_bd_pins axi_gpio_3/gpio_io_o]
  connect_bd_net -net clk_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_gpio_1/s_axi_aclk] [get_bd_pins axi_gpio_2/s_axi_aclk] [get_bd_pins axi_gpio_3/s_axi_aclk] [get_bd_pins soc/clk]
  connect_bd_net -net soc_FCLK_CLK0 [get_bd_pins FCLK_CLK0] [get_bd_pins soc/FCLK_CLK0]
  connect_bd_net -net soc_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_gpio_1/s_axi_aresetn] [get_bd_pins axi_gpio_2/s_axi_aresetn] [get_bd_pins axi_gpio_3/s_axi_aresetn] [get_bd_pins soc/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Data_manipulation
proc create_hier_cell_Data_manipulation { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Data_manipulation() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 15 -to 0 -type data A
  create_bd_pin -dir I -from 15 -to 0 -type data B
  create_bd_pin -dir I -from 31 -to 0 Din
  create_bd_pin -dir I -from 31 -to 0 Din1
  create_bd_pin -dir I -from 31 -to 0 Din2
  create_bd_pin -dir O -from 13 -to 0 Dout
  create_bd_pin -dir O -from 13 -to 0 Dout1
  create_bd_pin -dir O -from 13 -to 0 Dout2
  create_bd_pin -dir O -from 13 -to 0 Dout3
  create_bd_pin -dir O -from 13 -to 0 Dout4
  create_bd_pin -dir O -from 13 -to 0 Dout5
  create_bd_pin -dir O -from 13 -to 0 Dout6
  create_bd_pin -dir O -from 13 -to 0 Dout7
  create_bd_pin -dir O -from 7 -to 0 Dout8
  create_bd_pin -dir I clk_i
  create_bd_pin -dir I rst_i

  # Create instance: Control_bits
  create_hier_cell_Control_bits $hier_obj Control_bits

  # Create instance: Output_formatting
  create_hier_cell_Output_formatting $hier_obj Output_formatting

  # Create instance: Processing
  create_hier_cell_Processing $hier_obj Processing

  # Create port connections
  connect_bd_net -net DC_Dout [get_bd_pins Dout] [get_bd_pins Output_formatting/Dout]
  connect_bd_net -net GPIO_gpio_io_o1 [get_bd_pins Din1] [get_bd_pins Control_bits/Din1]
  connect_bd_net -net GPIO_gpio_io_o3 [get_bd_pins Din] [get_bd_pins Output_formatting/Din]
  connect_bd_net -net In6_DI_1 [get_bd_pins Dout7] [get_bd_pins Output_formatting/Dout7]
  connect_bd_net -net Net [get_bd_pins Din2] [get_bd_pins Control_bits/Din2]
  connect_bd_net -net Processing_data_o2 [get_bd_pins Output_formatting/Din7] [get_bd_pins Processing/data_o2]
  connect_bd_net -net adc_adc_a [get_bd_pins A] [get_bd_pins Output_formatting/Din6] [get_bd_pins Processing/A]
  connect_bd_net -net adc_adc_b [get_bd_pins B] [get_bd_pins Output_formatting/Din3] [get_bd_pins Processing/B]
  connect_bd_net -net c_addsub_0_S [get_bd_pins Output_formatting/Din4] [get_bd_pins Processing/S]
  connect_bd_net -net clk_1 [get_bd_pins clk_i] [get_bd_pins Processing/clk_i]
  connect_bd_net -net delay_max256clocks_0_data_o [get_bd_pins Output_formatting/Din2] [get_bd_pins Processing/data_o3]
  connect_bd_net -net delay_max256clocks_1_data_o [get_bd_pins Output_formatting/Din5] [get_bd_pins Processing/data_o1]
  connect_bd_net -net delayed_sqrt_Dout [get_bd_pins Dout5] [get_bd_pins Output_formatting/Dout5]
  connect_bd_net -net final_offset_Dout [get_bd_pins Control_bits/Dout4] [get_bd_pins Processing/B3]
  connect_bd_net -net final_output_Dout [get_bd_pins Dout2] [get_bd_pins Output_formatting/Dout2]
  connect_bd_net -net gain_Dout [get_bd_pins Control_bits/Dout1] [get_bd_pins Processing/B1]
  connect_bd_net -net initial_input_Dout [get_bd_pins Dout6] [get_bd_pins Output_formatting/Dout6]
  connect_bd_net -net initial_noise_Dout [get_bd_pins Dout3] [get_bd_pins Output_formatting/Dout3]
  connect_bd_net -net offset_input_Dout [get_bd_pins Dout4] [get_bd_pins Output_formatting/Dout4]
  connect_bd_net -net sel_Dout [get_bd_pins Dout8] [get_bd_pins Control_bits/Dout3] [get_bd_pins Processing/sel_i]
  connect_bd_net -net sqrtLUT_0_data_o [get_bd_pins Output_formatting/Din1] [get_bd_pins Processing/data_o]
  connect_bd_net -net sqrt_input_Dout [get_bd_pins Dout1] [get_bd_pins Output_formatting/Dout1]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins rst_i] [get_bd_pins Processing/rst_i]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins Control_bits/Dout2] [get_bd_pins Processing/B2]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: DAC_switches
proc create_hier_cell_DAC_switches { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_DAC_switches() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 31 -to 0 Din
  create_bd_pin -dir O -from 2 -to 0 Dout
  create_bd_pin -dir O -from 2 -to 0 Dout1

  # Create instance: DAC_switch_0, and set properties
  set DAC_switch_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 DAC_switch_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DOUT_WIDTH {3} \
 ] $DAC_switch_0

  # Create instance: DAC_switch_1, and set properties
  set DAC_switch_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 DAC_switch_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {5} \
CONFIG.DIN_TO {3} \
CONFIG.DOUT_WIDTH {3} \
 ] $DAC_switch_1

  # Create port connections
  connect_bd_net -net DAC_switch_0_Dout [get_bd_pins Dout] [get_bd_pins DAC_switch_0/Dout]
  connect_bd_net -net DAC_switch_1_Dout [get_bd_pins Dout1] [get_bd_pins DAC_switch_1/Dout]
  connect_bd_net -net Net [get_bd_pins Din] [get_bd_pins DAC_switch_0/Din] [get_bd_pins DAC_switch_1/Din]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Constants
proc create_hier_cell_Constants { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Constants() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 dout
  create_bd_pin -dir O -from 0 -to 0 dout1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create port connections
  connect_bd_net -net xlconstant_0_dout [get_bd_pins dout1] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins dout] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Buffers
proc create_hier_cell_Buffers { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Buffers() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 1 -to 0 -type clk IBUF_DS_N
  create_bd_pin -dir I -from 1 -to 0 -type clk IBUF_DS_P
  create_bd_pin -dir O -from 1 -to 0 -type clk OBUF_DS_N
  create_bd_pin -dir O -from 1 -to 0 -type clk OBUF_DS_P

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
CONFIG.C_SIZE {2} \
 ] $util_ds_buf_1

  # Create instance: util_ds_buf_2, and set properties
  set util_ds_buf_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_2 ]
  set_property -dict [ list \
CONFIG.C_BUF_TYPE {OBUFDS} \
CONFIG.C_SIZE {2} \
 ] $util_ds_buf_2

  # Create port connections
  connect_bd_net -net daisy_n_i_1 [get_bd_pins IBUF_DS_N] [get_bd_pins util_ds_buf_1/IBUF_DS_N]
  connect_bd_net -net daisy_p_i_1 [get_bd_pins IBUF_DS_P] [get_bd_pins util_ds_buf_1/IBUF_DS_P]
  connect_bd_net -net util_ds_buf_1_IBUF_OUT [get_bd_pins util_ds_buf_1/IBUF_OUT] [get_bd_pins util_ds_buf_2/OBUF_IN]
  connect_bd_net -net util_ds_buf_2_OBUF_DS_N [get_bd_pins OBUF_DS_N] [get_bd_pins util_ds_buf_2/OBUF_DS_N]
  connect_bd_net -net util_ds_buf_2_OBUF_DS_P [get_bd_pins OBUF_DS_P] [get_bd_pins util_ds_buf_2/OBUF_DS_P]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set Vaux0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux0 ]
  set Vaux1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux1 ]
  set Vaux8 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux8 ]
  set Vaux9 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux9 ]
  set Vp_Vn [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vp_Vn ]
  set gpio_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_rtl ]
  set gpio_rtl_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_rtl_0 ]

  # Create ports
  set adc_clk_n_i [ create_bd_port -dir I adc_clk_n_i ]
  set adc_clk_p_i [ create_bd_port -dir I adc_clk_p_i ]
  set adc_csn_o [ create_bd_port -dir O adc_csn_o ]
  set adc_dat_a_i [ create_bd_port -dir I -from 13 -to 0 adc_dat_a_i ]
  set adc_dat_b_i [ create_bd_port -dir I -from 13 -to 0 adc_dat_b_i ]
  set adc_enc_n_o [ create_bd_port -dir O adc_enc_n_o ]
  set adc_enc_p_o [ create_bd_port -dir O adc_enc_p_o ]
  set dac_clk_o [ create_bd_port -dir O dac_clk_o ]
  set dac_dat_o [ create_bd_port -dir O -from 13 -to 0 dac_dat_o ]
  set dac_pwm_o [ create_bd_port -dir O -from 3 -to 0 dac_pwm_o ]
  set dac_rst_o [ create_bd_port -dir O dac_rst_o ]
  set dac_sel_o [ create_bd_port -dir O dac_sel_o ]
  set dac_wrt_o [ create_bd_port -dir O dac_wrt_o ]
  set daisy_n_i [ create_bd_port -dir I -from 1 -to 0 daisy_n_i ]
  set daisy_n_o [ create_bd_port -dir O -from 1 -to 0 daisy_n_o ]
  set daisy_p_i [ create_bd_port -dir I -from 1 -to 0 daisy_p_i ]
  set daisy_p_o [ create_bd_port -dir O -from 1 -to 0 daisy_p_o ]
  set exp_n_tri_io [ create_bd_port -dir O -from 7 -to 0 exp_n_tri_io ]
  set exp_p_tri_io [ create_bd_port -dir O -from 7 -to 0 exp_p_tri_io ]
  set led_o [ create_bd_port -dir O -from 6 -to 0 led_o ]

  # Create instance: Buffers
  create_hier_cell_Buffers [current_bd_instance .] Buffers

  # Create instance: Constants
  create_hier_cell_Constants [current_bd_instance .] Constants

  # Create instance: DAC_switches
  create_hier_cell_DAC_switches [current_bd_instance .] DAC_switches

  # Create instance: Data_manipulation
  create_hier_cell_Data_manipulation [current_bd_instance .] Data_manipulation

  # Create instance: GPIO
  create_hier_cell_GPIO [current_bd_instance .] GPIO

  # Create instance: adc
  create_hier_cell_adc [current_bd_instance .] adc

  # Create instance: dac
  create_hier_cell_dac [current_bd_instance .] dac

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {3} \
CONFIG.IN1_WIDTH {3} \
CONFIG.IN2_WIDTH {1} \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create interface connections
  connect_bd_intf_net -intf_net GPIO_GPIO [get_bd_intf_ports gpio_rtl] [get_bd_intf_pins GPIO/GPIO]
  connect_bd_intf_net -intf_net GPIO_GPIO2 [get_bd_intf_ports gpio_rtl_0] [get_bd_intf_pins GPIO/GPIO2]
  connect_bd_intf_net -intf_net soc_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins GPIO/DDR]
  connect_bd_intf_net -intf_net soc_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins GPIO/FIXED_IO]

  # Create port connections
  connect_bd_net -net Constants_dout1 [get_bd_pins Constants/dout1] [get_bd_pins Data_manipulation/rst_i] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net DAC_switch_0_Dout [get_bd_pins DAC_switches/Dout] [get_bd_pins dac/SwitchDac0_SI] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net DAC_switch_1_Dout [get_bd_pins DAC_switches/Dout1] [get_bd_pins dac/SwitchDac1_SI] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net DC_Dout [get_bd_pins Data_manipulation/Dout] [get_bd_pins dac/In7_DI]
  connect_bd_net -net GPIO_gpio_io_o1 [get_bd_pins Data_manipulation/Din1] [get_bd_pins GPIO/gpio_io_o1]
  connect_bd_net -net GPIO_gpio_io_o3 [get_bd_pins Data_manipulation/Din] [get_bd_pins GPIO/gpio_io_o3]
  connect_bd_net -net In6_DI_1 [get_bd_pins Data_manipulation/Dout7] [get_bd_pins dac/In6_DI]
  connect_bd_net -net Net [get_bd_pins DAC_switches/Din] [get_bd_pins Data_manipulation/Din2] [get_bd_pins GPIO/gpio_io_o]
  connect_bd_net -net adc_adc_a [get_bd_pins Data_manipulation/A] [get_bd_pins adc/adc_a]
  connect_bd_net -net adc_adc_b [get_bd_pins Data_manipulation/B] [get_bd_pins adc/adc_b]
  connect_bd_net -net adc_adc_csn [get_bd_ports adc_csn_o] [get_bd_pins adc/adc_csn]
  connect_bd_net -net adc_clk_n_i_1 [get_bd_ports adc_clk_n_i] [get_bd_pins adc/adc_clk_n]
  connect_bd_net -net adc_clk_p_i_1 [get_bd_ports adc_clk_p_i] [get_bd_pins adc/adc_clk_p]
  connect_bd_net -net adc_dat_a_i_1 [get_bd_ports adc_dat_a_i] [get_bd_pins adc/adc_dat_a]
  connect_bd_net -net adc_dat_b_i_1 [get_bd_ports adc_dat_b_i] [get_bd_pins adc/adc_dat_b]
  connect_bd_net -net clk_1 [get_bd_pins Data_manipulation/clk_i] [get_bd_pins GPIO/s_axi_aclk] [get_bd_pins adc/adc_clk] [get_bd_pins dac/Clk_CI]
  connect_bd_net -net dac_dac_clk [get_bd_ports dac_clk_o] [get_bd_pins dac/dac_clk]
  connect_bd_net -net dac_dac_dat [get_bd_ports dac_dat_o] [get_bd_pins dac/dac_dat]
  connect_bd_net -net dac_dac_rst [get_bd_ports dac_rst_o] [get_bd_pins dac/dac_rst]
  connect_bd_net -net dac_dac_sel [get_bd_ports dac_sel_o] [get_bd_pins dac/dac_sel]
  connect_bd_net -net dac_dac_wrt [get_bd_ports dac_wrt_o] [get_bd_pins dac/dac_wrt]
  connect_bd_net -net daisy_n_i_1 [get_bd_ports daisy_n_i] [get_bd_pins Buffers/IBUF_DS_N]
  connect_bd_net -net daisy_p_i_1 [get_bd_ports daisy_p_i] [get_bd_pins Buffers/IBUF_DS_P]
  connect_bd_net -net delayed_sqrt_Dout [get_bd_pins Data_manipulation/Dout5] [get_bd_pins dac/In5_DI]
  connect_bd_net -net final_output_Dout [get_bd_pins Data_manipulation/Dout2] [get_bd_pins dac/In1_DI]
  connect_bd_net -net initial_input_Dout [get_bd_pins Data_manipulation/Dout6] [get_bd_pins dac/In0_DI]
  connect_bd_net -net initial_noise_Dout [get_bd_pins Data_manipulation/Dout3] [get_bd_pins dac/In2_DI]
  connect_bd_net -net offset_input_Dout [get_bd_pins Data_manipulation/Dout4] [get_bd_pins dac/In3_DI]
  connect_bd_net -net sqrt_input_Dout [get_bd_pins Data_manipulation/Dout1] [get_bd_pins dac/In4_DI]
  connect_bd_net -net util_ds_buf_2_OBUF_DS_N [get_bd_ports daisy_n_o] [get_bd_pins Buffers/OBUF_DS_N]
  connect_bd_net -net util_ds_buf_2_OBUF_DS_P [get_bd_ports daisy_p_o] [get_bd_pins Buffers/OBUF_DS_P]
  connect_bd_net -net xlconcat_0_dout [get_bd_ports led_o] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins Constants/dout] [get_bd_pins dac/Reset_RBI] [get_bd_pins dac/Valid0_SI] [get_bd_pins dac/Valid1_SI] [get_bd_pins dac/Valid2_SI] [get_bd_pins dac/Valid3_SI] [get_bd_pins dac/Valid4_SI] [get_bd_pins dac/Valid5_SI] [get_bd_pins dac/Valid6_SI] [get_bd_pins dac/Valid7_SI]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces GPIO/soc/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41210000 [get_bd_addr_spaces GPIO/soc/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_1/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41220000 [get_bd_addr_spaces GPIO/soc/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_2/S_AXI/Reg] SEG_axi_gpio_2_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41230000 [get_bd_addr_spaces GPIO/soc/processing_system7_0/Data] [get_bd_addr_segs GPIO/axi_gpio_3/S_AXI/Reg] SEG_axi_gpio_3_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


common::send_msg_id "BD_TCL-1000" "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

set_property -dict [list CONFIG.FREQ_HZ {125000000}] [get_bd_pins adc/axis_red_pitaya_adc_verilog0/adc_clk]
