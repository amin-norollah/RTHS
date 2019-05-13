`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:	
//
// Create Date:   12:31:08 05/18/2018
// Design Name:   BitonicNetwork
// Project Name:  newSort
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BitonicNetwork
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

