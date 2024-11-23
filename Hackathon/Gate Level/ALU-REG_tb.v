`timescale 1ns / 1ps

module tb_reg_alu;
    reg clk, reset, write_enable;
    reg [2:0] write_address, read_address1, read_address2; // Adjusted to 3 bits
    reg [7:0] write_data;
    reg [2:0] alu_op;
    wire [7:0] alu_result;
    wire zero;

    // Internal wires to connect reg_file to ALU
    wire [7:0] reg_out1, reg_out2;

    // Instantiate the reg_file
    reg_file reg_inst (
        .clk(clk),
        .reset(reset),
        .load(write_enable),
        .d(write_data),
        .sel_w(write_address),
        .sel_r1(read_address1),
        .sel_r2(read_address2),
        .q1(reg_out1),
        .q2(reg_out2)
    );

    // Instantiate the ALU
    alu alu_inst (
        .a(reg_out1),
        .b(reg_out2),
        .op(alu_op),
        .result(alu_result),
        .zero(zero)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor to track signals during simulation
    initial begin
        $monitor("Time = %0t | reset = %b | write_enable = %b | write_addr = %b | read_addr1 = %b | read_addr2 = %b | write_data = %b | alu_op = %b | reg_out1 = %b | reg_out2 = %b | alu_result = %b | zero = %b",
                 $time, reset, write_enable, write_address, read_address1, read_address2, write_data, alu_op, reg_out1, reg_out2, alu_result, zero);
    end

    // VCD dumpfile for waveform analysis
    initial begin
        $dumpfile("tb_reg_alu.vcd"); // Generates a dump file for GTKWave
        $dumpvars(0, tb_reg_alu);    // Dumps all variables in the testbench
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1; write_enable = 0; write_address = 0;
        read_address1 = 0; read_address2 = 0; write_data = 0; alu_op = 0;
        #10 reset = 0;

        // Write data into registers
        write_enable = 1;
        write_address = 3'b000; write_data = 8'b00001111; #10;
        write_address = 3'b001; write_data = 8'b00000011; #10;

        // Read data and perform ALU operation
        write_enable = 0;
        read_address1 = 3'b000;
        read_address2 = 3'b001;

        alu_op = 3'b000; // Add
        #10;

        alu_op = 3'b001; // Subtract
        #10;

        alu_op = 3'b010; // AND
        #10;

        alu_op = 3'b011; // OR
        #10;

        alu_op = 3'b100; // XOR
        #10;

        alu_op = 3'b101; // NOT (applied only to `a`)
        #10;

        alu_op = 3'b110; // Shift Left
        #10;

        alu_op = 3'b111; // Shift Right
        #10;

        // End simulation
        $finish;
    end
endmodule