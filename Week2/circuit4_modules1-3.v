//Full Adder (Module 1)
module module1(input wire [3:0] i, output wire so, co);
    fulladder FA(i[0], i[1], i[2], so, co);
endmodule

//AND Gate (Module 2)
module module2 (input wire a, b, c, output wire o);
   wire w1, w2;

    invert M0(c, w1);
    and2 M1(a, b, w2);
    and2 M2(w1, w2, o);
endmodule

//Half Adder (Module 3)
module module3(input wire a, b, output wire so, cout);
    halfadder HA(a, b, so, cout);
endmodule