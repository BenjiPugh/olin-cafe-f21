module add32(a, b, c_in, sum, c_out);

input wire [31:0] a, b;
input wire c_in;
output logic [31:0] sum;
output logic c_out;

adder_n #(.N(32)) adder_32(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));

endmodule