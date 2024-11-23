`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
  reg clk, reset, wr, sel;
  reg [1:0] op;
  reg [2:0] rd_addr_a, rd_addr_b, wr_addr;
  reg [7:0] d_in;
  wire [7:0] d_out_a, d_out_b;
  wire cout;

  // Test vectors: {sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in}
  reg [20:0] test_vecs [0:(`TESTVECS-1)];
  integer i;

  initial begin
    $dumpfile("tb_reg_alu.vcd");
    $dumpvars(0, tb);
  end

  initial begin
    reset = 1'b1;
    #12.5 reset = 1'b0;
  end

  initial clk = 1'b0;
  always #5 clk = ~clk;

  initial begin
  $monitor("At time %t: sel = %b, wr = %b, op = %b, rd_addr_a = %d, rd_addr_b = %d, wr_addr = %d, d_in = %d, d_out_a = %d, d_out_b = %d, cout = %d", 
           $time, sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in, d_out_a, d_out_b, cout);
end

  initial begin
    // Test vector initialization
    test_vecs[0] = 21'b0_1_00_000_000_011_11001101;
    test_vecs[1] = 21'b0_1_00_001_001_101_11100010;
    test_vecs[2] = 21'b0_1_00_011_101_110_01010101;
    test_vecs[3] = 21'b0_1_00_010_110_100_10101111;
    test_vecs[4] = 21'b0_0_00_011_101_010_00000000; // No write
    test_vecs[5] = 21'b1_1_01_100_110_111_11111111; // ALU write
    test_vecs[6] = 21'b1_1_10_111_101_000_10101010; // ALU read
    test_vecs[7] = 21'b1_0_11_001_010_011_00000000; // ALU operation

    {sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in} = 0;

    // Apply test vectors
    #6;
    for (i = 0; i < `TESTVECS; i = i + 1) begin
      #10 {sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in} = test_vecs[i];
    end
    #100 $finish;
  end

  // Instantiate the reg_alu module
  reg_alu uut (
    .clk(clk),
    .reset(reset),
    .sel(sel),
    .wr(wr),
    .op(op),
    .rd_addr_a(rd_addr_a),
    .rd_addr_b(rd_addr_b),
    .wr_addr(wr_addr),
    .d_in(d_in),
    .d_out_a(d_out_a),
    .d_out_b(d_out_b),
    .cout(cout)
  );
endmodule