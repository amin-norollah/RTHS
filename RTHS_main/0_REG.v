///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   ‎Wednesday, ‎July ‎4, ‎2018, ‏‎12:22:59 AM
// Design Name:     REG
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Register bank
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

module REG #( parameter NUM = 16)(
		//INPUT
		input clk, rst,
		input [NUM-1 :0] IN,
		
		//OUTPUT
		output reg [NUM-1 :0] OUT
	);
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			OUT <= 0;
		else
			OUT <= IN;
	end

endmodule
