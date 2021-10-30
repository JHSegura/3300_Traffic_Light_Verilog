`timescale 1ns / 1ps

module decoder_4_bit_seven_segment (input [3:0] data, output wire [6:0] x, output wire [6:0] z);

	reg [3:0] digit_1;
    reg [3:0] digit_2;
    integer data_temp;
    integer i;

	always@data
	begin
	data_temp=data;
	digit_1=0;
	digit_2=0;
	for(i=0;i<5;i=i+1)
	   begin
	   if (data_temp>9)
	       begin
	       data_temp = data_temp-10;
	       digit_2=digit_2+4'b0001;
	       end
	   end
	digit_1=data_temp;
	end
    
	decoder_seven_segment (digit_1, x);
	decoder_seven_segment (digit_2, z);
	
endmodule

module decoder_seven_segment (input wire [3:0] r, output reg [6:0] y);

    always @r
    case(r)
        4'b0000: y = 7'b0000001; //0
        4'b0001: y = 7'b1001111; //1
        4'b0010: y = 7'b0010010; //2
        4'b0011: y = 7'b0000110; //3
        4'b0100: y = 7'b1001100; //4
        4'b0101: y = 7'b0100100; //5
        4'b0110: y = 7'b0100000; //6
        4'b0111: y = 7'b0001111; //7
        4'b1000: y = 7'b0000000; //8
        4'b1001: y = 7'b0000100; //9
    endcase
    
endmodule
