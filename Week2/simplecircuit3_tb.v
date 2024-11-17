module simple_circuit3_test;

reg A,B,C;
wire Y;
simple_circuit3 M1(A, B, C, Y);

initial begin
     $monitor($time, " A=%b, B=%b, C=%b Y=%b", A, B, C, Y);
        $dumpfile("simple_circuit3_test.vcd");
        $dumpvars(0, simple_circuit3_test);
        A=1'b0; B=1'b0; C=1'b0;
        #20
        A=1'b0; B=1'b0; C=1'b1;
        #20
        A=1'b0; B=1'b1; C=1'b0;
        #20
        A=1'b0; B=1'b1; C=1'b1;
        #20
        A=1'b1; B=1'b0; C=1'b0;
        #20
        A=1'b1; B=1'b0; C=1'b1;
        #20
        A=1'b1; B=1'b1; C=1'b0;
        #20
        A=1'b1; B=1'b1; C=1'b1;
end
endmodule