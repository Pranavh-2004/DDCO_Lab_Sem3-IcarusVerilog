module alu_slice (
    input wire [2:0] op, 
    input wire i0, 
    input wire i1, 
    input wire cin, 
    output wire o, 
    output wire cout
);
   wire t_sumdiff, t_and, t_or, t_xor, t_not, t_nand, t_nor, t_xnor, t_andor;
   wire t_shift_left, t_shift_right, t_shift;
   
   // Add/Subtract operation
   addsub addsub_0 (op[0], i0, i1, cin, t_sumdiff, cout);
   
   // Logic operations
   and2 and2_0 (i0, i1, t_and);
   or2 or2_0 (i0, i1, t_or);
   xor2 xor2_0 (i0, i1, t_xor);
   invert not_0 (i0, t_not);
   nand2 nand2_0 (i0, i1, t_nand);
   nor2 nor2_0 (i0, i1, t_nor);
   xnor2 xnor2_0 (i0, i1, t_xnor);

   // Shift operations
   assign t_shift_left = i0 << 1;  // Logical left shift
   assign t_shift_right = i0 >> 1; // Logical right shift
   mux2 mux_shift (t_shift_left, t_shift_right, op[0], t_shift);

   // Operation selection
   mux2 mux_andor (t_and, t_or, op[0], t_andor);
   mux4 result_mux (
       {t_xnor, t_xor, t_andor, t_sumdiff},
       op[1], op[2], o
   );
endmodule

module alu (
    input wire [7:0] a, b,
    input wire [2:0] alu_op,
    output wire [7:0] result,
    output wire zero
);
    wire [7:0] carry; // Carry for cascaded ALU slices

    // ALU slice instantiation
    alu_slice alu_slice_0 (alu_op, a[0], b[0], alu_op[0], result[0], carry[0]);
    alu_slice alu_slice_1 (alu_op, a[1], b[1], carry[0], result[1], carry[1]);
    alu_slice alu_slice_2 (alu_op, a[2], b[2], carry[1], result[2], carry[2]);
    alu_slice alu_slice_3 (alu_op, a[3], b[3], carry[2], result[3], carry[3]);
    alu_slice alu_slice_4 (alu_op, a[4], b[4], carry[3], result[4], carry[4]);
    alu_slice alu_slice_5 (alu_op, a[5], b[5], carry[4], result[5], carry[5]);
    alu_slice alu_slice_6 (alu_op, a[6], b[6], carry[5], result[6], carry[6]);
    alu_slice alu_slice_7 (alu_op, a[7], b[7], carry[6], result[7], carry[7]);

    // Zero flag calculation
    assign zero = (result == 8'b0);
endmodule