//`timescale 1ns / 1ps
module dispatch2(opcode,funct,next_state_DT2);

input[5:0] funct;
input[5:0] opcode;
output reg[4:0] next_state_DT2;

always@(*)
begin
if(opcode == 6'b000000)
begin
	case(funct)
	6'b011010 : next_state_DT2 = 5'd20; //div
	6'b000101 : next_state_DT2 = 5'd21; //madd
	6'b011000 : next_state_DT2 = 5'd20; //mult
	6'b000110 : next_state_DT2 = 5'd22; //msub
	endcase
end

else
begin
	case(opcode)
	6'b101011 : next_state_DT2 = 5'd24; //sw
	6'b001000 : next_state_DT2 = 5'd25; //addi
	6'b001101 : next_state_DT2 = 5'd25; //ori
	6'b100011 : next_state_DT2 = 5'd23; //lw
	endcase
end

end
endmodule
