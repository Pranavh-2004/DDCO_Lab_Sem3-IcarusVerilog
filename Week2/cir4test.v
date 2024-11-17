/*
// Module 1: mod1 (Full Adder Logic)
module mod1(s0, c0, i);
    input [2:0] i;
    output s0, c0;
    wire t1, t2, t3;

    xor2 x1(t1, i[0], i[1]);
    xor2 x2(s0, t1, i[2]);

    and2 a1(t2, i[0], i[1]);
    and2 a2(t3, t1, i[2]);
    or2 o1(c0, t2, t3);
endmodule

// Module 2: mod2 (AND logic with inverter)
module mod2(out, s0, c0, y);
    input s0, c0, y;
    output out;
    wire w1;

    invert n1(w1, y);  // Inverter
    and3 a3(out, w1, s0, c0);  // 3-input AND gate
endmodule

// Module 3: mod3 (Half Adder)
module mod3(s, c, y1, y2);
    input y1, y2;
    output s, c;

    xor2 G1(s, y1, y2);  // XOR gate for sum
    and2 G2(c, y1, y2);  // AND gate for carry
endmodule

// Top-level Module: circuit4
module circuit4(cout, s0, i, y, y0);
    input [2:0] i;
    input y, y0;
    output cout, s0;
    wire s, c, yout;

    // Instantiate mod1, mod2, and mod3
    mod1 M1(.s0(s), .c0(c), .i(i));        // Instance of mod1
    mod2 M2(.out(yout), .s0(s), .c0(c), .y(y));  // Instance of mod2
    mod3 M3(.s(s0), .c(cout), .y1(y0), .y2(yout));  // Instance of mod3
endmodule

`define TESTVECS 6

module tb;
    reg [2:0] i1;
    reg y, y0;
    wire s0, cout;

    reg [2:0] test_vecs[0:(`TESTVECS-1)];
    integer i;

    // Dump waveforms
    initial begin
        $dumpfile("circuit_4.vcd");
        $dumpvars(0, tb);
    end

    // Initialize test vectors
    initial begin
        test_vecs[0] = 3'b000;
        test_vecs[1] = 3'b001;
        test_vecs[2] = 3'b010;
        test_vecs[3] = 3'b011;
        test_vecs[4] = 3'b100;
        test_vecs[5] = 3'b101;
    end

    // Initialize inputs
    initial begin
        i1 = 3'b000;
        y = 1'b0;    
        y0 = 1'b0;   
    end

    // Instantiate the circuit4 module
    circuit4 circuit4_0(cout, s0, i1, y, y0);

    // Apply test vectors
    initial begin
        for (i = 0; i < `TESTVECS; i = i + 1) begin
            #10 i1 = test_vecs[i]; 
            y = 1'b1;    // Assign some values to y
            y0 = 1'b0;   // Assign some values to y0
            #10 y = 1'b0;
            y0 = 1'b1;
        end
    end

    // Monitor outputs
    always @(i1 or y or y0) begin
        $monitor("At time %t, i1 = %b, y = %b, y0 = %b, s0 = %b, cout = %b", $time, i1, y, y0, s0, cout);
    end
endmodule
*/

// Predefined modules
module invert (input wire i, output wire o);
   assign o = ~i;
endmodule

module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module or2 (input wire i0, i1, output wire o);
  assign o = i0 | i1;
endmodule

module xor2 (input wire i0, i1, output wire o);
  assign o = i0 ^ i1;
endmodule

module and3 (input wire i0, i1, i2, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   and2 and2_1 (i2, t, o);
endmodule

module or3 (input wire i0, i1, i2, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   or2 or2_1 (i2, t, o);
endmodule

module xor3 (input wire i0, i1, i2, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   xor2 xor2_1 (i2, t, o);
endmodule

// Full Adder module (using xor3 and or3)
module fa (input wire i0, i1, cin, output wire sum, cout);
   wire t0, t1, t2;
   xor3 _i0 (i0, i1, cin, sum);
   and2 _i1 (i0, i1, t0);
   and2 _i2 (i1, cin, t1);
   and2 _i3 (cin, i0, t2);
   or3 _i4 (t0, t1, t2, cout);
endmodule

// Custom modules
module mod1 (input wire [2:0] i, output wire s0, c0);
    wire t1, t2, t3;

    xor2 x1(t1, i[0], i[1]);
    xor2 x2(s0, t1, i[2]);

    and2 a1(t2, i[0], i[1]);
    and2 a2(t3, t1, i[2]);
    or2 o1(c0, t2, t3);
endmodule

module mod2 (input wire s0, c0, y, output wire out);
    wire w1;

    invert n1(w1, y);
    and3 a3(out, w1, s0, c0);
endmodule

module mod3 (input wire y1, y2, output wire s, c);
    xor2 G1(s, y1, y2);
    and2 G2(c, y1, y2);
endmodule

// Main circuit module
module circuit4 (input wire [2:0] i, input wire [2:0] y, input wire [2:0] y0, output wire cout, s0);
    wire s, c, yout;

    // Instantiate submodules
    mod1 M1 (.i(i), .s0(s), .c0(c));
    mod2 M2 (.s0(s), .c0(c), .y(y[0]), .out(yout));  // y[0] is passed to mod2
    mod3 M3 (.y1(y0[0]), .y2(yout), .s(s0), .c(cout));  // y0[0] is passed to mod3
endmodule

// Testbench
`define TESTVECS 6
module tb;
    reg [2:0] i1;
    reg [2:0] y, y0;
    wire s0, cout;

    reg [2:0] test_vecs[0:(`TESTVECS-1)];
    integer i, j;

    // VCD dump for waveform viewing
    initial begin
        $dumpfile("circuit_4.vcd");
        $dumpvars(0, tb);
    end

    // Test vectors initialization
    initial begin
        test_vecs[0] = 3'b000;
        test_vecs[1] = 3'b001;
        test_vecs[2] = 3'b010;
        test_vecs[3] = 3'b011;
        test_vecs[4] = 3'b100;
        test_vecs[5] = 3'b101;
    end

    // Initial input values
    initial begin
        i1 = 3'b000;
        y = 3'b000;    
        y0 = 3'b000;   
    end

    // Instantiate the circuit4 module
    circuit4 circuit4_0 (.i(i1), .y(y), .y0(y0), .cout(cout), .s0(s0));

    // Test loop
    initial begin
        for (i = 0; i < `TESTVECS; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                #10 i1 = test_vecs[i]; 
                y = {2'b0, j[1]};   // y[0] is varied
                y0 = {2'b0, j[0]};  // y0[0] is varied
            end
        end
    end

    // Monitor the signals
    always @(i1 or y or y0) begin
        $monitor("At time %t, i1 = %b, y = %b, y0 = %b, s0 = %b, cout = %b", $time, i1, y, y0, s0, cout);
    end
endmodule