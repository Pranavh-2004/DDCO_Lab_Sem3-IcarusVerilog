module reg16(input wire clk,reset,load,input wire [7:0]din,output wire [7:0]r);
	dfrl d0(clk,reset,load,din[0],r[0]);
	dfrl d1(clk,reset,load,din[1],r[1]);
	dfrl d2(clk,reset,load,din[2],r[2]);
	dfrl d3(clk,reset,load,din[3],r[3]);
	dfrl d4(clk,reset,load,din[4],r[4]);
	dfrl d5(clk,reset,load,din[5],r[5]);
	dfrl d6(clk,reset,load,din[6],r[6]);
	dfrl d7(clk,reset,load,din[7],r[7]);
endmodule

module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [7:0] d_in, output wire [7:0] d_out_a, d_out_b);
	wire [0:7]load;
	wire [0:7]r0,r1,r2,r3,r4,r5,r6,r7;
	demux8 dmx(wr,wr_addr[2],wr_addr[1],wr_addr[0],load);
	reg16 reg0(clk,reset,load[0],d_in,r0);
	reg16 reg1(clk,reset,load[1],d_in,r1);
	reg16 reg2(clk,reset,load[2],d_in,r2);
	reg16 reg3(clk,reset,load[3],d_in,r3);
	reg16 reg4(clk,reset,load[4],d_in,r4);
	reg16 reg5(clk,reset,load[5],d_in,r5);
	reg16 reg6(clk,reset,load[6],d_in,r6);
	reg16 reg7(clk,reset,load[7],d_in,r7);
	mux128_16 mm0(r0,r1,r2,r3,r4,r5,r6,r7,rd_addr_a[0],rd_addr_a[1],rd_addr_a[2],d_out_a);
	mux128_16 mm1(r0,r1,r2,r3,r4,r5,r6,r7,rd_addr_b[0],rd_addr_b[1],rd_addr_b[2],d_out_b);
endmodule

module mux128_16(input wire [7:0]i0,i1,i2,i3,i4,i5,i6,i7,input wire s0,s1,s2,output wire [7:0]o);
	mux8 mx0({i0[0],i1[0],i2[0],i3[0],i4[0],i5[0],i6[0],i7[0]},s2,s1,s0,o[0]);
	mux8 mx1({i0[1],i1[1],i2[1],i3[1],i4[1],i5[1],i6[1],i7[1]},s2,s1,s0,o[1]);
	mux8 mx2({i0[2],i1[2],i2[2],i3[2],i4[2],i5[2],i6[2],i7[2]},s2,s1,s0,o[2]);
	mux8 mx3({i0[3],i1[3],i2[3],i3[3],i4[3],i5[3],i6[3],i7[3]},s2,s1,s0,o[3]);
	mux8 mx4({i0[4],i1[4],i2[4],i3[4],i4[4],i5[4],i6[4],i7[4]},s2,s1,s0,o[4]);
	mux8 mx5({i0[5],i1[5],i2[5],i3[5],i4[5],i5[5],i6[5],i7[5]},s2,s1,s0,o[5]);
	mux8 mx6({i0[6],i1[6],i2[6],i3[6],i4[6],i5[6],i6[6],i7[6]},s2,s1,s0,o[6]);
	mux8 mx7({i0[7],i1[7],i2[7],i3[7],i4[7],i5[7],i6[7],i7[7]},s2,s1,s0,o[7]);
endmodule

module mux2for16(input wire [7:0] din_regular, alu_out, input wire selector, output wire [7:0]din_final);
	mux2 m0(din_regular[0], alu_out[0], selector, din_final[0]);
	mux2 m1(din_regular[1], alu_out[1], selector, din_final[1]);
	mux2 m2(din_regular[2], alu_out[2], selector, din_final[2]);
	mux2 m3(din_regular[3], alu_out[3], selector, din_final[3]);
	mux2 m4(din_regular[4], alu_out[4], selector, din_final[4]);
	mux2 m5(din_regular[5], alu_out[5], selector, din_final[5]);
	mux2 m6(din_regular[6], alu_out[6], selector, din_final[6]);
	mux2 m7(din_regular[7], alu_out[7], selector, din_final[7]);
endmodule

module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [7:0] d_in, output wire [7:0] d_out_a, d_out_b, output wire cout);
	wire [7:0] alu_out;
	wire [7:0] newdin;
	mux2for16 select(d_in, alu_out, sel, newdin);
	reg_file new_reg(clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, newdin, d_out_a, d_out_b);
	alu calc (op, d_out_a, d_out_b, alu_out, cout);
endmodule
