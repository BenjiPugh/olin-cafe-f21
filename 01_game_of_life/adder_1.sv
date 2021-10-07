module adder_1(a, b, c_in, sum, c_out);

  input wire a, b;
  input wire c_in;
  output logic sum;
  output logic c_out;

  logic p,g;
  always_comb begin
    p = a ^ b;
    g = a & b;

    sum = p ^ c_in;
    c_out = g | (p & c_in);
  end

endmodule