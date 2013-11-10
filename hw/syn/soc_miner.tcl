#
# soc miner
#
create_project -in_memory -part xc7z020clg484-1
set_property target_language Verilog [current_project]
set_property board xilinx.com:zynq:zc702:1.0 [current_project]

add_files ../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/soc_miner_io.bd
set_property used_in_implementation false [get_files -all ../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/soc_miner_io_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all ../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/soc_miner_io_ooc.xdc]
#set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files ../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/soc_miner_io.bd]

read_verilog -sv {
  ../hw/rtl/regbus_if.sv
  ../hw/rtl/axi4lite_if.sv
  ../hw/rtl/axi4lite2regbus.sv
  ../hw/rtl/auto_clear.sv
  ../hw/rtl/soc_miner.sv
}


read_verilog {
  ../hw/rtl/soc_miner_regs.v
  ../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/hdl/soc_miner_io_wrapper.v
  ../syn/soc_miner_io/soc_miner_io.srcs/sources_1/imports/rtl/soc_miner_wrapper.v
}
read_xdc ../syn/soc_miner_io/soc_miner_io.srcs/constrs_1/new/soc_miner_wrapper.xdc
set_property used_in_implementation false [get_files ../syn/soc_miner_io/soc_miner_io.srcs/constrs_1/new/soc_miner_wrapper.xdc]

read_xdc ../syn/soc_miner_io/soc_miner_io.runs/synth_1/dont_touch.xdc
set_property used_in_implementation false [get_files ../syn/soc_miner_io/soc_miner_io.runs/synth_1/dont_touch.xdc]
#set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir ../syn/soc_miner_io/soc_miner_io.data/wt [current_project]
set_property parent.project_dir ../syn/soc_miner_io [current_project]
synth_design -top soc_miner_wrapper -part xc7z020clg484-1
report_utilization -file soc_miner_wrapper_utilization_synth.rpt -pb soc_miner_wrapper_utilization_synth.pb

opt_design

place_design

report_io -file soc_miner_wrapper_io_placed.rpt
report_clock_utilization -file soc_miner_wrapper_clock_utilization_placed.rpt
report_utilization -file soc_miner_wrapper_utilization_placed.rpt -pb soc_miner_wrapper_utilization_placed.pb
report_control_sets -verbose -file soc_miner_wrapper_control_sets_placed.rpt


route_design
report_drc -file soc_miner_wrapper_drc_routed.rpt -pb soc_miner_wrapper_drc_routed.pb
report_power -file soc_miner_wrapper_power_routed.rpt -pb soc_miner_wrapper_power_summary_routed.pb
report_route_status -file soc_miner_wrapper_route_status.rpt -pb soc_miner_wrapper_route_status.pb
report_timing_summary -file soc_miner_wrapper_timing_summary_routed.rpt -pb soc_miner_wrapper_timing_summary_routed.pb

write_bitstream -force soc_miner_wrapper.bit

