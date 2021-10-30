`timescale 1ns / 1ps

module counter (input clk, resetSW, output reg [3:0] q, output reg [3:0] r, output reg [5:0] LED);
    
    reg [3:0] counter;
    reg second_light;

    always@(posedge clk)
    begin
        q=4'b1111;
        r=4'b1111;
        if(counter == 4'b0000||resetSW)
        begin
            counter=4'b1111;
            second_light=0;
        end
        else if (counter == 4'b0001)
            begin
                counter=counter-1;
                second_light=~second_light;
            end
        else
            counter = counter+1;
            
        if (second_light)
        begin
            r = counter;
            if (counter>4'b0101)
                LED = 010000;
            else
                LED = 011000;
        end
        else
        begin
            q = counter;
            if (counter>4'b0101)
                LED = 000010;
            else
                LED = 000011;
        end
    end
        
endmodule
