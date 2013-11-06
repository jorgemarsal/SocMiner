VCS=vcs
FILES= soc_miner_tb.sv \
../rtl/soc_miner_wrapper.v \
../rtl/axi4_if.sv \
../rtl/axi4lite_if.sv \
sys_fm.v \
../axi_example/hdl/verilog/axi_slave.v \
../axi_example/hdl/verilog/axi_lite_slave.v \
../axi_example/hdl/verilog/axi_stream_master.v \
../axi_example/hdl/verilog/axi_lite_master.v \
../axi_example/hdl/verilog/axi_master.v \
../axi_example/hdl/verilog/axi_stream_slave.v \
../rtl/axi4lite2regbus.sv \
../rtl/regbus_if.sv \
../rtl/soc_miner_regs.v \
../rtl/auto_clear.sv \
../rtl/soc_miner.sv

XILINX_FILES = ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/synth/soc_miner_io_processing_system7_0_0.v              \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/hdl/verilog/processing_system7_v5_3_processing_system7.v \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/hdl/verilog/processing_system7_v5_3_w_atc.v              \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/hdl/verilog/processing_system7_v5_3_b_atc.v              \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/hdl/verilog/processing_system7_v5_3_trace_buffer.v       \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/hdl/verilog/processing_system7_v5_3_atc.v                \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/ip/soc_miner_io_processing_system7_0_0/hdl/verilog/processing_system7_v5_3_aw_atc.v             \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/hdl/soc_miner_io.v                                                                              \
	       ../../syn/soc_miner_io/soc_miner_io.srcs/sources_1/bd/soc_miner_io/hdl/soc_miner_io_wrapper.v \
	       -y /data/Xilinx/Vivado/2013.3/data/verilog/src/unisims \
	               -y /data/Xilinx/Vivado/2013.3/data/verilog/src/unimacro \
		               -y /data/Xilinx/Vivado/2013.3/data/verilog/src/retarget \
			               -y /data/Xilinx/Vivado/2013.3/ids_lite/ISE/verilog/src/XilinxCoreLib \
				               +incdir+/data/Xilinx/Vivado/2013.3/verilog/src +libext+.v \
					               /data/Xilinx/Vivado/2013.3/data/verilog/src/glbl.v

#TOP=axi_tb
#TOP=axi_lite_tb
#TOP=axi_lite_gasket_tb
TOP=soc_miner_tb

all:
	$(VCS) +lint=all -l vcs.log -fsdb -top $(TOP) -timescale=1ns/1ps  -sverilog  $(FILES) $(XILINX_FILES)
	./simv +UVM_TESTNAME=$(UVM_TESTNAME)

