module BitonicPosStage2 #( parameter W = 16)(
		//INPUT
		input clk, rst,
		input  direction,
		input  [(4*W)-1:0] IN,
		
		//OUTPUT
		output [(4*W)-1:0] OUT
	);

	genvar i;
   generate
   for(i = 0; i < 2; i = i+1)
      begin: Stage2_
			BitonicPosStage1 #(W) Bitonic_ (
				.clk(clk), .rst(rst), 
				.direction(direction),
				.IN  (IN  [2*W*i +(2*W-1):2*W*i]), 
				.OUT (OUT [2*W*i +(2*W-1):2*W*i])
			);
      end
   endgenerate

endmodule
