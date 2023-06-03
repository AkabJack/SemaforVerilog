onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fsm_test/DUT_SEMAFOR/clk
add wave -noupdate /fsm_test/DUT_SEMAFOR/rst_n
add wave -noupdate /fsm_test/DUT_SEMAFOR/btn
add wave -noupdate /fsm_test/DUT_SEMAFOR/r_m
add wave -noupdate /fsm_test/DUT_SEMAFOR/v_m
add wave -noupdate /fsm_test/DUT_SEMAFOR/g_m
add wave -noupdate /fsm_test/DUT_SEMAFOR/r_p
add wave -noupdate /fsm_test/DUT_SEMAFOR/v_p
add wave -noupdate /fsm_test/DUT_SEMAFOR/btn_status
add wave -noupdate -radix decimal /fsm_test/DUT_SEMAFOR/status
add wave -noupdate -radix decimal /fsm_test/DUT_SEMAFOR/counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {329 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {23 ps} {497 ps}
