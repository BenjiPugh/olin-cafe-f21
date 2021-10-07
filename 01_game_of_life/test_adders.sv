`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_adders;
  logic a,b;
  logic c_in;
  logic sum;
  logic c_out;


  logic [2:0] a_3, b_3;
  logic c_in_3;
  logic [2:0] sum_3;
  logic c_out_3;

  adder_1 UUT_1(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
  adder_n #(.N(3)) UUT_3 (.a(a_3), .b(b_3), .c_in(c_in_3), .sum(sum_3), .c_out(c_out_3));

  initial begin
    // Collect waveforms
    $dumpfile("adders.vcd");
    $dumpvars(0, UUT_1);
    $dumpvars(0, UUT_3);
    
    c_in = 0;
    $display("1 bit adder");
    $display("c_in a b | sum c_out");
    for (int i = 0; i < 2; i = i + 1) begin
        a = i;
        for (int j = 0; j < 2; j = j + 1) begin
            b = j;
            #1 $display("%1b %1b %1b | %1b %1b", c_in, a, b, sum, c_out);
        end
    end

    c_in = 1;
    
    for (int i = 0; i < 2; i = i + 1) begin
        a = i;
        for (int j = 0; j < 2; j = j + 1) begin
            b = j;
            #1 $display("%1b %1b %1b | %1b %1b", c_in, a, b, sum, c_out);
        end
    end

    c_in_3 = 0;
    $display("3 bit adder");
    $display("c_in a b | sum c_out");

    for (int i = 0; i < 8; i = i + 1) begin
        a_3 = i[2:0];
        for (int j = 0; j < 8; j = j + 1) begin
            b_3 = j[2:0];
            #1 $display("%1b %3b %3b | %3b %1b", c_in_3, a_3, b_3, sum_3, c_out_3);
        end
    end

    c_in_3 = 1;
    for (int i = 0; i < 8; i = i + 1) begin
        a_3 = i[2:0];
        for (int j = 0; j < 8; j = j + 1) begin
            b_3 = j[2:0];
            #1 $display("%1b %3b %3b | %3b %1b", c_in_3, a_3, b_3, sum_3, c_out_3);
        end
    end



    $finish;      
	end

endmodule