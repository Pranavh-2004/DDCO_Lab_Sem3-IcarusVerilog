module not1_test;
  reg a;
  wire c;

  // Instantiate the not1 module (assuming you have a module named not1)
  not1 not1_test(c, a);

  initial begin
    // Initialize and change the values of a
    a = 0; #100; 
    a = 1; #100;
  end

  initial begin
    // Monitor the values of a and c
    $monitor($time, " a=%b, c=%b", a, c);
  end

  initial begin
    // Dump the waveform data to a VCD file
    $dumpfile("not1_test.vcd");
    $dumpvars(0, not1_test);
  end
endmodule