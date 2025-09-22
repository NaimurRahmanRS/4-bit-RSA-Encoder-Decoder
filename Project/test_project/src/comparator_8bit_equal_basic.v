module comparator_8bit_equal_basic (
    input  [7:0] a, // 8-bit input a
    input  [7:0] b, // 8-bit input b
	input cmp,
    output a_eq_b, // Output: a == b
	output reg e
);

    wire [7:0] xor_result;
    assign xor_result = a ^ b; 

    assign a_eq_b = ~(xor_result[0] | xor_result[1] | xor_result[2] | xor_result[3] |
	xor_result[4] | xor_result[5] | xor_result[6] | xor_result[7]);
	
    always @(*) begin
        if (cmp) begin
			e = a_eq_b; 
    	end
	end
endmodule
