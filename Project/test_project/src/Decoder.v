`timescale 1ps / 1ps
module Decoder(
    input [15:0] current_state, 
    input e, d, De, En, init,
    input H1, H4, H6, H8, H9, H12, H13, H14, H15,
    output reg [15:0] next_state,
	output reg load, mul, dec, gcd, cmp, mod, pow, out, sel, inc
);
    always @(*) begin
        next_state = 16'b0;

        // State transitions based on the given equations
        next_state[0]  = (current_state[0] & ~init) | (current_state[13] & H13 & ~De) | (current_state[15] & H15);
        next_state[1]  = (current_state[0] & init) | (current_state[1] & ~H1);
        next_state[2]  = current_state[1] & H1;                       
        next_state[3]  = current_state[2];                            
        next_state[4]  = current_state[3] | (current_state[4] & ~H4);                            
        next_state[5]  = current_state[4] & H4;                       
        next_state[6]  = current_state[5] | (current_state[6] & ~H6) | (current_state[7] & ~e);                          
        next_state[7]  = current_state[6] & H6;                       
        next_state[8]  = (current_state[7] & e) | (current_state[8] & ~H8) | (current_state[10] & ~d);                       
        next_state[9]  = (current_state[8] & H8) | (current_state[9] & ~H9);                       
        next_state[10] = current_state[9] & H9;                      
        next_state[11] = current_state[10] & d;                     
        next_state[12] = (current_state[11] & En) | (current_state[12] & ~H12);                     
        next_state[13] = (current_state[12] & H12) | (current_state[13] & ~H13);                    
        next_state[14] = (current_state[11] & ~En) | (current_state[13] & H13 & De) | (current_state[14] & ~H14);             
        next_state[15] = (current_state[14] & H14) | (current_state[15] & ~H15);
		
		load = current_state[2] | current_state[5];
		mul = current_state[1] | current_state[4] | current_state[8];
		dec = current_state[3];
		gcd = current_state[6];
		cmp = current_state[7] | current_state[10];
		mod = current_state[9] | current_state[13] | current_state[15];
		pow = current_state[12] | current_state[14];
		out = current_state[13]	| current_state[15];
		sel = current_state[5] | current_state[8] | current_state[10] | current_state[13] | current_state[14] | current_state[15];
		inc	= current_state[7] | current_state[10];
    end
endmodule
