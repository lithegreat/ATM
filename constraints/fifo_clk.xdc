#################################################################
# CLOCK Constraints for V7 - FiFo implementation
#################################################################
#
# specify the clocks in this file
#
create_clock -period 10 [get_ports clk_in] -name clk_in -waveform {0 5} [get_nets clk_in]
create_clock -period 10 [get_ports clk_out] -name clk_out -waveform {2.5 7.5} [get_nets clk_out]
#################################################################


