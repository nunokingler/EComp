`timescale 1ns / 1ps
`include "xdefs.vh"

module xnprint (
		input 	    clk,
		input 	    sel,
		input [31:0] data_in
		);

 always @(posedge clk)
   if(sel)
     $write("%d", data_in);

endmodule
