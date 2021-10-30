`timescale 1ns / 1ps

module decoder_2_to_4 (input wire [2:0] r, output reg [7:0] y);

    always @r
    case(r)
        3'b000: y = 8'b11111110; //first led
        3'b001: y = 8'b11111101; //second led
        3'b010: y = 8'b11111011; //third led
        3'b011: y = 8'b11110111; //fourth led
        default: y = 8'b11111111;
    endcase
    
endmodule
