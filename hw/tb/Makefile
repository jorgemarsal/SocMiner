VCS=/apps/synopsys/vcs/F-2011.12-2/bin/vcs
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

#TOP=axi_tb
#TOP=axi_lite_tb
#TOP=axi_lite_gasket_tb
TOP=soc_miner_tb

all:
	$(VCS) +lint=all -l vcs.log -fsdb -top $(TOP) -timescale=1ns/1ps  -sverilog  $(FILES)
	./simv +UVM_TESTNAME=$(UVM_TESTNAME)

