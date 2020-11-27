module ControlUnit(	
	input clk_i,
	input rst_i,
	input CarryFlag_i,
	input ZeroFlag_i,

	output reg [16:0] ControlBus_o
	//S[3:0],M,P0,ISR,ISL,A,adr[2:0],v[3:0]
);

// TRANSITION CONDITION CODES (TCC)
	localparam NOT_EQUAL            = 001;
	localparam GREATER              = 010;
	localparam LESS                 = 011;
	localparam EQUAL                = 100;
	localparam GREATER_OR_EQUAL     = 101;
	localparam LESS_OR_EQUAL        = 110;
	localparam UNCONDITIONAL        = 111;

	reg [19:0] ROM [0:63];
	reg [5:0] p_counter; // programm counter
	
	initial $readmemb("prog2.bin", ROM);
	
	wire [19:0] cmd;
	wire [2:0]	TCC;

	assign TCC = cmd[19:17];
	assign cmd = ROM[p_counter];

	always @ (posedge clk_i or posedge rst_i)
	begin		
		if ( rst_i ) begin
			p_counter <= 6'd0;
		end
		else begin
			ControlBus_o <= 17'd0;
			case( TCC )
				NOT_EQUAL:	
					if ( !ZeroFlag_i ) 
						p_counter <= cmd[5:0];
					else 
						p_counter <= p_counter + 1;
				GREATER:		
					if ( CarryFlag_i && !ZeroFlag_i ) 
						p_counter <= cmd[5:0];
					else 
						p_counter <= p_counter + 1;
				LESS:	
					if ( !CarryFlag_i && !ZeroFlag_i ) 
						p_counter <= cmd[5:0];
					else 
						p_counter <= p_counter + 1;
				EQUAL:
					if ( ZeroFlag_i ) 
						p_counter <= cmd[5:0];
					else 
						p_counter <= p_counter + 1;
				GREATER_OR_EQUAL:	
					if ( CarryFlag_i || ZeroFlag_i ) 
						p_counter <= cmd[5:0];
					else 
						p_counter <= p_counter + 1;
				LESS_OR_EQUAL:
					if ( !CarryFlag_i || ZeroFlag_i ) 
						p_counter <= cmd[5:0];
					else 
						p_counter <= p_counter + 1;	
				UNCONDITIONAL:
					p_counter <= 6'd0;		
				default:	
					begin
						p_counter <= p_counter + 1;
						ControlBus_o <= cmd[16:0];
					end
			endcase
		end	
	end

endmodule