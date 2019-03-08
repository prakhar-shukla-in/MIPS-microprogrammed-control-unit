//`timescale 1ns / 1ps
module MUX_6X1(input [4:0] zero,
               input [4:0] dispatch_table_1,
               input [4:0] dispatch_table_2,
			   input [4:0] dispatch_table_3,
			   input [4:0] adder_plus_1,
			   input [2:0] next_addr_select,
			   input [4:0] WriteBack,
			   input [4:0] Overflow_exception_state,
			   output reg[4:0] current_address
			   );
always@(*)
begin
	if(next_addr_select == 3'b000)
      begin
	       current_address = zero;
      end
	if(next_addr_select == 3'b001)
      begin
	      current_address = dispatch_table_1;
      end	 
    if(next_addr_select == 3'b010)
      begin
	      current_address = dispatch_table_2;
      end	
    if(next_addr_select == 3'b011)
      begin
	      current_address = dispatch_table_3;
      end
    if(next_addr_select == 3'b100)
      begin
	     current_address = adder_plus_1;
      end	
    if(next_addr_select == 3'b101)
      begin
	      current_address = WriteBack;
      end	
	if(next_addr_select == 3'b110)
      begin
	      current_address = 5'd30;
      end	
end	  
endmodule 