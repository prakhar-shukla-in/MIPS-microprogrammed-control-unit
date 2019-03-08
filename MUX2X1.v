module MUX2X1(input [2:0] address_control,
			  input overflow,
			  input [4:0] current_address,
			  output reg [2:0] address_select);
always@(*)
begin			  
	if(overflow==1 && current_address != 5'd0 && current_address != 5'd1 && current_address != 5'd12) begin
	   address_select = 3'b110;
	   end
	
	else begin
	   address_select = address_control;
	  end
end	  
endmodule