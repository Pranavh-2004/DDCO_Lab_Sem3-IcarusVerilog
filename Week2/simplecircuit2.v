module simple_circuit2(A, B, C, Y);
input A, B, C;
output Y;
wire w1;
and2 G1(B, C, w1);
or2 G2(A, w1, Y);
endmodule