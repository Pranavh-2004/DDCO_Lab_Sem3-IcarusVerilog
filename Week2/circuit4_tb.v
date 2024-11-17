module circuit4_tb();
    reg [3:0] in;
    reg y, cin;
    wire so, cout;

    circuit4 circuit_4(in, y, cin, so, cout);

    initial begin
        $dumpfile("circuit4_test.vcd");
        $dumpvars(0, circuit4_tb);
        $monitor($time, " in=%b, y=%b, cin=%b, so=%b, cout=%b", in, y, cin, so, cout);

        in = 3'b000; y = 1'b0; cin = 1'b1; #20;
        in = 3'b001; y = 1'b1; cin = 1'b1; #20; 
        in = 3'b010; y = 1'b0; cin = 1'b0; #20;
        in = 3'b011; y = 1'b1; cin = 1'b0; #20;
        in = 3'b010; y = 1'b0; cin = 1'b1; #20;
        in = 3'b011; y = 1'b1; cin = 1'b0; #20;
        in = 3'b010; y = 1'b1; cin = 1'b0; #20;
    end
endmodule

// // `define TESTVECS 6

// // module tb;
// //     reg [2:0] i1;
// //     wire so, cout;

// //     // Define test vectors: 3-bit input i1
// //     reg [2:0] test_vecs [0:(`TESTVECS-1)];
// //     integer i;

// //     // Dumping for waveform analysis
// //     initial begin
// //         $dumpfile("circuit4_test.vcd");
// //         $dumpvars(0,tb);
// //     end

// //     // Test vectors initialization
// //     initial begin
// //         test_vecs[0] = 3'b000;
// //         test_vecs[1] = 3'b001;
// //         test_vecs[2] = 3'b010;
// //         test_vecs[3] = 3'b011;
// //         test_vecs[4] = 3'b100;
// //         test_vecs[5] = 3'b101;
// //     end

// //     // Initialize i1
// //     initial i1 = 3'b000;

// //     // Instantiate the circuit4 module
// //     circuit4 circuit4_tb(i1, so, cout);

// //     // Apply test vectors
// //     initial begin
// //         for (i = 0; i < `TESTVECS; i = i + 1) begin
// //             #10 i1 = test_vecs[i];
// //         end
// //     end

// //     // Monitor outputs
// //     always @(i1)
// //         $monitor("At time = %t, i1 = %b, so = %b, cout = %b", $time, i1, so, cout);

// // endmodule

// `define TESTVECS 6

// module tb;
//     reg [2:0] i1;
//     wire so, cout;

//     // Define test vectors: 3-bit input i1
//     reg [2:0] test_vecs [0:(`TESTVECS-1)];
//     integer i;

//     // Dumping for waveform analysis
//     initial begin
//         $dumpfile("circuit4_test.vcd");
//         $dumpvars(0, tb);
//     end

//     // Test vectors initialization
//     initial begin
//         test_vecs[0] = 3'b000;
//         test_vecs[1] = 3'b001;
//         test_vecs[2] = 3'b010;
//         test_vecs[3] = 3'b011;
//         test_vecs[4] = 3'b100;
//         test_vecs[5] = 3'b101;
//     end

//     // Instantiate the circuit4 module
//     circuit4 uut (
//         .i(i1), 
//         .so(so), 
//         .cout(cout)
//     );

//     // Apply test vectors
//     initial begin
//         for (i = 0; i < `TESTVECS; i = i + 1) begin
//             #10 i1 = test_vecs[i];
//         end
//     end

//     // Monitor outputs
//     always @(i1 or so or cout)
//         $monitor("At time = %t, i1 = %b, so = %b, cout = %b", $time, i1, so, cout);

// endmodule