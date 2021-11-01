module rgb_behavior(rst, ena, button_press, rgb);
input wire rst, ena, button_press;
output logic [2:1] rgb;

typedef enum [1:0] {RED, GREEN, BLUE} state_t;

state_t led_state;

always_ff @(posedge button_press) begin: led_state_ff
    if (rst) led_state <= RED;
    case (led_state)
        RED: if (button) led_state <= GREEN;
        GREEN: if (button) led_state <= BLUE;
        BLUE: if (button) led_state <= RED;
    endcase
end

always_comb begin : select_rgb;
    if (~ena) rgb = 3'b000;
    else begin
        case (led_state)
            RED: rgb = 3'b100;
            GREEN: rgb = 3'b010;
            BLUE: rgb = 3'b001;
        endcase
    end
end

endmodule