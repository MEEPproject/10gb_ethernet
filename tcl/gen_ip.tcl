# Copyright 2022 Barcelona Supercomputing Center-Centro Nacional de Supercomputación

# Licensed under the Solderpad Hardware License v 2.1 (the "License");
# you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
# You may obtain a copy of the License at
#
#     http://www.solderpad.org/licenses/SHL-2.1
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Ruben Cano, BSC-CNS
# Date: 22.02.2022
# Description:
source $root_dir/tcl/environment.tcl
source $root_dir/tcl/ip_properties.tcl

set ip_properties [ list \
    vendor "meep-project.eu" \
    library "MEEP" \
    name "MEEP_10Gb_Ethernet_${g_qsfp_port}" \
    version "$g_ip_version" \
    taxonomy "/MEEP_IP" \
    display_name "Alveo $g_alveo_board 10Gb Ethernet ${g_qsfp_port}" \
    description "$g_ip_description" \
    core_revision 1 \
    vendor_display_name "bsc.es" \
    company_url "https://meep-project.eu/" \
    ]


set family_lifecycle { \
  virtexuplusHBM Production \
}

file mkdir ${root_dir}/${g_qsfp_port}

# Package project and set properties
ipx::package_project -root_dir ${root_dir}/${g_qsfp_port} -import_files
set ip_core [ipx::current_core]
set_property -dict ${ip_properties} ${ip_core}
set_property SUPPORTED_FAMILIES ${family_lifecycle} ${ip_core}


## Relative path to IP root directory
ipx::create_xgui_files ${ip_core} -logo_file "${root_dir}/misc/BSC-Logo.png"
set_property type LOGO [ipx::get_files "${root_dir}/misc/BSC-Logo.png" -of_objects [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]]

#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces ETH_TX_AXIS -of_objects [ipx::current_core]]
#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces ETH_RX_AXIS -of_objects [ipx::current_core]]
ipx::associate_bus_interfaces -busif ETH_TX_AXIS -clock eth_gt_user_clock [ipx::current_core]
ipx::associate_bus_interfaces -busif ETH_RX_AXIS -clock eth_gt_user_clock [ipx::current_core]


# Save IP and close project
ipx::check_integrity ${ip_core}
ipx::save_core ${ip_core}

ipx::merge_project_changes files [ipx::current_core]
update_ip_catalog -rebuild -scan_changes

puts "IP succesfully packaged " 
