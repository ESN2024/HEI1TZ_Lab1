
module Archi_lab_1 (
	clk_clk,
	led_out_external_connection_export,
	pio_0_external_connection_export,
	pushbutton_trigger_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[9:0]	led_out_external_connection_export;
	input	[3:0]	pio_0_external_connection_export;
	input		pushbutton_trigger_external_connection_export;
	input		reset_reset_n;
endmodule
