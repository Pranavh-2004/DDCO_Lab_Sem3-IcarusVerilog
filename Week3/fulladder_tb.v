module fulladder_test;

    reg A, B, Cin;        
    wire S, Cout;       

    fulladder M1(A, B, Cin, S, Cout);

    initial begin
        $monitor($time, " A=%b, B=%b, Cin=%b S=%b, Cout=%b", A, B, Cin, S, Cout);
        $dumpfile("fulladder_test.vcd");
        $dumpvars(0, fulladder_test);
        
        A = 1'b0; B = 1'b0; Cin = 1'b0; #20; 
        A = 1'b0; B = 1'b0; Cin = 1'b1; #20; 
        A = 1'b0; B = 1'b1; Cin = 1'b0; #20; 
        A = 1'b0; B = 1'b1; Cin = 1'b1; #20; 
        A = 1'b1; B = 1'b0; Cin = 1'b0; #20; 
        A = 1'b1; B = 1'b0; Cin = 1'b1; #20; 
        A = 1'b1; B = 1'b1; Cin = 1'b0; #20; 
        A = 1'b1; B = 1'b1; Cin = 1'b1; #20; 
    end

endmodule