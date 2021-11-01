module decoder_2_to_4(ena, in, out);

  input wire ena;
  input wire [1:0] in;
  output logic [3:0] out;
  
  logic [1:0] out_en;

  decoder_1_to_2 deco_en(ena, in[1], out_en);

  decoder_1_to_2 deco_1(out_en[1], in[0], out[3:2]);

  decoder_1_to_2 deco_0(out_en[0], in[0], out[1:0]);

endmodule