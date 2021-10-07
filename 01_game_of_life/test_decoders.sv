`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_decoders;
  logic ena;
  logic [2:0] in;
  wire [7:0] out;

  logic [1:0] in_2_4;
  logic [3:0] out_2_4;

  decoder_3_to_8 UUT(ena, in, out);

  decoder_2_to_4 UUT_2_4(ena, in_2_4, out_2_4);

  initial begin
    // Collect waveforms
    $dumpfile("decoders.vcd");
    $dumpvars(0, UUT);
    $dumpvars(0, UUT_2_4);
    
    ena = 1;
    $display("ena in | out");
    for (int i = 0; i < 8; i = i + 1) begin
      in = i[2:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end

    ena = 0;
    
    for (int i = 0; i < 8; i = i + 1) begin
      in = i[2:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end

  ena = 1;
    $display("ena in | out");
    for (int i = 0; i < 4; i = i + 1) begin
      in_2_4 = i[1:0];
      #1 $display("%1b %2b | %4b", ena, in_2_4, out_2_4);
    end

    ena = 0;
    for (int i = 0; i < 4; i = i + 1) begin
      in_2_4 = i[1:0];
      #1 $display("%1b %2b | %4b", ena, in_2_4, out_2_4);
    end




    $finish;      
	end

endmodule