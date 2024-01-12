# Legal Notice: (C)2024 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	Archi_lab_1_nios2_gen2_0_cpu 	Archi_lab_1_nios2_gen2_0_cpu:*
set 	Archi_lab_1_nios2_gen2_0_cpu_oci 	Archi_lab_1_nios2_gen2_0_cpu_nios2_oci:the_Archi_lab_1_nios2_gen2_0_cpu_nios2_oci
set 	Archi_lab_1_nios2_gen2_0_cpu_oci_break 	Archi_lab_1_nios2_gen2_0_cpu_nios2_oci_break:the_Archi_lab_1_nios2_gen2_0_cpu_nios2_oci_break
set 	Archi_lab_1_nios2_gen2_0_cpu_ocimem 	Archi_lab_1_nios2_gen2_0_cpu_nios2_ocimem:the_Archi_lab_1_nios2_gen2_0_cpu_nios2_ocimem
set 	Archi_lab_1_nios2_gen2_0_cpu_oci_debug 	Archi_lab_1_nios2_gen2_0_cpu_nios2_oci_debug:the_Archi_lab_1_nios2_gen2_0_cpu_nios2_oci_debug
set 	Archi_lab_1_nios2_gen2_0_cpu_wrapper 	Archi_lab_1_nios2_gen2_0_cpu_debug_slave_wrapper:the_Archi_lab_1_nios2_gen2_0_cpu_debug_slave_wrapper
set 	Archi_lab_1_nios2_gen2_0_cpu_jtag_tck 	Archi_lab_1_nios2_gen2_0_cpu_debug_slave_tck:the_Archi_lab_1_nios2_gen2_0_cpu_debug_slave_tck
set 	Archi_lab_1_nios2_gen2_0_cpu_jtag_sysclk 	Archi_lab_1_nios2_gen2_0_cpu_debug_slave_sysclk:the_Archi_lab_1_nios2_gen2_0_cpu_debug_slave_sysclk
set 	Archi_lab_1_nios2_gen2_0_cpu_oci_path 	 [format "%s|%s" $Archi_lab_1_nios2_gen2_0_cpu $Archi_lab_1_nios2_gen2_0_cpu_oci]
set 	Archi_lab_1_nios2_gen2_0_cpu_oci_break_path 	 [format "%s|%s" $Archi_lab_1_nios2_gen2_0_cpu_oci_path $Archi_lab_1_nios2_gen2_0_cpu_oci_break]
set 	Archi_lab_1_nios2_gen2_0_cpu_ocimem_path 	 [format "%s|%s" $Archi_lab_1_nios2_gen2_0_cpu_oci_path $Archi_lab_1_nios2_gen2_0_cpu_ocimem]
set 	Archi_lab_1_nios2_gen2_0_cpu_oci_debug_path 	 [format "%s|%s" $Archi_lab_1_nios2_gen2_0_cpu_oci_path $Archi_lab_1_nios2_gen2_0_cpu_oci_debug]
set 	Archi_lab_1_nios2_gen2_0_cpu_jtag_tck_path 	 [format "%s|%s|%s" $Archi_lab_1_nios2_gen2_0_cpu_oci_path $Archi_lab_1_nios2_gen2_0_cpu_wrapper $Archi_lab_1_nios2_gen2_0_cpu_jtag_tck]
set 	Archi_lab_1_nios2_gen2_0_cpu_jtag_sysclk_path 	 [format "%s|%s|%s" $Archi_lab_1_nios2_gen2_0_cpu_oci_path $Archi_lab_1_nios2_gen2_0_cpu_wrapper $Archi_lab_1_nios2_gen2_0_cpu_jtag_sysclk]
set 	Archi_lab_1_nios2_gen2_0_cpu_jtag_sr 	 [format "%s|*sr" $Archi_lab_1_nios2_gen2_0_cpu_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_oci_break_path|break_readreg*] -to [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sr*]
set_false_path -from [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_oci_debug_path|*resetlatch]     -to [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sr[33]]
set_false_path -from [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_oci_debug_path|monitor_ready]  -to [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sr[0]]
set_false_path -from [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_oci_debug_path|monitor_error]  -to [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sr[34]]
set_false_path -from [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_ocimem_path|*MonDReg*] -to [get_keepers *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sr*]
set_false_path -from *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sr*    -to *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$Archi_lab_1_nios2_gen2_0_cpu_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$Archi_lab_1_nios2_gen2_0_cpu_oci_debug_path|monitor_go
