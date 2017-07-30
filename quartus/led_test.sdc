create_clock -name "clk50" -period 20.000ns [get_ports CLOCK50]

derive_pll_clocks
derive_clock_uncertainty