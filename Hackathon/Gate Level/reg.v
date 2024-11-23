// 8-bit D Flip-Flop with Reset and Load Enable
module dfrl_8(input wire clk, reset, load, input wire [7:0] d, output wire [7:0] q);
    dfrl dfrl_0(clk, reset, load, d[0], q[0]);
    dfrl dfrl_1(clk, reset, load, d[1], q[1]);
    dfrl dfrl_2(clk, reset, load, d[2], q[2]);
    dfrl dfrl_3(clk, reset, load, d[3], q[3]);
    dfrl dfrl_4(clk, reset, load, d[4], q[4]);
    dfrl dfrl_5(clk, reset, load, d[5], q[5]);
    dfrl dfrl_6(clk, reset, load, d[6], q[6]);
    dfrl dfrl_7(clk, reset, load, d[7], q[7]);
endmodule

// 8-to-1 8-bit Multiplexer
module mux8_8(input wire [7:0] i0, i1, i2, i3, i4, i5, i6, i7, input wire [2:0] j, output wire [7:0] o);
    mux8 mux0(i0[0], i1[0], i2[0], i3[0], i4[0], i5[0], i6[0], i7[0], j, o[0]);
    mux8 mux1(i0[1], i1[1], i2[1], i3[1], i4[1], i5[1], i6[1], i7[1], j, o[1]);
    mux8 mux2(i0[2], i1[2], i2[2], i3[2], i4[2], i5[2], i6[2], i7[2], j, o[2]);
    mux8 mux3(i0[3], i1[3], i2[3], i3[3], i4[3], i5[3], i6[3], i7[3], j, o[3]);
    mux8 mux4(i0[4], i1[4], i2[4], i3[4], i4[4], i5[4], i6[4], i7[4], j, o[4]);
    mux8 mux5(i0[5], i1[5], i2[5], i3[5], i4[5], i6[5], i7[5], j, o[5]);
    mux8 mux6(i0[6], i1[6], i2[6], i3[6], i4[6], i5[6], i6[6], i7[6], j, o[6]);
    mux8 mux7(i0[7], i1[7], i2[7], i3[7], i4[7], i5[7], i6[7], i7[7], j, o[7]);
endmodule

// Register File with 8 registers of 8 bits each
module reg_file(input wire clk, reset, load, input wire [7:0] d, input wire [2:0] sel, output wire [7:0] q);
    wire [7:0] q0, q1, q2, q3, q4, q5, q6, q7;
    wire [7:0] load_decoded;
    
    // Decode the load signal to select the register
    decoder3_to_8 dec(load, sel, load_decoded);

    // 8 Registers
    dfrl_8 reg0(clk, reset, load_decoded[0], d, q0);
    dfrl_8 reg1(clk, reset, load_decoded[1], d, q1);
    dfrl_8 reg2(clk, reset, load_decoded[2], d, q2);
    dfrl_8 reg3(clk, reset, load_decoded[3], d, q3);
    dfrl_8 reg4(clk, reset, load_decoded[4], d, q4);
    dfrl_8 reg5(clk, reset, load_decoded[5], d, q5);
    dfrl_8 reg6(clk, reset, load_decoded[6], d, q6);
    dfrl_8 reg7(clk, reset, load_decoded[7], d, q7);

    // Multiplex the outputs
    mux8_8 mux(q0, q1, q2, q3, q4, q5, q6, q7, sel, q);
endmodule