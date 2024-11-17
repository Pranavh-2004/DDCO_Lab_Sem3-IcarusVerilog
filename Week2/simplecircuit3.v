module simple_circuit3(A, B, C, Y);
input A, B, C;
output Y;
wire w1;
and2 G1(B, C, w1);
or2 G2(A, w1, w2);
and2 G3(A, B, w3);
or2 G4(w2, w3, Y);
endmodule