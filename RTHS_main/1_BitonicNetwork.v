///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   Wednesday, ‎July ‎4, ‎2018, ‏‎12:22:59 AM
// Design Name:     BitonicNetwork
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Bitonic Sorting Network (BSN).
//                  This module is scalable and suitable for
//                  expansion.
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

module BitonicNetwork #( parameter NUM = 4 , W = 16)(
		//INPUT
		//input clk, rst,
		input direction,
		input [(NUM*W)-1:0] IN ,  //"NUM" input records with "W" data width.
		
		//OUTPUT
		output [(NUM*W)-1:0] OUT
   );
	wire [(NUM*W)-1:0] _stage1;
	wire [(NUM*W)-1:0] _stage2_1, _stage2_2;
	
	assign OUT       = _stage2_2;
	
	genvar a, b, c ,d ,e;

// Simple bitonic network with 4 input records:
//
// IN[0] -----*----------------*----> OUT[0]
//            |                |
// IN[1] -----*------------*---|----> OUT[1]
//                         |   |
// IN[2] -----*------------*---|----> OUT[2]
//            |                |
// IN[3] -----*----------------*----> OUT[3]
//          stage 1        stage 2
//
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/// STAGE 1
   generate
   for(a = 0; a < NUM/2; a = a+1)
      begin: Stage1	
			BitonicPosStage1 #(W) Pos_Bitonic(
				//.clk(clk), .rst(rst), 
				.direction(direction),
				.IN  (IN     [2*W*a +(2*W-1):2*W*a]), 
				.OUT (_stage1[2*W*a +(2*W-1):2*W*a])
			);
      end
   endgenerate
	
	/// reg bitween two stage
	//REG #(NUM*16) REG_STAGE_1( .clk(clk), .rst(rst), .IN(_stage1), .OUT(_reg1));
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/// STAGE 2
   generate
   for(b = 0; b < NUM/4; b = b+1)
      begin: Stage2
			BitonicPreStage #(4, W) Pre_Bitonic (
				//.clk(clk), .rst(rst), 
				.direction(direction),
				.IN  (_stage1  [4*W*b +(4*W-1):4*W*b]), 
				.OUT (_stage2_1[4*W*b +(4*W-1):4*W*b])
			);
		
			BitonicPosStage2 #(W) Pos_Bitonic(
				//.clk(clk), .rst(rst), 
				.direction(direction),
				.IN  (_stage2_1[4*W*b +(4*W-1):4*W*b]), 
				.OUT (_stage2_2[4*W*b +(4*W-1):4*W*b])
			);
      end
   endgenerate
	/// reg bitween two stage
	//REG #(NUM*16) REG_STAGE_2( .clk(clk), .rst(rst), .IN(_stage2_2), .OUT(_reg2));

	
endmodule
