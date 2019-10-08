`timescale 1ns / 1ps

module xMult
#(  parameter bus_width = 16)
(
        input  [bus_width-1:0] A,
        input  [bus_width-1:0] B,
        output reg [bus_width*2-1:0]     C
		);

 always @ *
    C = A * B;
endmodule
