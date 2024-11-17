module circuit4(input wire [3:0] i, input wire y, cin, output wire so, cout);
    wire w1, w2, w3;

    module1 M1(i, w1, w2);
    module2 M2(w1, w2, y, w3);
    module3 M3(w3, cin, so, cout);
endmodule