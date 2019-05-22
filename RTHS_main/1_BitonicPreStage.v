///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   Wednesday, ‎July ‎4, ‎2018, ‏‎10:42:18 AM
// Design Name:     BitonicPreStage
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     We have divided Bitoic network into 2 parts, prestage and posstage.
//                  prestage contain first comparator that are not repeated on a regular form.
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

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
