# HW 4 Verilog Section

## 32 bit wide 32:1 Mux Implementation

I created the mux by using recursion. A N:1 mux can be created with a binary tree of 2:1 muxes, or more abstractly with a two N/2:1 muxes heading into a 2:1 mux. We can utilize this symmetry by using recursion to build a mux, creating the N/2:1 muxes recursively. Making the mux 32 bits wide was relatively trivial as all it required was properly assigning 

Finally, I created a mux32 instance of the mux_n

## Testing

I assigned the input channels to increasing numbers 0-31, and iterated over values for select to select all of them. Unfortunately testing shows that something went awry, giving all of the outputs xes, but I have not had the time to debug this yet (will do in the coming days).

## Adder Implementation

I chose to simply implement a ripple carry adder which I was able to reuse code from the last lab. I did so because I had spent a lot of time already on other parts of the assignment, but I definitely would have tried different ones if I had more time. The adder I implemented iteratively generates the 32 layers of full adders and feeds the inputs into them.

## Adder Testing
I utilized the test adder code from examples. I appreciated going though its form and borrowing a lot of its form to build the mmux test code.

