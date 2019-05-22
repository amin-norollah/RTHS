///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)
// Modified Date:   Wednesday, ‎July ‎4, ‎2018, ‏‎1:02:52 PM
// Design Name:     Switch
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Switch unit, you can find description about this module from paper below.
//                  ("RTHS: A Low-Cost High-Performance Real-Time Hardware Sorter, Using 
//                  a Multidimensional Sorting Algorithm", doi: 10.1109/TVLSI.2019.2912554)
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

module Switch #( parameter NUM = 4 , W = 16)(
		//INPUT
		input [NUM*W-1:0] IN1,
		input [NUM*W-1:0] IN2,
		input [NUM*W-1:0] IN3,
		input [NUM*W-1:0] IN4,
		
		//OUTPUT
		output [NUM*W-1:0] OUT1,
		output [NUM*W-1:0] OUT2,
		output [NUM*W-1:0] OUT3,
		output [NUM*W-1:0] OUT4
   );	
	assign OUT1 = {IN4[W-1:0]    , IN3[W-1:0]    , IN2[W-1:0]    , IN1[W-1:0]};
	assign OUT2 = {IN4[2*W-1:W]  , IN3[2*W-1:W]  , IN2[2*W-1:W]  , IN1[2*W-1:W]};
	assign OUT3 = {IN4[3*W-1:2*W], IN3[3*W-1:2*W], IN2[3*W-1:2*W], IN1[3*W-1:2*W]};
	assign OUT4 = {IN4[4*W-1:3*W], IN3[4*W-1:3*W], IN2[4*W-1:3*W], IN1[4*W-1:3*W]};
	
endmodule
