module light_sequencer(clk, buttons, rgb);
input wire clk;
input wire [1:0] buttons;
output logic [2:0] rgb;

logic rst;
always_comb rst = buttons[0];
logic debounced;

debouncer debounce(.clk(clk), .rst(rst), .bouncy_in(buttons[1]), .debounced_out(debounced));
logic edge_detected;
edge_detector detector(.rst(rst), .ena(1'b1), .clk(clk), .signal(debounced), .edge_detected(edge_detected));

rgb_behavior fsm(.rst(rst), .ena(1'b1), .button_press(edge_detected), .rgb(rgb));

endmodule