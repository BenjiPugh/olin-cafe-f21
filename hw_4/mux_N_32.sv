module mux_N_32(s, a, out);
// 32 bit wide n:1 mux, where n is a power of 2
// Uses recursion to generate smaller and smaller sub muxes to form a binary tree

parameter N =  2;
input wire [$clog2(N)-1:0] s; //Mux selector
input wire [N*32-1:0] a; //The 32 bit wide, Nth order mux inputs

output logic[31:0] out; // 32 bit wide output 

generate
    if (N > 2) begin
        logic which_mux;
        always_comb which_mux = s[$clog2(N)-1]; // Outermost mux uses MSB

        logic [31:0] mux1_out, mux0_out;


        // Create two N/2:1 muxes
        mux_N_32 #(.N(N/2)) mux1 (.s(s[$clog2(N)-2:0]), .a(a[N*32-1:N*16]), .out(mux1_out));
        mux_N_32 #(.N(N/2)) mux0 (.s(s[$clog2(N)-2:0]), .a(a[N*16-1:0]), .out(mux0_out));

        // Select which sub mux output to use
        always_comb out = which_mux?mux1_out:mux0_out;
    end
    else begin
        always_comb out = s?a[63:32]:a[31:0];
    end

endgenerate


endmodule