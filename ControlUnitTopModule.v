//`timescale 1ns / 1ps
module ControlUnit(input clk,
                   input reset,
				   input [5:0] funct,
				   input [5:0] opcode,
				   input overflow
				    );
					
      wire [4:0] next_stateDT1;
	  wire [4:0] next_stateDT2;
	  wire [4:0] next_stateDT3;
	  wire [4:0] current_state;
	  
	  wire iorD, memRd, memWr, irWr;
	  wire [1:0] AluSrcA;
	  wire [2:0] AluSrcB;
	  wire [2:0] AluCtrl;
	  wire [1:0] HiSel;
	  wire [1:0] LoSel;
	  wire HiWr, LoWr, MAluOp;
	  wire [2:0] MemToReg;
	  wire [1:0] RegDst;
	  wire RegWr,PcWr,PcWrCon;
	  wire [2:0] PcSrc;
	  wire intCause;
	  wire causeWrite;
	  wire EPCwrite;
	  
	  reg [2:0] next_address;
	  wire[2:0] next_address1;
	  
	  reg [4:0] zero;
	  reg [4:0] WriteBack;
	  
	  wire[2:0] address_select;
	  

	 // reg reset = 1;
	   
	   initial 
	      begin
		     next_address = 3'd0;
		     WriteBack = 5'd19;
			 zero = 5'd0;
	      end
always@(posedge clk)
	  begin
	   if(!reset)begin
	     next_address = next_address1;
	    end
	 //  else begin
	  //  reset = 0;
	  //   end
	  end
	  
      dispatch1 dTable1(opcode,
                        funct,
				        next_stateDT1);
	  dispatch2 dTable2(opcode,
                        funct,
				        next_stateDT2);
	  dispatch3 dTable3(opcode,
                        funct,
				        next_stateDT3);
						
		MUX2X1 MUX1(next_address,
		            overflow,
					current_state,
					address_select);
					
	  controlmemory controlMem(current_state,
				               iorD,
				               memRd,
				               memWr,
				               irWr,
				               AluSrcA,
				               AluSrcB,
				               AluCtrl,
				               HiSel,
				               LoSel,
				               HiWr,
				               LoWr,
				               MAluOp,
				               MemToReg,
				               RegDst,
				               RegWr,
				               PcWr,
				               PcWrCon,
				               PcSrc,
							   
							   intCause,
							   causeWrite,
							   EPCwrite,
							   
				               next_address1);
							   				   
	   MUX_6X1 MUX(zero,
                   next_stateDT1,
                   next_stateDT2,
			       next_stateDT3,
			       5'd1,
				   address_select,
			       WriteBack,
				   5'd32, //overflow state
			       current_state);

endmodule