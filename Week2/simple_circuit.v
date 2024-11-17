module not1(input wire i, output wire o);
    assign o = ~i;
endmodule

module and2(input wire a, b, output wire o);
    assign o = a&b;
endmodule

module nand2(input wire a, b, output wire o);
    wire t;
    and2 G1(a,b,t);
    not1 G2(t,o);
endmodule

module xor2(input wire a, b, output wire o);
    wire t1, t2, t3;
    nand2 G1(a, b, t1);
    nand2 G2(a, t1, t2);
    nand2 G3(b, t1, t3);
    nand2 G4(t2, t3, o);
endmodule

module simple_circuit(input wire a, b, c, output wire o);
    wire t1, t2;
    xor2 G1(a, b, t1);
    xor2 G2(t1, c, t2);
    not1 G3(t2, o);
endmodule

module simple_circuit_tb();
reg a, b, c;
wire o;

simple_circuit M1(a,b,c,o);

initial begin
    $dumpfile("simple_circuit_test.vcd");
    $dumpvars(0, M1);
    $monitor($time, " A=%b, B=%b, C=%b Y=%b", a, b, c, o);

    a=1'b0; b=1'b0; c=1'b0; #20;
    a=1'b0; b=1'b0; c=1'b1; #20;
    a=1'b0; b=1'b1; c=1'b0; #20;
    a=1'b0; b=1'b1; c=1'b1; #20;
    a=1'b1; b=1'b0; c=1'b0; #20;
    a=1'b1; b=1'b0; c=1'b1; #20;
    a=1'b1; b=1'b1; c=1'b0; #20;
    a=1'b1; b=1'b1; c=1'b1; #20;
    $finish;
end
endmodule