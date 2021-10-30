`timescale 1ns / 1ps

module instantiate_traffic_light (inputCLK, AN, SEG7OUT, RGB_LED, DP, SW);

input inputCLK;
input SW;

output [7:0] AN;
output [0:6] SEG7OUT;
output [5:0] RGB_LED;
output DP;

wire slowClockSignal, fastClockSignal;
wire [6:0] seg7_1, seg7_2, seg7_3, seg7_4;
wire [3:0] Q, R;
wire [2:0] S, SBar;

assign DP = 1;

slow_clock_gen                  slow_clk (inputCLK, 0, slowClockSignal);
fast_clock_gen                  fast_clk (inputCLK, 0, fastClockSignal);
counter                         first_light_cntr (slowClockSignal, SW, Q, R, RGB_LED);
T_Flip_Flop                     two_bit_cntr_1 (1, 0, fastClockSignal, S[0], SBar[0]);
T_Flip_Flop                     two_bit_cntr_2 (1, 0, SBar[0], S[1], SBar[1]);
T_Flip_Flop                     two_bit_cntr_3 (1, 0, SBar[1], S[2], SBar[2]);
decoder_4_bit_seven_segment     sev_seg_dcdr_sec (Q, seg7_1, seg7_2);
decoder_4_bit_seven_segment     sev_seg_dcdr_min (R, seg7_3, seg7_4);
MUX_4_to_1                      mux_4_to_1 (S, seg7_1, seg7_2, seg7_3, seg7_4, SEG7OUT);
decoder_2_to_4                  dcdr_2_to_4 (S, AN);


endmodule


