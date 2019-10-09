///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   Wednesday, ‎July ‎4, ‎2018, ‏‎10:41:02 AM
// Design Name:     Comparator
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Main module of RTHS design, you can find description about this module from paper below.
//                  ("RTHS: A Low-Cost High-Performance Real-Time Hardware Sorter, Using 
//                  a Multidimensional Sorting Algorithm", doi: 10.1109/TVLSI.2019.2912554)
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

module Comparator #( parameter W = 16)(
		//INPUT
		//input clk, rst,
		input direction ,
		input[W-1:0] IN1 ,
		input[W-1:0] IN2 ,
		
		//OUTPUT
		//output reg[W-1:0] OUT1 ,
		//output reg[W-1:0] OUT2
		output [W-1:0] OUT1 ,
		output [W-1:0] OUT2
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
	
	//always @(posedge clk or posedge rst) begin
	//	if(rst) begin
	//		OUT1 <= 0;
	//		OUT2 <= 0;
	//	end else begin
	//		OUT1 <= (comp)? IN1:IN2;
	//		OUT2 <= (comp)? IN2:IN1;
	//	end
	//end
	assign OUT1 = (comp)? IN1:IN2;
	assign OUT2 = (comp)? IN2:IN1;
	
endmodule
