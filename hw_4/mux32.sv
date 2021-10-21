module mux32(s, a, out);
input wire [4:0] s;
input wire [32*32 - 1: 0] a;

output logic [31:0] out;

mux_N_32 #(.N(32)) mux_32(.s(s), .a(a), .out(out));

endmodule