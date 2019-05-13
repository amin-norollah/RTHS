module BitonicPosStage1 #( parameter W = 16)(
		//INPUT
		input clk, rst,
		input  direction,
		input  [(2*W)-1:0] IN,
		
		//OUTPUT
		output [(2*W)-1:0] OUT
	);
	
	Comparator #(W) COM_1 (.clk(clk), .rst(rst), .direction(direction), .IN1 (IN [W-1:0]), .IN2 (IN [2*W-1:W]), .OUT1 (OUT[W-1:0]), .OUT2 (OUT[2*W-1:W]));

endmodule
