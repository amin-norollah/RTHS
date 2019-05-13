module SorterMain #( parameter NUM = 4 , W = 64)(
		//INPUT
		input clk,
		input start,
		input [(NUM*NUM*W)-1:0] keyIn,
		
		//OUTPUT
		output [(NUM*NUM*W)-1:0] keyOut,
		output ready
   );
	reg  [W-1:0] key_reg [NUM*NUM-1:0];
	
	wire [W-1:0] switch_In [NUM*NUM-1:0];
	wire [W-1:0] switch_Out [NUM*NUM-1:0];
	wire [3:0] direction;
	
	integer o, p;
	initial
		for(p=0; p<NUM*NUM; p = p+1)
			key_reg[p] <= 0;
	
	//assign keyOut = switch_Out;
	
	////////////////////////////
    /// convert input and output
    wire [W-1:0] _keyIn  [NUM*NUM-1:0];
    wire [W-1:0] _keyOut [NUM*NUM-1:0];
    
    genvar vnf;
    generate 
        for (vnf=0; vnf<NUM*NUM; vnf=vnf+1) begin : convert_signals
            assign _keyIn[vnf][W-1:0]     = keyIn[W*vnf+(W-1):W*vnf]; //unpacked
            assign keyOut[W*vnf+(W-1):W*vnf] = switch_Out[vnf][W-1:0]; //packed
        end
    endgenerate
    //
    ///
    ////////////////////////////
	
/******************************/
/*********** SORTER ***********/
/******************************/
	genvar q;
	generate
   for(q = 0; q < NUM; q = q+1)
      begin: BN
			BitonicNetwork #(NUM, W) BN (
				.clk      (clk),
				.rst      (start),
				.direction(direction[q]),

				.IN ({key_reg[4*q+3],   key_reg[4*q+2],   key_reg[4*q+1],   key_reg[4*q]}),
				.OUT({switch_In[4*q+3], switch_In[4*q+2], switch_In[4*q+1], switch_In[4*q]})
			);
      end
   endgenerate
	
	always @(posedge clk) begin
		for(o=0; o<NUM*NUM; o = o+1)
			key_reg[o] <= (start)? _keyIn[o] : switch_Out[o];
	end
	
/******************************/
/*********** SWITCH ***********/
/******************************/
	Switch #(NUM, W) SW(
		//INPUT
		.IN1  ({switch_In[3] , switch_In[2] , switch_In[1] , switch_In[0]}),
		.IN2  ({switch_In[7] , switch_In[6] , switch_In[5] , switch_In[4]}),
		.IN3  ({switch_In[11], switch_In[10], switch_In[9] , switch_In[8]}),
		.IN4  ({switch_In[15], switch_In[14], switch_In[13], switch_In[12]}),
		
		//OUTPUT
		.OUT1 ({switch_Out[3] , switch_Out[2] , switch_Out[1] , switch_Out[0]}),
		.OUT2 ({switch_Out[7] , switch_Out[6] , switch_Out[5] , switch_Out[4]}),
		.OUT3 ({switch_Out[11], switch_Out[10], switch_Out[9] , switch_Out[8]}),
		.OUT4 ({switch_Out[15], switch_Out[14], switch_Out[13], switch_Out[12]})
   );
	
/******************************/
/************ CTRL ************/
/******************************/
	Control CTRL(
		//INPUT
		.clk       (clk),
		.start     (start),

		//OUTPUT
		.direction (direction),
		.ready     (ready)
	);
	
endmodule
