# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -Wno-sensitivity-entire-vector -Wno-sensitivity-entire-array -g2012 -y ./ -I ./
VVP=vvp
VVP_POST_ARGS=-fst

DECODERS=decoder_1_to_2.sv decoder_2_to_4.sv decoder_3_to_8.sv decoder_4_to_16.sv decoder_5_to_32.sv
# Look up .PHONY rules for Makefiles
.PHONY: clean submission

SRCS=mux4.sv mux8.sv mux16.sv mux32.sv

test_sll : test_sll.sv shift_left_logical.sv $(SRCS) $(DECODERS) shift_left.sv muxN.sv
	${IVERILOG} $^ -o test_sll.bin && ${VVP} test_sll.bin
waves_sll : test_sll
	gtkwave sll.fst

test_srl : test_srl.sv shift_right_logical.sv $(SRCS)
	${IVERILOG} $^ -o test_srl.bin && ${VVP} test_srl.bin -fst
waves_srl : test_srl
	gtkwave srl.fst

test_sra : test_sra.sv shift_right_arithmetic.sv $(SRCS)
	${IVERILOG} $^ -o test_sra.bin && ${VVP} test_sra.bin -fst
waves_sra : test_sra
	gtkwave sra.fst

test_serial: test_parallel_to_serial_converter.sv parallel_to_serial_converter.sv
	${IVERILOG} $^ -o test_serial.bin && ${VVP} test_serial.bin
waves_serial: test_serial
	gtkwave -a parallel_to_serial_converter.gtkw parallel_to_serial_converter.fst

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml

# Call this to generate your submission zip file.
submission:
	zip submission.zip Makefile *.sv *.pdf
