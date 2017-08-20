set_global_assignment -entity "pll_200" -library "lib_pll_200" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_200" -library "lib_pll_200" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "pll_200" -library "lib_pll_200" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_200" -name SPD_FILE [file join $::quartus(sip_path) "pll_200.spd"]

set_global_assignment -library "lib_pll_200" -name MISC_FILE [file join $::quartus(sip_path) "pll_200_sim/pll_200.vo"]
