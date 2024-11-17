module circuit_test;
    reg a, b, c;
    wire d, e;

    circuit M1(a,b,c,d,e);

    initial begin
        $monitor($time, " a=%b, b=%b, c=%b d=%b, e=%b", a, b, c, d, e);
        $dumpfile("circuit_test.vcd");
        $dumpvars(0, circuit_test);
        a=1'b0; b=1'b0; c=1'b0;
        #20
        a=1'b0; b=1'b0; c=1'b1;
        #20
        a=1'b0; b=1'b1; c=1'b0;
        #20
        a=1'b0; b=1'b1; c=1'b1;
        #20
        a=1'b1; b=1'b0; c=1'b0;
        #20
        a=1'b1; b=1'b0; c=1'b1;
        #20
        a=1'b1; b=1'b1; c=1'b0;
        #20
        a=1'b1; b=1'b1; c=1'b1;
    end
endmodule