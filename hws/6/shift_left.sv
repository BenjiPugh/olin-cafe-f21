module shift_left(ena, in, out, carry);
// Shifts left by one (in << 1), to be used in a ripple carry SLL


parameter N = 32;

input wire ena;
input wire [N-1:0] in;
output logic [N-1:0] carry;
output logic [N-1:0] out;

always_comb begin : wire_shift

    carry[N-1:1] = in[N-2:0];
    carry[0] = 1'b0;

    if (ena) begin
        out = carry;
    end else begin
        out = 32'bzzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz;
    end
    
end


endmodule