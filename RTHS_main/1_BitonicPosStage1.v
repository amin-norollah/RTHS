///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   ‎Wednesday, ‎July ‎4, ‎2018, ‏‎10:20:12 AM
// Design Name:     BitonicPosStage1
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     We have divided Bitoic network into 2 parts, prestage and posstage.
//                  posstage contain regular part of network which the comparators are 
//                  connected in each other in regular form (see figure 2 in paper below).
//                  ("RTHS: A Low-Cost High-Performance Real-Time Hardware Sorter, Using 
//                  a Multidimensional Sorting Algorithm", doi: 10.1109/TVLSI.2019.2912554)
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

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
