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
# https://www.xilinx.com/support/documentation/user_guides/ug575-ultrascale-pkg-pinout.pdf
# QSFP Port 0, GTY Quad 134

create_ip -name gtwizard_ultrascale -vendor xilinx.com -library ip -module_name gtwizard_ultrascale_qsfp
set_property -dict [list CONFIG.preset {GTY-10GBASE-R}] [get_ips gtwizard_ultrascale_qsfp]


if { $g_qsfp_port == "qsfp0" } {

# QSFP Port 0, GTY Quad 134

set_property -dict [list \
    CONFIG.CHANNEL_ENABLE {X0Y40} \
    CONFIG.TX_MASTER_CHANNEL {X0Y40} \
    CONFIG.RX_MASTER_CHANNEL {X0Y40} \
    CONFIG.TX_LINE_RATE {10.3125} \
    CONFIG.TX_REFCLK_FREQUENCY {161.1328125} \
    CONFIG.TX_USER_DATA_WIDTH {64} \
    CONFIG.TX_INT_DATA_WIDTH {64} \
    CONFIG.RX_LINE_RATE {10.3125} \
    CONFIG.RX_REFCLK_FREQUENCY {161.1328125} \
    CONFIG.RX_USER_DATA_WIDTH {64} \
    CONFIG.RX_INT_DATA_WIDTH {64} \
    CONFIG.RX_REFCLK_SOURCE {X0Y40 clk1} \
    CONFIG.TX_REFCLK_SOURCE {X0Y40 clk1} \
    CONFIG.FREERUN_FREQUENCY {125} \
] [get_ips gtwizard_ultrascale_qsfp]

} else { 

# QSFP Port 1, Quad 135

 set_property -dict [list \
     CONFIG.CHANNEL_ENABLE {X0Y44} \
     CONFIG.TX_MASTER_CHANNEL {X0Y44} \
     CONFIG.RX_MASTER_CHANNEL {X0Y44} \
     CONFIG.TX_LINE_RATE {10.3125} \
     CONFIG.TX_REFCLK_FREQUENCY {161.1328125} \
     CONFIG.TX_USER_DATA_WIDTH {64} \
     CONFIG.TX_INT_DATA_WIDTH {64} \
     CONFIG.RX_LINE_RATE {10.3125} \
     CONFIG.RX_REFCLK_FREQUENCY {161.1328125} \
     CONFIG.RX_USER_DATA_WIDTH {64} \
     CONFIG.RX_INT_DATA_WIDTH {64} \
     CONFIG.RX_REFCLK_SOURCE {X0Y44 clk1} \
     CONFIG.TX_REFCLK_SOURCE {X0Y44 clk1} \
     CONFIG.FREERUN_FREQUENCY {125} \
 ] [get_ips gtwizard_ultrascale_qsfp]

}
