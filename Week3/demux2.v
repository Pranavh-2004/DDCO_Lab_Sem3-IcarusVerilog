module demux2(input wire i, j, output wire o0, o1);
    assign o0 = (j==0)?i:1'b0;
    assign o1 = (j==1)?i:1'b0;
endmodule