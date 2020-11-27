// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Fri Nov 06 16:50:51 2020"

module ALU_ParallelCarry(
	P0,
	M,
	A,
	B,
	S,
	P,
	R
);


input wire	P0;
input wire	M;
input wire	[3:0] A;
input wire	[3:0] B;
input wire	[3:0] S;
output wire	[4:1] P;
output wire	[3:0] R;

wire	[4:1] D;
wire	[4:1] F;
wire	[4:0] P_ALTERA_SYNTHESIZED;
wire	[3:0] R_ALTERA_SYNTHESIZED;





FCU	b2v_inst(
	.P0(P_ALTERA_SYNTHESIZED[0]),
	.D(D),
	.F(F),
	.P(P_ALTERA_SYNTHESIZED[4:1]));


SM	b2v_inst1(
	.a(A[0]),
	.b(B[0]),
	.M(M),
	.Pin(P_ALTERA_SYNTHESIZED[0]),
	.S(S),
	.R(R_ALTERA_SYNTHESIZED[0]),
	.D(D[1]),
	.F(F[1])
	);


SM	b2v_inst2(
	.a(A[1]),
	.b(B[1]),
	.M(M),
	.Pin(P_ALTERA_SYNTHESIZED[1]),
	.S(S),
	.R(R_ALTERA_SYNTHESIZED[1]),
	.D(D[2]),
	.F(F[2])
	);


SM	b2v_inst3(
	.a(A[2]),
	.b(B[2]),
	.M(M),
	.Pin(P_ALTERA_SYNTHESIZED[2]),
	.S(S),
	.R(R_ALTERA_SYNTHESIZED[2]),
	.D(D[3]),
	.F(F[3])
	);


SM	b2v_inst4(
	.a(A[3]),
	.b(B[3]),
	.M(M),
	.Pin(P_ALTERA_SYNTHESIZED[3]),
	.S(S),
	.R(R_ALTERA_SYNTHESIZED[3]),
	.D(D[4]),
	.F(F[4])
	);

assign	P[4:1] = P_ALTERA_SYNTHESIZED[4:1];
assign	R = R_ALTERA_SYNTHESIZED;

endmodule
