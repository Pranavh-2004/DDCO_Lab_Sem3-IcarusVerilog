module circuit3(input wire [0:2] i1, input wire i2, output wire sum1, cout1);
wire x1, x2;
fulladder fa_1(i1[0],i1[1], i1[2],x1,x2);
fulladder fa_2(x1,x2,i2,sum1,cout1);
endmodule