module circuit(a, b, c, d, e);
    input a, b, c;
    output d, e;
    wire w1;
    and2 g1 (a, b, w1);
    invert g2 (c, e);
    or2 g3 (w1, e, d);
endmodule