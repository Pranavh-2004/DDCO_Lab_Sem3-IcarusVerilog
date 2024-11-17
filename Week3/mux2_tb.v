module TB;
reg A, B, S;
wire X;
initial begin
    $monitor("At time %0t: S = %b, A = %b, B = %b, X = %b", $time, S, A, B, X);
    $dumpfile("mux2_test.vcd");
    $dumpvars(0, TB);
end

mux2 newmux(.i0(A), .i1(B), .j(S), .o(X));

initial begin
    S=1'b0; A=1'b0; B=1'b0; #5;
    S=1'b0; A=1'b0; B=1'b1; #5;
    S=1'b0; A=1'b1; B=1'b0; #5;
    S=1'b0; A=1'b1; B=1'b1; #5;
    S=1'b1; A=1'b0; B=1'b0; #5;
    S=1'b1; A=1'b0; B=1'b1; #5;
    S=1'b1; A=1'b1; B=1'b0; #5;
    S=1'b1; A=1'b1; B=1'b1; #5;
end
endmodule