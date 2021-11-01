module subtractor(a, b, diff, c_out);
// Performs the operation a - b, although edge cases will need more thought (how to deal with overflows?)

parameter N = 32;
input wire [N-1:0] a, b;
output logic [N-1:0] diff;
output logic c_out;

logic [N-1:0] inv_b;
always_comb inv_b = ~b;
logic [N-1:0] neg_b;

adder_n #(.N(N)) add_1(.a(inv_b), .b(1'b1), .c_in(1'b0), .sum(neg_b));

adder_n #(.N(N)) subtract(.a(a), .b(neg_b), .c_in(1'b0), .sum(diff), .c_out(c_out));

endmodule