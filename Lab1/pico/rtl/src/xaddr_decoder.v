`timescale 1ns / 1ps
module xaddr_decoder (
	             // address and global select signal
	              input [`ADDR_W-1:0] addr,
                      input               sel,

                      // ports

                      //memory
	              output reg          mem_sel,
                      input [31:0]        mem_data_to_rd,

	              output reg          regf_sel,
                      input [31:0]        regf_data_to_rd,

`ifdef DEBUG
	              output reg          cprt_sel,

`endif

                      output reg          ext_sel,
                      input [31:0]        ext_data_to_rd,

                      output reg          LED_sel,
                      output reg          nprt_sel,
                      output reg          trap_sel,

                      //read port
                      output reg [31:0]   data_to_rd
                     );


   //select module
   always @ * begin
      mem_sel = 1'b0;
      regf_sel = 1'b0;
`ifdef DEBUG
      cprt_sel = 1'b0;
`endif
	  LED_sel = 1'b0;
  	  nprt_sel = 1'b0;
      ext_sel = 1'b0;
      trap_sel = 1'b0;

      //mask offset and compare with base
      if ( (addr & {  {`ADDR_W-`MEM_ADDR_W{1'b1}}, {`MEM_ADDR_W{1'b0}}  }) == `MEM_BASE)
        mem_sel = sel;
      else if ( (addr & {  {`ADDR_W-`REGF_ADDR_W{1'b1}}, {`REGF_ADDR_W{1'b0}}  }) == `REGF_BASE)
        regf_sel = sel;
`ifdef DEBUG
      else if ( (addr &  {  {`ADDR_W-`CPRT_ADDR_W{1'b1}}, {`CPRT_ADDR_W{1'b0}}  }) == `CPRT_BASE)
        cprt_sel = sel;
 `endif
 	else if ( (addr &  {  {`ADDR_W-`LED_ADDR_W{1'b1}}, {`LED_ADDR_W{1'b0}}  }) == `LED_BASE)
	 	LED_sel = sel;
	 else if ( (addr &  {  {`ADDR_W-`NPRT_ADDR_W{1'b1}}, {`NPRT_ADDR_W{1'b0}}  }) == `NPRT_BASE)
	    		nprt_sel = sel;
      else
          trap_sel = sel;
   end

   //select data to read
   always @ * begin
      data_to_rd = `DATA_W'd0;

      if(mem_sel)
        data_to_rd = mem_data_to_rd;
      else if(regf_sel)
        data_to_rd = regf_data_to_rd;
//		else if(LED_sel)
//		  data_to_rd = LED_data_to_rd;
      else if(ext_sel)
        data_to_rd = ext_data_to_rd;
   end

endmodule
