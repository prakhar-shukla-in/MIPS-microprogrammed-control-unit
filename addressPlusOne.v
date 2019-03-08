//`timescale 1ns / 1ps
module addressPlusOne(input [4:0] address,
                      output reg [4:0] address_plus1);
	always@(*)
    assign address_plus1 = address + 1'b1;					  
endmodule