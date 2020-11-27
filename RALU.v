module RALU(
			input 			clk_i,
			input 			rst_i,
			input  [3:0] 	DataIn_i,
			input  [3:0] 	S_i,
			input 			M_i,
			input 			P0_i,
			input 			A_i,
			input  [3:0]	v_i,
			input 			wr_i,
			input  [2:0] 	adr_i,
			input 			ISR_i,
			input 			ISL_i,
			
			output reg		OSR_o,
			output reg		OSL_o,
			output 			P4_o,
			output [3:0]	R_o
			);
			

reg [3:0] RgA;
reg [3:0] RgB;
reg [4:1] P;

assign P4_o = P[4];

ALU_ParallelCarry ALU(
	.A	( RgA  ),						
	.B	( RgB  ),
	.S	( S_i  ),
	.M	( M_i  ),
	.P0( P0_i ),
	.R	( R_o  ),
	.P	( P    )
);

	
// RegA
always @ ( posedge clk_i or posedge rst_i )
begin
	if ( rst_i ) RgA <= 4'b0000;
	else
	if ( v_i[0] ) // Write
		RgA = A_i ? DataIn_i : RON[adr_i];
end
	
// RegB
localparam SHIFT_TO_LEFT = 2'b01;
localparam SHIFT_TO_RIGHT = 2'b10;
localparam WRITE_TO_REGB = 2'b11;


always @ ( posedge clk_i or posedge rst_i )
begin
	if ( rst_i ) RgB <= 4'b0000;
	else
	begin
		case(v_i[2:1])
			SHIFT_TO_LEFT: // 01 shift to left
				begin
				{OSL_o, RgB} <= {RgB[3], RgB[2:0], ISL_i};
				end
			SHIFT_TO_RIGHT: // 10 shift to right
				begin
				{OSR_o, RgB} <= {RgB[0], ISR_i, RgB[3:1]};
				end
			WRITE_TO_REGB: // 11 write
				RgB <= RON[adr_i]; 
		endcase	
	end
end
	
// RON
reg [3:0] RON [0:7];
integer i = 0;

always @ ( posedge clk_i or posedge rst_i )
begin
	if ( rst_i )
	begin
		for (i = 0; i < 8; i = i + 1)
			RON[i] = 4'b0000;
	end
	else
	begin
		if ( wr_i )
			RON[adr_i] <= R_o;
	end
end	
endmodule
