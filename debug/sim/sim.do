vlib work
vmap work work

vlog  ../../hdl/semafor.v
vlog  ../hdl/ck_rst_tb.v
vlog  ../hdl/fsm_test.v


vsim work.fsm_test 
do wave.do

run -all

