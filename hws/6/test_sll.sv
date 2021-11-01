`timescale 1ns/1ps
`default_nettype none
module test_sll;

parameter N = 32;

int errors = 0;

logic [N-1:0] in;
logic [$clog2(N)-1:0] shamt;
wire  [N-1:0] out;

shift_left_logical #(.N(N)) UUT(.in(in), .shamt(shamt), .out(out));

logic [N-1:0] correct_out;
always_comb begin : behavioural_solution_logic
  correct_out = in << shamt;
end

task print_io;
  $display("%t: %b << %d = %b (%b)",$time, in, shamt, out, correct_out);
endtask

initial begin
  $dumpfile("sll.fst");
  $dumpvars(0, UUT);

  in = -1;
  shamt = 0;
  
  $display("Specific interesting tests.");
  in = -1; // shorthand for setting in to all ones
  
  for(int i = 0; i < 32; i = i + 1) begin
    shamt = i[$clog2(N)-1:0];
    #10 print_io();
  end
  
  $display("Random testing.");
  for (int i = 0; i < 100; i = i + 1) begin : random_testing
    in = $random();
    shamt = $random();
    #10;
  end
  if (errors !== 0) begin
    $display("---------------------------------------------------------------");
    $display("-- FAILURE                                                   --");
    $display("---------------------------------------------------------------");
    $display(" %d failures found, try again!", errors);
  end else begin
    $display("---------------------------------------------------------------");
    $display("-- SUCCESS                                                   --");
    $display("---------------------------------------------------------------");
  end
  $finish;
end

int MAX_ERRORS = 25;
always @(in or shamt) begin
  #1;
  assert(out === correct_out) else begin
    $display("%t: ERROR: sll(%b) should be %b, is %b", $time, in, correct_out, out);
    errors = errors + 1;
  end
  if (errors > MAX_ERRORS) begin
    $display("Quitting early, there are at least %d errors.", MAX_ERRORS);
    $finish;
  end
end

endmodule
