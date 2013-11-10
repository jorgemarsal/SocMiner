cee:
	bsub -Lp other -Ip -G other -R rusage[mem=16384] -n 8 -B "vivado -mode batch -source soc_miner.tcl"
local:
	vivado -mode batch -source soc_miner.tcl
