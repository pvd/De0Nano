# TCL File Generated by Component Editor 13.0sp1
# Sun Dec 08 13:27:21 CET 2013
# DO NOT MODIFY


# 
# new_component "new_component" v1.0
#  2013.12.08.13:27:21
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module new_component
# 
set_module_property DESCRIPTION ""
set_module_property NAME new_component
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME new_component
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file comm_fpga_epp.vhd VHDL PATH comm_fpga_epp.vhd TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 

