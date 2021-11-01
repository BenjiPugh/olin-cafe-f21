module counter(clk, rst, ena, out);

parameter N = 8;

input wire clk, rst, ena;
output logic [N-1:0] out;

logic [N-1:0] next_count;

register #(.N(N)) reg_N(.clk(clk), .ena(ena), .rst(rst), .d(next_count), .q(out));

always_comb next_count = out + 1;

endmodule