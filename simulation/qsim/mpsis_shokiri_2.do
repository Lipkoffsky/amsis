onerror {quit -f}
vlib work
vlog -work work mpsis_shokiri_2.vo
vlog -work work mpsis_shokiri_2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.MCD_vlg_vec_tst
vcd file -direction mpsis_shokiri_2.msim.vcd
vcd add -internal MCD_vlg_vec_tst/*
vcd add -internal MCD_vlg_vec_tst/i1/*
add wave /*
run -all
