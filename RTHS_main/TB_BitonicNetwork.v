///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   Monday, ‎July ‎2, ‎2018, ‏‎3:33:29 PM
// Design Name:     TB_BitonicNetwork
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Test bench for Bitonic NEtwork
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////

`timescale 1ns / 1ps
module TB_BitonicNetwork #( parameter NUM = 16, W = 32);

	// Inputs
	reg [NUM*W-1:0] IN ;
	
	// Output
	wire[NUM*W-1:0] OUT;

	// Instantiate the Bitonic Network
	BitonicNetwork #(NUM, W) BN (
		.direction(1'b0),
		.IN (IN),
		.OUT(OUT)
	);
	// 500MHz frequency
	//initial begin
	//	clk <= 1'b1;
	//	forever #1 clk <= ~clk;
	//end
	
	initial begin
		forever begin
			IN = {8{$random}};
			#10;
      end
	end
      
endmodule

