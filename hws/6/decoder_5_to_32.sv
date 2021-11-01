module decoder_5_to_32(ena, in, out);

  input wire ena;
  input wire [4:0] in;
  output logic [31:0] out;

  logic [1:0] out_en;

  decoder_1_to_2 deco_en(ena, in[4], out_en);

  decoder_4_to_16 deco_1(out_en[1], in[3:0], out[31:16]);

  decoder_4_to_16 deco_2(out_en[0], in[3:0], out[15:0]);

endmodule