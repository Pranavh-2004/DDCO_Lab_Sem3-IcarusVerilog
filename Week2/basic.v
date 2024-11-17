module invert(input wire i, output wire o1);
    assign o1=!i;
endmodule

module and2(input wire i0, i1, output wire o2);
    assign o2 = i0 & i1;
endmodule

module or2(input wire i0, i1, output wire o3);
    assign o3 = i0 | i1;
endmodule

module  nand2(input wire i0, i1, output wire o4);
    assign o4 = ~(i0 & i1);
endmodule

module  nor2(input wire i0, i1, output wire o5);
    assign o5 = ~(i0 | i1);
endmodule

module  xor2(input wire i0, i1, output wire o6);
    assign o6 = i0 ^ i1;
endmodule

module  xnor2(input wire i0, i1, output wire o7);
    assign o7 = ~(i0 ^ i1);
endmodule

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

module halfadder(A, B, S, C);
    input A, B;
    output S, C;
    wire w1, w2;
    xor2 G1(A, B, S);
    and2 G2(A, B, C);
endmodule

/*
module  nand2(input wire i0, i1, output wire o4);
    wire t;
    and2 and2_0 (i0,i1,t);
    invert invert_0 (t,o4);
endmodule
*/