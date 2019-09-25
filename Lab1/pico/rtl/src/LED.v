`timescale 1ns / 1ps
`include "xdefs.vh"

module xLED (
		input 	    clk,
		input 	    sel,
		input [7:0] data_in,
        output reg [7:0]     LEDpin
		);

 always @(posedge clk)
   if(sel)
    // $write("%c", data_in);
    LEDpin=data_in;
endmodule
