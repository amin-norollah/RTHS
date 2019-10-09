///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   ‎Wednesday, ‎July ‎4, ‎2018, ‏‎10:32:17 AM
// Design Name:     BitonicPosStage3
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Explaind in "BitonicPosStage1" module.
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

module BitonicPosStage3 #( parameter W = 16)(
		//INPUT
		//input clk, rst,
		input  direction,
		input  [(8*W)-1:0]  IN,
		
		//OUTPUT
		output [(8*W)-1:0] OUT
	);
	
	wire [(8*W)-1:0] _wire;
	
	genvar i;
   generate
   for(i = 0; i < 2; i = i+1)
      begin: Stage3_
			Comparator #(W) COM_1 (
				//.clk(clk), .rst(rst), 
				.direction(direction),
				.IN1 (IN [4*W*i+(W-1): 4*W*i]),
				.IN2 (IN [4*W*i+(3*W-1): 4*W*i+(2*W)]),
				.OUT1(_wire[4*W*i+(W-1): 4*W*i]),
				.OUT2(_wire[4*W*i+(3*W-1): 4*W*i+(2*W)])
			);
			
			Comparator #(W) COM_2 (
				//.clk(clk), .rst(rst), 
				.direction(direction),
				.IN1 (IN [4*W*i+(2*W-1): 4*W*i+W]),
				.IN2 (IN [4*W*i+(4*W-1): 4*W*i+(3*W)]),
				.OUT1(_wire[4*W*i+(2*W-1): 4*W*i+W]),
				.OUT2(_wire[4*W*i+(4*W-1): 4*W*i+(3*W)])
			);
			
			BitonicPosStage2 #(W) Bitonic_ (
				//.clk(clk), .rst(rst), 
				.direction(direction),
				.IN  (_wire [4*W*i +(4*W-1):4*W*i]), 
				.OUT (OUT   [4*W*i +(4*W-1):4*W*i])
			);
      end
   endgenerate

endmodule
