`timescale 1ns/1ps
`default_nettype none

`define SIMULATION

module test_mux32;

logic [4:0] s;
logic [32*32-1:0] a;

wire [31:0] out;

mux32 UUT(.s(s), .a(a), .out(out));

int errors = 0;

//correct value to check against
logic [31:0] correct_value;


generate
    genvar i;
    for (i=0; i < 32; i++) begin : modify_a
        assign a[(i+1)*32 - 1: i*32] =  i;
    end
endgenerate

initial begin
    $display("a is %b", a);
    for(int i=0; i<32; i++) begin
        s = i;
        correct_value = i;
        $display("%b", out);
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

end


always @(s) begin
  assert(out === correct_value) else begin
    $display("  ERROR: value selected should be %b, is %b", correct_value, out);
    errors = errors + 1;
  end
end

endmodule