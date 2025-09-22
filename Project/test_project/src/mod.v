module mod(
    input wire [7:0] a,     // Dividend
    input wire [7:0] b,     // Divisor
    output reg [7:0] mod_result // Remainder (a % b)
);

    wire [7:0] diff;        // Difference from subtractor        
    reg [7:0] temp_a;       // Temporary register to hold the dividend in each iteration
    wire [7:0] temp_b;      // Divisor register
    wire [7:0] zero;        // Constant zero for comparison

    // Initialize temp_b
    assign temp_b = b;
    assign zero = 8'b00000000;

    // Subtractor instance to perform subtraction of b from temp_a
    sub_8bit subtractor(
        .a(temp_a),
        .b(temp_b),
        .sub(diff)
    );

    // Comparator logic (temp_a >= temp_b)
    wire temp_a_ge_temp_b; // temp_a >= temp_b
    assign temp_a_ge_temp_b = (temp_a[7] == temp_b[7]) ? (temp_a >= temp_b) : (temp_a[7] == 0);

    // Modulus calculation
    always @ (a or b) begin
        temp_a = a; // Initialize temp_a with dividend a
        // Keep subtracting until temp_a < temp_b
        while (temp_a >= temp_b) begin
            temp_a = diff; // Subtract b from temp_a
        end
        mod_result = temp_a; // When temp_a < temp_b, this is the modulus result
    end
endmodule
