module Comparator #( parameter W = 16)(
		//INPUT
		input clk, rst,
		input direction ,
		input[W-1:0] IN1 ,
		input[W-1:0] IN2 ,
		
		//OUTPUT
		output reg[W-1:0] OUT1 ,
		output reg[W-1:0] OUT2
   );
	//////////////////////////////////////
	// INPUT = {(W/2)key field,         //
	//          (W/2)information field} //
	//                                  //
	// DIRECTION     OUT1     OUT2      //
	// ------------------------------   //
	// 1'b0          smaller  bigger    //
	// 1'b1          bigger   smaller   //
	//////////////////////////////////////
	
	wire comp = (IN1[W-1:W/2]<IN2[W-1:W/2])^direction;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			OUT1 <= 0;
			OUT2 <= 0;
		end else begin
			OUT1 <= (comp)? IN1:IN2;
			OUT2 <= (comp)? IN2:IN1;
		end
	end
	//assign OUT1 = (comp)? IN1:IN2;
	//assign OUT2 = (comp)? IN2:IN1;
	
endmodule
