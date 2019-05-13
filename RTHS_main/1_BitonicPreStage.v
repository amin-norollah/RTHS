module BitonicPreStage #( parameter NUM = 16, W = 16)(
		//INPUT
		input clk, rst,
		input  direction,
		input  [(NUM*W)-1 :0] IN ,
		
		//OUTPUT
		output [(NUM*W)-1 :0] OUT
	);
	
	genvar i;
   generate
   for(i = 0; i < NUM/2; i = i+1)
      begin: PreStage_
			Comparator #(W) COM_ (
				.clk(clk), .rst(rst), 
				.direction(direction),
				.IN1 (IN [W*i +(W-1)  : W*i]),
				.IN2 (IN [(NUM*W -1)-W*i : (NUM*W -1)-W*i -(W-1)]),
				.OUT1(OUT[W*i +(W-1)  : W*i]),
				.OUT2(OUT[(NUM*W -1)-W*i : (NUM*W -1)-W*i -(W-1)])
			);
		end
   endgenerate


endmodule
