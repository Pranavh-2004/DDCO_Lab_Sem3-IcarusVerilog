module simple_circuit2_test;

reg A,B,C;
wire Y;
simple_circuit2 M1(A, B, C, Y);

initial begin
     $monitor($time, " A=%b, B=%b, C=%b Y=%b", A, B, C, Y);
        $dumpfile("simple_circuit2_test.vcd");
        $dumpvars(0, simple_circuit2_test);
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