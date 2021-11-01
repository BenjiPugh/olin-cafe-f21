module test_edge_detector;


logic clk, rst, signal, ena;
wire edge_detected;

edge_detector UUT(.rst(rst), .ena(ena), .clk(clk), .signal(signal), .edge_detected(edge_detected));


initial begin;
clk = 0;
rst = 1;
signal = 0;
ena = 1;
$dumpfile("edge_detector.vcd");
$dumpvars (0, UUT);

repeat (2) @(negedge clk);

rst = 0;


for (int i = 0; i < 10; i++) begin
    delay = $random;
    repeat (delay) @(negedge clk);
    signal = ~signal;
    
end

$finish;

end

always #5 clk = -clk; // Clock signal

endmodule