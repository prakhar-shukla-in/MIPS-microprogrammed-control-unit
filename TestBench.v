//`timescale 1ns / 1ps
module testBench;
      reg clk;
	  reg reset;
	  reg [5:0] funct;
	  reg [5:0] opcode;
	  reg overflow;
	  ControlUnit CU(.clk(clk),
	                 .reset(reset),
					 .funct(funct),
					 .opcode(opcode),
					 .overflow(overflow));
	  initial
	     begin
		    clk = 1'b1;
			reset = 1'b1;

		    //funct = 6'b100000; //add
			//opcode = 6'b000000;
			
			//funct = 6'b011000; //mult
			//opcode = 6'b000000;
			
			//funct = 6'b010011; //mtlo
			//opcode = 6'b000000;
			
			//funct = 6'b000100; //sllv
			//opcode = 6'b000000;
			
			//funct = 6'b001000; //jr
			//opcode = 6'b000000;
			
			//funct = 6'b001001; //jalr
			//opcode = 6'b000000;
			
			//funct = 6'b000110; //msub
			//opcode = 6'b000000;
			
			//funct = 6'b000000; //sll
			//opcode = 6'b000000;
			
			//funct = 6'b010000; //mfhi
			//opcode = 6'b000000;
			
			//funct = 6'b010010; //mflo
			//opcode = 6'b000000;
			
			//funct = 6'b010001; //mthi
			//opcode = 6'b000000;
			
			//funct = 6'b011010; //div
			//opcode = 6'b000000;
			
			//funct = 6'b000101; //madd
			//opcode = 6'b000000;
			
			//funct = 6'bxxxxxx; //addi
			//opcode = 6'b001000;
			
			//funct = 6'bxxxxxx; //lw
			//opcode = 6'b100011;
			
			//funct = 6'bxxxxxx; //sw
			//opcode = 6'b101011;
			
			//funct = 6'bxxxxxx; //j
			//opcode = 6'b000010;
			
			//funct = 6'bxxxxxx; //jal
			//opcode = 6'b000011;
			
			//funct = 6'bxxxxxx; //ori
			//opcode = 6'b001101;
			
			//funct = 6'bxxxxxx; //lui
			//opcode = 6'b001111;
			
			//funct = 6'bxxxxxx; //beq
			//opcode = 6'b000100;
			
			//funct = 6'b100000; //add with overflow
			//opcode = 6'b000000;
			//overflow = 1;
			
			//funct = 6'bxxxxxx; //addi with overflow
			//opcode = 6'b001000;
			//overflow = 1;
			
			funct = 6'b111111; //undefined instruction
			opcode = 6'b111111;
			overflow = 0;
			#10 reset=0;
		 end
	  
	  always
        begin
		#10 clk = ~clk;
        end	
endmodule