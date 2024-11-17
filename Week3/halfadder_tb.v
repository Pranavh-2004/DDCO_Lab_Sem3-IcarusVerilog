module halfadder_test;

    reg A, B;        
    wire S, C;       

    halfadder M1(A, B, S, C);

    initial begin
        $monitor($time, " A=%b, B=%b, Sum=%b, Carry=%b", A, B, S, C);
        $dumpfile("halfadder_test.vcd");
        $dumpvars(0, halfadder_test);
        
        A = 1'b0; B = 1'b0;
        #5 
        A = 1'b0; B = 1'b1;
        #5 
        A = 1'b1; B = 1'b0;
        #5 
        A = 1'b1; B = 1'b1;
    end

endmodule