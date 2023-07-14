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
set files [list \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_mac_10g.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_mac_10g_fifo.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_rx.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_tx.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_rx_if.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_tx_if.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_rx_ber_mon.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_rx_frame_sync.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/eth_phy_10g_rx_watchdog.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/axis_xgmii_rx_32.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/axis_xgmii_rx_64.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/axis_xgmii_tx_32.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/axis_xgmii_tx_64.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/xgmii_baser_dec_64.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/xgmii_baser_enc_64.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/lib/axis/rtl/sync_reset.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/lib/axis/rtl/axis_adapter.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/lib/axis/rtl/axis_async_fifo.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/lib/axis/rtl/axis_async_fifo_adapter.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/lfsr.v"] \
  [file normalize "${g_root_dir}/src/verilog-ethernet/rtl/ptp_clock_cdc.v"] \
  [file normalize "${g_root_dir}/src/ethernet_alveo.v"] \

]
add_files $files

set files [list \
  [file normalize ${g_root_dir}/src/verilog-ethernet/lib/axis/syn/vivado/sync_reset.tcl] \
  [file normalize ${g_root_dir}/src/verilog-ethernet/lib/axis/syn/vivado/axis_async_fifo.tcl] \
  [file normalize ${g_root_dir}/src/verilog-ethernet/syn/vivado/eth_mac_fifo.tcl] \
]

