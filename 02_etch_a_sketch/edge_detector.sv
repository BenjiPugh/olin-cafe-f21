module edge_detector(rst, ena, clk, signal, edge_detected);

input wire rst, ena, clk, signal;
output logic edge_detected;

logic prev_state;

always_ff @(posedge clk) begin : prev_state_ff
    if (rst) prev_state <= 0;
    else prev_state <= signal;
end

always_comb begin : edge_detecting
    edge_detected = ena & (signal & ~prev_state);
end

endmodule