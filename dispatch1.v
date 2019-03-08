//`timescale 1ns / 1ps
module dispatch1(opcode,funct,next_state_DT1);

input[5:0] funct;
input[5:0] opcode;
output reg[4:0] next_state_DT1;

always@(*)
begin
if(opcode == 6'b000000)
begin
	case(funct)
	6'b100000 : next_state_DT1 = 5'd12; //add
	6'b011000 : next_state_DT1 = 5'd16; //mult
	6'b010011 : next_state_DT1 = 5'd5; //mtlo
	6'b000100 : next_state_DT1 = 5'd14; //sllv
	6'b001000 : next_state_DT1 = 5'd10;//jr
	6'b001001 : next_state_DT1 = 5'd11; //jalr
	6'b000110 : next_state_DT1 = 5'd16; //msub
	6'b000000 : next_state_DT1 = 5'd13; //sll
	6'b010000 : next_state_DT1 = 5'd2;  //mfhi
	6'b010010 : next_state_DT1 = 5'd3; //mflo
	6'b010001 : next_state_DT1 = 5'd4; //mthi
	6'b011010 : next_state_DT1 = 5'd15; // div
	6'b000101 : next_state_DT1 = 5'd16; //madd
	
	endcase
end

else
begin
	case(opcode)
	6'b001000 : next_state_DT1 = 5'd17; //addi
	6'b100011 : next_state_DT1 = 5'd17; //lw
	6'b101011 : next_state_DT1 = 5'd17; //sw
	6'b000010 : next_state_DT1 = 5'd8; //j
	6'b000011 : next_state_DT1 = 5'd9; //jal
	6'b001101 : next_state_DT1 = 5'd18; //ori
	6'b001111 : next_state_DT1 = 5'd6; //lui
	6'b000100 : next_state_DT1 = 5'd7; //beq
	default : next_state_DT1 = 5'd31;//exception undefined instruction
	endcase
end

end
endmodule
