module demux2_tb;
reg in, sel;
wire y0, y1;

initial begin
    $dumpfile("demux2_test.vcd");
    $dumpvars(0,demux2_tb);
end

demux2 newdemux(.i(in), .j(sel), .o0(y0), .o1(y1));

initial begin
    in=1'b0; sel=1'b0; #5;
    in=1'b1; sel=1'b0; #5;
    in=1'b0; sel=1'b1; #5;
    in=1'b1; sel=1'b1; #5;    
end

always@(in or sel)
$monitor("At time = %t, Input=%b, select=%b, y0=%b, y1=%b", $time, in, sel, y0, y1);

endmodule