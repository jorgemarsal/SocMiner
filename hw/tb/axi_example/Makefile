VCS=/apps/synopsys/vcs/F-2011.12-2/bin/vcs
FILES= axi_tb.sv \
axi_lite_tb.sv \
axi_lite_gasket_tb.sv \
../axi4_if.sv \
../axi4lite_if.sv \
./sys_fm.v \
./hdl/verilog/axi_slave.v \
./hdl/verilog/axi_lite_slave.v \
./hdl/verilog/axi_stream_master.v \
./hdl/verilog/axi_lite_master.v \
./hdl/verilog/axi_master.v \
./hdl/verilog/axi_stream_slave.v \
../axi4lite2regbus.sv \
../regbus_if.sv \
../rdl/soc_miner_regs.v \
../rtl/auto_clear.sv

#TOP=axi_tb
#TOP=axi_lite_tb
TOP=axi_lite_gasket_tb

all:
	$(VCS) -fsdb -top $(TOP) -timescale=1ns/1ps  -sverilog  $(FILES)
	./simv +UVM_TESTNAME=$(UVM_TESTNAME)

