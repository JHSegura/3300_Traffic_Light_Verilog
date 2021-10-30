`timescale 1ns / 1ps

module MUX_4_to_1 (input [2:0] cntr, [6:0] svnSeg_1, [6:0] svnSeg_2, [6:0] svnSeg_3, [6:0] svnSeg_4, output reg [6:0] outputSvnSeg);
    
    always@(cntr)
    case(cntr)
        3'b000: outputSvnSeg = svnSeg_1; //first led
        3'b001: outputSvnSeg = svnSeg_2; //second led
        3'b010: outputSvnSeg = svnSeg_3; //third led
        3'b011: outputSvnSeg = svnSeg_4; //fourth led
    endcase
    
endmodule
