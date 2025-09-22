module power_module (
    input Enable,                // Enable signal for the operation
    input [3:0] Base,            // 4-bit Base (A)
    input [3:0] Exponent,        // 4-bit Exponent (B)
    input [7:0] Modulus,         // 8-bit Modulus value
    output reg [7:0] Result,     // 8-bit Result of Base^Exponent % Modulus
    output reg Valid             // Output signal to indicate valid result
);

    reg [7:0] temp_result;       // Temporary result
    wire [7:0] intermediate_result; // Intermediate result from multiplication
    wire [7:0] mod_result;       // Result after modulus operation
    wire [7:0] exponent_bit_0, exponent_bit_1, exponent_bit_2, exponent_bit_3;

    multiplier_4bit multiplier (
        .Enable(Enable),
        .A(temp_result[3:0]),
        .B(Base),
        .P(intermediate_result),
        .H1() 
    );

    mod modulus_inst (
        .a(intermediate_result),
        .b(Modulus),
        .mod_result(mod_result)
    );

    assign exponent_bit_0 = Exponent[0] ? intermediate_result : 8'b1;  
    assign exponent_bit_1 = Exponent[1] ? intermediate_result : 8'b1; 
    assign exponent_bit_2 = Exponent[2] ? intermediate_result : 8'b1;  
    assign exponent_bit_3 = Exponent[3] ? intermediate_result : 8'b1;  


    always @(*) begin
        if (!Enable) begin
            Result = 8'b0;
            Valid = 0;
        end else begin

            temp_result = 8'b00000001;
            temp_result = temp_result * exponent_bit_0; 
            temp_result = temp_result * exponent_bit_1; 
            temp_result = temp_result * exponent_bit_2; 
            temp_result = temp_result * exponent_bit_3; 


            temp_result = mod_result; 
            Result = temp_result;     
            Valid = 1;           
        end
    end

endmodule
