module shift_left_logical(in, shamt, out);

// Done with elvis and melissa

parameter N = 32; // only used as a constant! Don't feel like you need to a shifter for arbitrary N.

input wire [N-1:0] in;            // the input number that will be shifted left. Fill in the remainder with zeros.
input wire [$clog2(N)-1:0] shamt; // the amount to shift by (think of it as a decimal number from 0 to 31). 
output logic [N-1:0] out;
logic [N**2-1:0] Y_in; 

genvar num_input;
generate
    for (num_input= 0; num_input < N; num_input++) begin: buildAllMuxInputs
        always_comb begin : buildMuxInput
            // build one n-length input for each possible left shift
            Y_in [31+(num_input*32):num_input*32] = {in[N-num_input-1:0], {num_input{1'b0}}};
        end
    end
endgenerate

// use n-bit mux with generated inputs to create sll shift
muxN #(.N(32), .W(32)) shift_left_mux(.s(shamt), .d(Y_in), .y(out));

endmodule