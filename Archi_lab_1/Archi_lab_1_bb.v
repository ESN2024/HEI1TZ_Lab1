
module Archi_lab_1 (
	clk_clk,
	reset_reset_n,
	pushbutton_trigger_external_connection_export,
	led_out_external_connection_export,
	pio_0_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		pushbutton_trigger_external_connection_export;
	output	[9:0]	led_out_external_connection_export;
	input	[3:0]	pio_0_external_connection_export;
endmodule
