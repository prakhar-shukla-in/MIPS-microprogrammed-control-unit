//`timescale 1ns / 1ps
module dispatch3(opcode,funct,nextState);

input[5:0] funct;
input[5:0] opcode;
output reg[4:0] nextState;

always@(*)
begin

case(opcode)
6'b100011 : nextState = 5'd26;
default : nextState = 5'bxxxxx; //dont care
endcase

end
endmodule
