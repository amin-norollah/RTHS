///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)
// Modified Date:   Wednesday, ‎July ‎4, ‎2018, ‏‎10:54:49 AM
// Design Name:     Control
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Control unit, you can find description about this module from paper below.
//                  ("RTHS: A Low-Cost High-Performance Real-Time Hardware Sorter, Using 
//                  a Multidimensional Sorting Algorithm", doi: 10.1109/TVLSI.2019.2912554)
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

module Control(
		//INPUT
		input clk,
		input start,

		//OUTPUT
		output[3:0] direction,
		output ready
	);
	reg[2:0] state;
	//reg count;
	////////////////////////////////////////////////////
	//  [  direction  ]    
	//  [3] [2] [1] [0]      STATE   fun
	//-------------------------------------------------
	//   0   0   0   0       010     HS
	//   0   1   0   1       011     VS
	//
	//   0   0   0   0       100     HS
	//   1   0   1   0       101     VS
	//
	//   0   0   0   0       110     HS
	//   0   0   0   0       111     VS
	//
	//   0   0   0   0       00x     wait
	//
	////////////////////////////////////////////////////
	
	assign direction = (state[0])?((state[2]^state[1])? {state[2:1],state[2:1]}:4'h0): 4'h0;
	assign ready = (state[2:1]==2'b00);
	
	always @(posedge clk or posedge start) begin
		if(start) begin
			state <= 3'b010;
		end else begin
			if(state[2:1] == 2'b00)
				state <= state;
			else
				state <= state+1;		
		end
	end
	
endmodule
