///////////////////////////////////////////////////////////
//
// Author:          Amin Norollah (an.norollah@gmail.com)	
// Modified Date:   ‎Today, ‎May ‎22, ‎2019, ‏‎11:16:55 AM
// Design Name:     TB_Sorter
// Project Name:    RTHS
// Target Device:   Virtex Family FPGA
// Tool versions:   Vivado 2018.2
// Description:     Test bench for simple RTHS
// 
// Licence:         These project have been published for 
//                  academic use only under GPLv3 License.
//                  Copyright  2018
//                  All Rights Reserved
///////////////////////////////////////////////////////////
`timescale 1ns / 1ps

`define PACK_ARRAY(PK_WIDTH,PK_LEN,PK_SRC,PK_DEST)    genvar pk_idx;   generate for (pk_idx=0; pk_idx<(PK_LEN); pk_idx=pk_idx+1) begin;         assign PK_DEST[((PK_WIDTH)*pk_idx+((PK_WIDTH)-1)):((PK_WIDTH)*pk_idx)] = PK_SRC[pk_idx][((PK_WIDTH)-1):0];     end; endgenerate
`define UNPACK_ARRAY(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC)  genvar unpk_idx; generate for (unpk_idx=0; unpk_idx<(PK_LEN); unpk_idx=unpk_idx+1) begin; assign PK_DEST[unpk_idx][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx)]; end; endgenerate

`define UNPACK_ARRAY2(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC)  genvar y; generate for (y=0; y<(PK_LEN); y=y+1) begin; assign PK_DEST[y][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*y+(PK_WIDTH-1)):((PK_WIDTH)*y)]; end; endgenerate


module TB_Sorter #(parameter N=16, W = 16);

	// Inputs
	reg clk;
	reg [W-1:0] DATA_IN [N-1:0];
	reg start;

	// Outputs
	wire [N*W-1:0] keyIn, keyOut;
	//wire [N*W:0] keyIn_tmp [0:1];
	
	wire [W-1:0] DATA_OUT [N-1:0];
	wire ready;

	integer f, i;

	SorterMain #(4 , W) sorter(
		//INPUT
		.clk   (clk), 
		.start (start),
		.keyIn (keyIn),
		
		//OUTPUT
		.keyOut(keyOut),
		.ready (ready)
   );
	
	//assign key    = (wr_en) ? keyIn_tmp[address] : ((rst)? 0: {N*16{1'bz}}); // To drive the inout net
	//assign keyOut = key ; // To drive the inout net
	
	////////////////////////////
	/// convert input and output
	
	`PACK_ARRAY   (16, N, DATA_IN , keyIn);
	//`UNPACK_ARRAY2 (512, 2, keyIn_tmp , keyIn );
	
	`UNPACK_ARRAY (16, N, DATA_OUT , keyOut );
	///
	////////////////////////////
	
	// 500MHz frequency
	initial begin
		clk <= 1'b1;
		forever #1 clk <= ~clk;
	end

	initial begin
		f = $fopen("D:/output.hex","w");
		$readmemh("D:/input.hex", DATA_IN); //hex
		start <= 1'b1;
		#2
		start <= 1'b0;
		
		////////////////////////////////////////
		@(posedge ready);
		////////////////////////////////////////
		
		//read data from sorter
		//@(posedge clk)
		@(posedge clk)
			for (i = 0; i<N; i=i+1) begin
				$fwrite(f,"%h\n",DATA_OUT[i]);  //1
			end
		$fclose(f);		
	end

endmodule
