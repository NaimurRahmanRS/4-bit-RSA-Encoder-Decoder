module multiplier_4bit (
    input Enable,
    input [3:0] A,   // 4-bit input A
    input [3:0] B,   // 4-bit input B
    output reg [7:0] P,   // 8-bit output product
    output reg H1         // Output H1
);
    wire [3:0] pp0, pp1, pp2, pp3;
    wire [7:0] shifted_pp0, shifted_pp1, shifted_pp2, shifted_pp3;

    // Generate partial products using AND gates
    assign pp0 = A & {4{B[0]}}; // Partial product for B[0]
    assign pp1 = A & {4{B[1]}}; // Partial product for B[1]
    assign pp2 = A & {4{B[2]}}; // Partial product for B[2]
    assign pp3 = A & {4{B[3]}}; // Partial product for B[3]

    // Shift partial products to align them properly
    assign shifted_pp0 = {4'b0000, pp0};            // No shift for pp0
    assign shifted_pp1 = {3'b000, pp1, 1'b0};       // Shift pp1 by 1
    assign shifted_pp2 = {2'b00, pp2, 2'b00};       // Shift pp2 by 2
    assign shifted_pp3 = {1'b0, pp3, 3'b000};       // Shift pp3 by 3

    // Sequential logic to control output P and H1
    always @(*) begin
        if (!Enable) begin
            //P = 8'b0;
            H1 = 0;
        end else if (Enable) begin
            P = shifted_pp0 + shifted_pp1 + shifted_pp2 + shifted_pp3;
            H1 = 1;
        end
    end
endmodule
