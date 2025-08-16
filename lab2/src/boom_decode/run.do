vlog package_decode.sv
vlog decode_table_package.sv
vlog uvm_tb_pkg.sv
vlog decode_if.sv
vlog DecodeUnit.v
vlog tb.sv

vsim -coverage work.tb +UVM_VERBOSITY=UVM_HIGH
run -all

coverage save mycov.ucdb
coverage report -detail -cvg

vcover report -html -htmldir cov_report mycov.ucdb

