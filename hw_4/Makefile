# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -g2012 -y ./ -I ./
VVP=vvp

ADDERS=adder_1.sv adder_n.sv add32.sv

test_add32: test_add32.sv $(ADDERS)
	${IVERILOG} $^ -o test_add32.bin && ${VVP} test_add32.bin

test_mux32: test_mux32.sv mux32.sv mux_N_32.sv
	${IVERILOG} $^ -o test_mux32.bin && ${VVP} test_mux32.bin
	# Call this to clean up all your generated files

clean:
	rm -f *.bin *.vcd vivado*.log vivado*.jou vivado*.str

# Call this to generate your submission zip file.
submission:
	zip submission.zip Makefile *.sv README.md *.pdf
