`timescale 1ns / 1ps

module T_Flip_Flop (T, reset_sw, Clk, Q, QBar);

    input T;
    input reset_sw;
    input Clk;
    output reg Q;
    output QBar;

	always @(negedge reset_sw, posedge Clk) 
	if (reset_sw==1) 
		Q = 0; 
	else 
		if (T) 
		  Q = ~Q;
    assign QBar=~Q;
        
endmodule