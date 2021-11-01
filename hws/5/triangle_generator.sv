// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N-1:0] out;

typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
state_t state;
state_t next_state;

logic [N-1:0] count;
logic [N-1:0] next_count;

always_comb begin
case (state)
    COUNTING_UP: begin
        if (count >= ($pow(2,N) - 1)) begin
            next_state = COUNTING_DOWN;
            next_count = count - 1'b1;
        end
        else begin
            next_state = COUNTING_UP;
            next_count = count + 1'b1;
        end
    end

    COUNTING_DOWN: begin
        if (count == 0) begin
            next_state = COUNTING_UP;
            next_count = count + 1'b1;
        end
        else begin
            next_state = COUNTING_DOWN;
            next_count = count - 1'b1;
        end
    end
endcase
end

always_ff @(posedge clk) begin
    state <= rst?COUNTING_UP:(ena?next_state:state);
    count <= rst?1'b0:(ena?next_count:count);
end

always_comb out = count;

endmodule