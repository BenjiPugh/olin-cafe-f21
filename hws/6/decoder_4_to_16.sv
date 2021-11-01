module decoder_4_to_16(ena, in, out);

  input wire ena;
  input wire [3:0] in;
  output logic [15:0] out;

  logic [1:0] out_en;

  decoder_1_to_2 deco_en(ena, in[3], out_en);

  decoder_3_to_8 deco_1(out_en[1], in[2:0], out[15:8]);

  decoder_3_to_8 deco_2(out_en[0], in[2:0], out[7:0]);

endmodule