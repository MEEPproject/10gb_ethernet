namespace eval _tcl {
proc get_script_folder {} {
    set script_path [file normalize [info script]]
    set script_folder [file dirname $script_path]
    return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

puts "The environment tcl will be sourced from ${script_folder}"
source $script_folder/environment.tcl

# Redefine the FPGA part in case the script is called with arguments
# It defaults to u280
if { $::argc == 2 } {

        set g_board_part [lindex $argv 0]
        set g_fpga_part "xc${g_board_part}-fsvh2892-2L-e"

	set g_qsfp_port [lindex $argv 1]

} else {
	puts "Error: Bad usage. This script must receive the Alveo Board code (u280/u55c) and the QSFP port (qsfp0/qsfp1/pcieEth)"
}
set root_dir $g_root_dir
set g_project_name $g_project_name
set projec_dir $root_dir/project

################################################################
# START
################################################################

# Clean previous project
file delete -force $projec_dir

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
    create_project $g_project_name $projec_dir -force -part $g_fpga_part
}
# Set project properties
# CHANGE DESIGN NAME HERE
variable design_name
set design_name $g_project_name
set ip_dir_list [list \
     $root_dir/ip]
	 
	
set_property  ip_repo_paths  $ip_dir_list [current_project]


####################################################
# MAIN FLOW
####################################################
#set g_top_name ${g_project_name}_top

set top_module "$root_dir/src/ethernet_alveo.v"
#set src_files [glob ${root_dir}/src/*]
#set ip_files [glob -nocomplain ${root_dir}/ip/*/*.xci]
#add_files ${src_files}
#add_files $top_module
#add_files -quiet ${ip_files}

# Add Constraint files to project
if {$g_qsfp_port != "pcie"} {
    # TODO: Add Out Of Context constraints in case it is necessary in the future
    set top_module "$root_dir/src/ethernet_alveo.v"
    #add_files -fileset [get_filesets constrs_1] "$root_dir/xdc/${g_board_part}/ethernet_${g_qsfp_port}.xdc"
    source ${g_root_dir}/ip/${g_board_part}/ethernet-${g_board_part}.tcl
    #set_property target_language VHDL [current_project]
} else {
    set fileset_obj [get_filesets sources_1]
    set VERILOG_MACROS [list "ETHERNET_OVER_PCIE"]
    set_property "verilog_define" "${VERILOG_MACROS}" $fileset_obj
    set top_module "$root_dir/src/meep/ethernet_pcie.v"
    source ${g_root_dir}/ip/common/ethernet-pcie.tcl

}

# Redefine the variable for the next tcl, which will be load the environment.tcl, ignoring the changes made in this script.

set g_alveo_board $g_board_part
source $root_dir/tcl/gen_ip.tcl

puts "Project generation ended successfully"
