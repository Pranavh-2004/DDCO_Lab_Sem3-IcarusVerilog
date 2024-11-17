module fulladder(A, B, Cin, S, Cout);
    input A, B, Cin;
    output S, Cout;
    wire [4:0] t;

    xor2 G1(A, B, t[0]);
    and2 G2(t[0], Cin, S);

    and2 G3(A, B, t[1]);
    and2 G4(A, Cin, t[2]);
    and2 G5(B, Cin, t[3]);

    or2 G6(t[1], t[2], t[4]);
    or2 G7(t[3], t[4], Cout);
endmodule
