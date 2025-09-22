module gcd_tb;

    reg [7:0] A, B;        // Registers for inputs A and B
    reg rst;          // Clock and reset signals
    wire [7:0] out;        // Output for the GCD
	wire H6;
	reg clk;

    // Instantiate the gcd module
    gcd g(A, B, rst, out, H6);

    initial begin
        // Initialize clock
        clk = 1'b0;
        
        // Test Case 1
        $display("Starting Test Case 1: A = 255, B = 245");
        A = 8'd255;      // First number
        B = 8'd254;     // Second number
        rst = 1'b1;    // Apply reset
        #5 rst = 1'b0; // Release reset after 5 time units

        // Wait for a few clock cycles to complete the computation
        #10 $display("Test Case 1 Result: GCD = %d", out);

        // Test Case 2
        $display("Starting Test Case 2: A = 102, B = 88");
        A = 8'd102;
        B = 8'd88;
        rst = 1'b1;
        #5 rst = 1'b0;

        #10 $display("Test Case 2 Result: GCD = %d", out);

        // End simulation
        $finish;
    end

    // Clock generation
    always #1 clk = ~clk;

endmodule
