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
# QSFP28 Interfaces

# 156.25 MHz MGT reference clock (from SI546, fs = 0)
#create_clock -period 6.400 -name qsfp0_mgt_refclk_1 [get_ports qsfp0_mgt_refclk_1_p]

# 161.1328125 MHz MGT reference clock (from SI546, fs = 1)
create_clock -period 6.206 -name qsfp_refclk [get_ports qsfp_refclk_clk_p]

set_property -dict {LOC G53 } [get_ports qsfp_1x_grx_p] ; # MGTYRXP0_135 GTYE4_CHANNEL_X0Y44 / GTYE4_COMMON_X0Y11
set_property -dict {LOC G54 } [get_ports qsfp_1x_grx_n] ; # MGTYRXN0_135 GTYE4_CHANNEL_X0Y44 / GTYE4_COMMON_X0Y11
set_property -dict {LOC G48 } [get_ports qsfp_1x_gtx_p] ; # MGTYTXP0_135 GTYE4_CHANNEL_X0Y44 / GTYE4_COMMON_X0Y11
set_property -dict {LOC G49 } [get_ports qsfp_1x_gtx_n] ; # MGTYTXN0_135 GTYE4_CHANNEL_X0Y44 / GTYE4_COMMON_X0Y11

set_property -dict {LOC M42 } [get_ports qsfp_refclk_clk_p] ; # MGTREFCLK1P_135 from SI546
set_property -dict {LOC M43 } [get_ports qsfp_refclk_clk_n] ; # MGTREFCLK1N_135 from SI546

set_property -dict {LOC H30 IOSTANDARD LVCMOS18} [get_ports qsfp1_oe_b]
set_property -dict {LOC G33 IOSTANDARD LVCMOS18} [get_ports qsfp1_fs]


set_false_path -to [get_ports {qsfp1_oe_b qsfp1_fs}]
set_output_delay 0 [get_ports {qsfp1_oe_b qsfp1_fs}]


#set_false_path -from [get_pins -hierarchical -filter {NAME =~ interrupt*/C}]

