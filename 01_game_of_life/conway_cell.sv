`default_nettype none

module conway_cell(clk, rst, ena, state_0, state_d, state_q, neighbors);
  input wire clk;
  input wire rst;
  input wire ena;

  input wire state_0;
  output logic state_d;
  output logic state_q;

  input wire [7:0] neighbors;
  logic [3:0] living_neighbors;

<<<<<<< HEAD
  logic [7:0] one_bit_sums;

  adder_1 adder_1_1 (.a(neighbors[0]), .b(neighbors[1]), .c_in(1'b0), .sum(one_bit_sums[0]), .c_out(one_bit_sums[1]));
  adder_1 adder_1_2 (.a(neighbors[2]), .b(neighbors[3]), .c_in(1'b0), .sum(one_bit_sums[2]), .c_out(one_bit_sums[3]));
  adder_1 adder_1_3 (.a(neighbors[4]), .b(neighbors[5]), .c_in(1'b0), .sum(one_bit_sums[4]), .c_out(one_bit_sums[5]));
  adder_1 adder_1_4 (.a(neighbors[6]), .b(neighbors[7]), .c_in(1'b0), .sum(one_bit_sums[6]), .c_out(one_bit_sums[7]));

  logic [5:0] two_bit_sums;

  adder_n #(.N(2)) adder_2_1 (.a(one_bit_sums[1:0]), .b(one_bit_sums[3:2]), .c_in(1'b0), .sum(two_bit_sums[1:0]), .c_out(two_bit_sums[2]));
  adder_n #(.N(2)) adder_2_2 (.a(one_bit_sums[5:4]), .b(one_bit_sums[7:6]), .c_in(1'b0), .sum(two_bit_sums[4:3]), .c_out(two_bit_sums[5]));

  adder_n #(.N(3)) adder_3 (.a(two_bit_sums[2:0]), .b(two_bit_sums[5:3]), .c_in(1'b0), .sum(living_neighbors[2:0]), .c_out(living_neighbors[3]));

  logic is_3;
  logic continue_alive;

  always_comb begin
    is_3 = ~living_neighbors[3] & ~living_neighbors[2] & living_neighbors[1] & living_neighbors[0];
    continue_alive = state_q & ~living_neighbors[3] & ~living_neighbors[2] & living_neighbors[1] & ~living_neighbors[0];
    state_d = is_3 | continue_alive;
  end

  logic enabled_output;
  logic reset_output;

  always_comb begin
    enabled_output = (ena)?state_d:state_q;
    reset_output = (rst)?state_0:enabled_output;
  end

  always_ff @(posedge clk) begin
	  state_q <=  reset_output;
  end
=======
  // combinational logic that says if the cell lives or dies 
  // (drives the d input to the flip flop)
  always_comb begin
    if(living_neighbors > 3) state_d = 0;
    else state_d = 1'bx;
  end

  // create a flip flop with rst and enable
  always_ff @(posedge clk) begin : cell_flip_flop
    // state_q <= d_value.
    // <= "becomes"
    if(rst) begin // create a mux
      state_q <= state_0;
    end
    else if (ena) begin
      state_q <= state_d;
    end
    else begin // This is not required
      state_q <= state_q; // hold current value
    end
  end

>>>>>>> cf8a7388295df9a252155ecbcb365f46ade475a2


endmodule