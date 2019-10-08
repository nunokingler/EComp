`timescale 1ns / 1ps


module xtop_tb;

   //parameters
   parameter clk_period = 10;

   //
   // Interface signals
   //
   reg clk;
   reg rst;
   wire trap;


   //exteranl parallel interface
   wire               par_we;
   reg [15:0]  A;
   reg [15:0] B;
   wire [31:0] C;

   //iterator and timer
   integer 		   i, start_time;



   reg [31:0] data_out_ref;
   wire [31:0] data_out;
   wire       data_out_valid;


   // Instantiate the Unit Under Test (UUT)
   xMult  #(.bus_width(16)) nultiplier (
         .A(A),
         .B(B),
         .C(C)
	     );

   initial begin

   $dumpfile("top.vcd");
   $dumpvars();

      #50.1 A=16'h0002;
      B=16'h0000;

      for(i=0; i < 10; i++) begin
      data_out_ref = (i+2)*2;
      #10 B = i+2;

      end

      $finish;
   end // initial begin
   // CLOCK
   always
     #(clk_period/2) clk = ~clk;

   // show registers


endmodule
