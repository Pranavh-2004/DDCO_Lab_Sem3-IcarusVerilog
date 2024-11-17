module halfadder(A, B, S, C);
    input A, B;
    output S, C;
    wire w1, w2;
    xor2 G1(A, B, S);
    and2 G2(A, B, C);
endmodule
