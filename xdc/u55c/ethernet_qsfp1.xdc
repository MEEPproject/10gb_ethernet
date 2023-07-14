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
# QSFP28 Interfaces, QSFP_1, U55C
set_property -dict {LOC AA53 } [get_ports qsfp_1x_grx_p] ; # MGTYRXP0_131 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10
set_property -dict {LOC AA54 } [get_ports qsfp_1x_grx_n] ; # MGTYRXN0_131 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10
set_property -dict {LOC AA44 } [get_ports qsfp_1x_gtx_p] ; # MGTYTXP0_131 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10
set_property -dict {LOC AA45 } [get_ports qsfp_1x_gtx_n] ; # MGTYTXN0_131 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10

set_property -dict {LOC AB42 } [get_ports qsfp_refclk_clk_p] ; # MGTREFCLK1P_131 from SI5394B
set_property -dict {LOC AB43 } [get_ports qsfp_refclk_clk_n] ; 


# 161.1328125 MHz MGT reference clock (from SI5394B)
create_clock -period 6.206 -name qsfp_refclk [get_ports qsfp_refclk_clk_p]

#set_false_path -from [get_pins -hierarchical -filter {NAME =~ interrupt*/C}]

#set_property -dict {LOC BN31 IOSTANDARD LVCMOS18} [get_ports qsfp1_oe_b]
#set_property -dict {LOC BP31 IOSTANDARD LVCMOS18} [get_ports qsfp1_fs]

#set_false_path -to [get_ports {qsfp1_oe_b qsfp1_fs}]
#set_output_delay 0 [get_ports {qsfp1_oe_b qsfp1_fs}]


