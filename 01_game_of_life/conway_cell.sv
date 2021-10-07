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

  always_comb begin

    
  end

  always_comb begin

	  state_d = (~living_neighbors[3] & ~living_neighbors[2] & living_neighbors[1]) & 
		    ((state_0 & ~living_neighbors[0]) | living_neighbors[0]);

  end

  always_ff @(posedge clk) begin

	  state_q <= state_d;

  end


endmodule