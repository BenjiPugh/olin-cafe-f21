module debouncer(clk, rst, bouncy_in, debounced_out);

parameter BOUNCE_TICKS = 10;

input wire clk, rst, bouncy_in;
output logic debounced_out;


typedef enum logic [1:0] {S_0, S_MAYBE_1, S_1, S_MAYBE_0} state_t;
state_t state;

logic [$clog2(BOUNCE_TICKS)-1:0] count;
logic done_count;

always_comb begin : output_logic
    case (state)
        S_0, S_MAYBE_1 : begin
            debounced_out = 0;
        end
        S_1, S_MAYBE_0 : begin
            debounced_out = 1;
        end
        default: debounced_out = 1'bx;
    endcase
end

always_ff @(posedge clk) begin: debouncer_fsm
    if (rst) begin
        state <= S_0;
        count <= 0;
    end
    else begin
        case (state)
            S_0: begin
                if (bouncy_in) begin
                    count <= 0;
                    state <= S_MAYBE_1;
                end
            end
            S_MAYBE_1, S_MAYBE_0 : begin
                count <= count + 1;
                if (count == BOUNCE_TICKS - 1) begin
                    state <= bouncy_in?S_1:S_0;
                end
            end
            S_1: begin
                if (~bouncy_in) begin
                    count <= 0;
                    state <= S_MAYBE_0;
                end
            end
            default : state <= S_0;
        endcase
    end
end

endmodule