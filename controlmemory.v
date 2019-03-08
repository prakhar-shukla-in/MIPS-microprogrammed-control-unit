//`timescale 1ns / 1ps
module controlmemory(input [4:0] state_address,
				 output reg iorD,
				 output reg memRd,
				 output reg memWr,
				 output reg irWr,
				 output reg [1:0] AluSrcA,
				 output reg [2:0] AluSrcB,
				 output reg [2:0] AluCtrl,
				 output reg [1:0] HiSel,
				 output reg [1:0] LoSel,
				 output reg HiWr,
				 output reg LoWr,
				 output reg MAluOp,
				 output reg [2:0] MemToReg,
				 output reg [1:0] RegDst,
				 output reg RegWr,
				 output reg PcWr,
				 output reg PcWrCon,
				 output reg [2:0] PcSrc,
				 
				 output reg intCause,
				 output reg causeWrite,
				 output reg EPCwrite,
				 
				 output reg [2:0] next_address);
always@(*)
    begin		 
	    case(state_address)
		     5'b00000: //IF
			 begin
			     iorD= 1'b0;
				 memRd= 1'b1;
				 memWr= 1'b0;
				 irWr= 1'b1;
				 AluSrcA= 2'b00;
				 AluSrcB= 3'b000;
				 AluCtrl= 3'b010; //add
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b000;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address= 3'b100;
			 end
			 
			 5'b00001:  //ID ex
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b00;
				 AluSrcB= 3'b010;
				 AluCtrl= 3'b010; //add
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b001;
			 end
			 
			 5'b00010:  //mfhi ex
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dont care
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'b100;
				 RegDst= 2'b00;
				 RegWr= 1'b1;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b000;
			 end
			 
			 5'b00011:  //mflo ..
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dont care
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'b101;
				 RegDst= 2'b00;
				 RegWr= 1'b1;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b000;
			 end
			 
			 5'b00100:  //mthi
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dont care
				 HiSel= 2'b01;
				 LoSel= 2'bxx;
				 HiWr= 1'b1;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b000;
			 end
			 
			 5'b00101:  //mtlo
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dont care
				 HiSel= 2'bxx;
				 LoSel= 2'b01;
				 HiWr= 1'b0;
				 LoWr= 1'b1;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b000;
			 end
			 
			 5'b00110:  //lui
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dont care
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'b011;
				 RegDst= 2'b00;
				 RegWr= 1'b1;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b00111:  //beq
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b001;
				 AluCtrl= 3'b110; //sub
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b1;
				 PcSrc= 3'b001;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b01000:  //j
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b010;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b01001:  //jal
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'b010;
				 RegDst= 2'b10;
				 RegWr= 1'b1;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b010;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b01010: //jr
			 begin
			    iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b011;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b01011: //jalr
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'b010;
				 RegDst= 2'b00;
				 RegWr= 1'b1;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b011;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b01100:  //add
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b001;
				 AluCtrl= 3'b010; //add
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b101;
			 end
			 
			 5'b01101:  //sll
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b10;
				 AluSrcB= 3'b001;
				 AluCtrl= 3'b111; //shift
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b101;
			 end
			 
			 5'b01110: //sllv
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b001;
				 AluCtrl= 3'b111; //shift
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b101;
			 end
			 
			 5'b01111:  //div
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b001;
				 AluCtrl= 3'b110; //div
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
                 
				 next_address = 3'b010;
			 end
			 
			 5'b10000:  //mult, madd, msub ..
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b001;
				 AluCtrl= 3'b001; //mult
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b010;
			 end
			 
			 5'b10001:  //addi, lw ,sw ex
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b011;
				 AluCtrl= 3'b010; //add
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b010;
			 end
			 
			 5'b10010: //ori ex
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'b01;
				 AluSrcB= 3'b100;
				 AluCtrl= 3'b000; //or
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b010;
			 end
			 
			 5'b10011: //add, sll, sllv wb
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'b000;
				 RegDst= 2'b00;
				 RegWr= 1'b1;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b10100:  //div, mult ..
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'b00;
				 LoSel= 2'b00;
				 HiWr= 1'b1;
				 LoWr= 1'b1;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b10101: //madd ..
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'b10;
				 LoSel= 2'b10;
				 HiWr= 1'b1;
				 LoWr= 1'b1;
				 MAluOp= 1'b1; //add
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'b10110:  //msub
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'b10;
				 LoSel= 2'b10;
				 HiWr= 1'b1;
				 LoWr= 1'b1;
				 MAluOp= 1'b0; //sub
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b000;
			 end
			 
			 5'b10111: //lw
			 begin
			     iorD= 1'b1;
				 memRd= 1'b1;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx; 
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b011;
			 end
			 
			 5'b11000:  //sw ..
			 begin
			     iorD= 1'b1;
				 memRd= 1'b0;
				 memWr= 1'b1;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx; 
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				  next_address = 3'b000;
			 end
			 
			 5'b11001: //addi, ori wb
			 begin
			     iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx; 
				 MemToReg= 3'b000;
				 RegDst= 2'b01;
				 RegWr= 1'b1;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
				 
				 next_address = 3'b000;
			 end
			 
			 5'b11010: //lw wb
			 begin
			    iorD= 1'bx;
				 memRd= 1'b0;
				 memWr= 1'b0;
				 irWr= 1'b0;
				 AluSrcA= 2'bxx;
				 AluSrcB= 3'bxxx;
				 AluCtrl= 3'bxxx; //dc 	
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx; 
				 MemToReg= 3'b001;
				 RegDst= 2'b01;
				 RegWr= 1'b1;
				 PcWr= 1'b0;
				 PcWrCon= 1'b0;
				 PcSrc= 3'bxxx;
				 
				 intCause= 1'bx;
				 causeWrite= 1'b0;
				 EPCwrite= 1'b0;
			     
				 next_address = 3'b000;
			 end
			 
			 5'd31: //undefined exception
			 begin
			     iorD= 1'b0;
				 memRd= 1'b1;
				 memWr= 1'b0;
				 irWr= 1'b1;
				 AluSrcA= 2'b00;
				 AluSrcB= 3'b000;
				 AluCtrl= 3'b110; //sub
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b100;
				 
				 intCause= 1'b0;
				 causeWrite= 1'b1;
				 EPCwrite= 1'b1;
				 
				 next_address= 3'b000;
			 end
			 
			 5'd30: //overflow exception
			 begin
                 iorD= 1'b0;
				 memRd= 1'b1;
				 memWr= 1'b0;
				 irWr= 1'b1;
				 AluSrcA= 2'b00;
				 AluSrcB= 3'b000;
				 AluCtrl= 3'b110; //sub
				 HiSel= 2'bxx;
				 LoSel= 2'bxx;
				 HiWr= 1'b0;
				 LoWr= 1'b0;
				 MAluOp= 1'bx;
				 MemToReg= 3'bxxx;
				 RegDst= 2'bxx;
				 RegWr= 1'b0;
				 PcWr= 1'b1;
				 PcWrCon= 1'b0;
				 PcSrc= 3'b100;
				 
				 intCause= 1'b1;
				 causeWrite= 1'b1; //arthemetic expection
				 EPCwrite= 1'b1;
				 
				 next_address = 3'b000;
			 end
		
		endcase
		
		
    end
endmodule