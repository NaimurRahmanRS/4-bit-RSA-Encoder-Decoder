module sub_4bit_1bit(
    input DEC,           // Enable signal
    input wire [3:0] a,  // 4-bit input
    input wire b,        // 1-bit input
    output reg [3:0] diff, // 4-bit difference
    output reg borrow      // Borrow flag
);

    reg [3:0] b_ext;          // Extended 1-bit input to 4 bits
    reg [3:0] borrow_internal; // Internal borrow signals

    always @(*) begin
        if (DEC) begin
            // Extend the 1-bit input 'b' to match the 4-bit 'a'
            b_ext = {3'b000, b}; // Extend b to 4 bits: [0, 0, 0, b]

            // Full subtractor logic for each bit
            diff[0] = a[0] ^ b_ext[0];                   // Difference for LSB
            borrow_internal[0] = (~a[0]) & b_ext[0];     // Borrow out from bit 0

            diff[1] = a[1] ^ b_ext[1] ^ borrow_internal[0];  // Difference for bit 1
            borrow_internal[1] = ((~a[1]) & (b_ext[1] | borrow_internal[0])) |
                                 (b_ext[1] & borrow_internal[0]); // Borrow out from bit 1

            diff[2] = a[2] ^ b_ext[2] ^ borrow_internal[1];  // Difference for bit 2
            borrow_internal[2] = ((~a[2]) & (b_ext[2] | borrow_internal[1])) |
                                 (b_ext[2] & borrow_internal[1]); // Borrow out from bit 2

            diff[3] = a[3] ^ b_ext[3] ^ borrow_internal[2];  // Difference for bit 3
            borrow_internal[3] = ((~a[3]) & (b_ext[3] | borrow_internal[2])) |
                                 (b_ext[3] & borrow_internal[2]); // Borrow out from bit 3

            // Final borrow
            borrow = borrow_internal[3];
        end 
    end

endmodule
