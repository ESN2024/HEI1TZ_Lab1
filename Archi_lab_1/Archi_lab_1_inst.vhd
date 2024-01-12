	component Archi_lab_1 is
		port (
			clk_clk                                       : in  std_logic                    := 'X';             -- clk
			reset_reset_n                                 : in  std_logic                    := 'X';             -- reset_n
			pushbutton_trigger_external_connection_export : in  std_logic                    := 'X';             -- export
			led_out_external_connection_export            : out std_logic_vector(9 downto 0);                    -- export
			pio_0_external_connection_export              : in  std_logic_vector(3 downto 0) := (others => 'X')  -- export
		);
	end component Archi_lab_1;

	u0 : component Archi_lab_1
		port map (
			clk_clk                                       => CONNECTED_TO_clk_clk,                                       --                                    clk.clk
			reset_reset_n                                 => CONNECTED_TO_reset_reset_n,                                 --                                  reset.reset_n
			pushbutton_trigger_external_connection_export => CONNECTED_TO_pushbutton_trigger_external_connection_export, -- pushbutton_trigger_external_connection.export
			led_out_external_connection_export            => CONNECTED_TO_led_out_external_connection_export,            --            led_out_external_connection.export
			pio_0_external_connection_export              => CONNECTED_TO_pio_0_external_connection_export               --              pio_0_external_connection.export
		);

