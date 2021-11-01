/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;

logic [N-1:0] count;
logic counter_comparator;

logic reached_count;

logic rst_counter;



always_comb begin 
  reached_count = (count >= ticks);
  rst_counter = rst | reached_count;
end

counter #(.N(N)) counter(.clk(clk), .rst(rst_counter), .ena(ena), .out(count));

always_comb out = ena & reached_count;



endmodule
