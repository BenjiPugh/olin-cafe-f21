module decoder_3_to_8(ena, in, out);

  input wire ena;
  input wire [2:0] in;
  output logic [7:0] out;

  output logic [1:0] out_en;

  decoder_1_to_2 deco_en(ena, in[2], out_en);

  decoder_2_to_4 deco_1(out_en[1], in[1:0], out[7:4]);

  decoder_2_to_4 deco_2(out_en[0], in[1:0], out[3:0]);

endmodule