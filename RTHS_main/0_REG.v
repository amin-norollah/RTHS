module REG #( parameter NUM = 16)(
		//INPUT
		input clk, rst,
		input [NUM-1 :0] IN,
		
		//OUTPUT
		output reg [NUM-1 :0] OUT
	);
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			OUT <= 0;
		else
			OUT <= IN;
	end

endmodule
