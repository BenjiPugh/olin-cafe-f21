module slt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

// Copy any other modules you use into this folder and update the Makefile accordingly.


logic [N-1:0] diff;


// an attempt to catch edge cases - if theres a carry out then its much much less


subtractor #(.N(32)) sub(.a(a), .b(b), .diff(diff));

logic same_sign;

always_comb same_sign = a[N-1]~^b[N-1];


assign out = same_sign?diff[N-1]:a[N-1];

endmodule