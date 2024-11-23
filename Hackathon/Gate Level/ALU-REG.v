module reg_alu (
    input wire clk, reset, write_enable,
    input wire [2:0] write_address, read_address1, read_address2, // Adjusted to 3 bits
    input wire [7:0] write_data,
    input wire [2:0] alu_op,
    output wire [7:0] alu_result,
    output wire zero
);
    wire [7:0] reg_data1, reg_data2;

    // Register File instance
    reg_file reg_file_inst (
        .clk(clk),
        .reset(reset),
        .load(write_enable),       // Updated signal name for write enable
        .d(write_data),            // Updated to match reg_file input
        .sel_w(write_address),     // Write address signal
        .sel_r1(read_address1),    // Read address 1 signal
        .sel_r2(read_address2),    // Read address 2 signal
        .q1(reg_data1),            // Data output 1
        .q2(reg_data2)             // Data output 2
    );

    // ALU instance
    alu alu_inst (
        .a(reg_data1),
        .b(reg_data2),
        .op(alu_op),               // Updated signal name for ALU operation
        .result(alu_result),
        .zero(zero)
    );
endmodule