module FCU (P0, D, F, P);

input        P0;
input  [4:1] D, F;
output [4:1] P;

assign P[1]= D[1]|(P0&F[1]);
assign P[2]= D[2] | (D[1]&F[2]) | (P0&F[1]&F[2]);
assign P[3]= D[3] | (D[2]&F[3]) | (D[1]&F[2]&F[3]) | (P0&F[1]&F[2]&F[3]);
assign P[4]= D[4] | (D[3]&F[4]) | (D[2]&F[3]&F[4]) | (D[1]&F[2]&F[3]&F[4]) | (P0&F[1]&F[2]&F[3]&F[4]);


endmodule