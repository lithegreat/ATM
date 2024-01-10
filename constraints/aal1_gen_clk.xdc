#################################################################
# CLOCK Constraints for V3 - AAL1 Header-Generator
#################################################################
#
# specify the clock in this file
#
#################################################################
create_clock -period 5.000 -name clk -waveform {0.000 2.500} [get_nets clk]

