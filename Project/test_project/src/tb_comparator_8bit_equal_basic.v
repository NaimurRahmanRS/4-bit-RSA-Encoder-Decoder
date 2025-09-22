module tb_comparator_8bit_equal_basic;
    reg  [7:0] a;
    reg  [7:0] b;
    wire       a_eq_b;

    // Instantiate the comparator
    comparator_8bit_equal_basic uut (
        .a(a),
        .b(b),
        .a_eq_b(a_eq_b)
    );

    initial begin
        // Test cases
        a = 8'd15; b = 8'd15; #10; // a == b
        $display("a: %d, b: %d, a_eq_b: %b", a, b, a_eq_b);

        a = 8'd100; b = 8'd50; #10; // a != b
        $display("a: %d, b: %d, a_eq_b: %b", a, b, a_eq_b);

        a = 8'd255; b = 8'd255; #10; // a == b
        $display("a: %d, b: %d, a_eq_b: %b", a, b, a_eq_b);

        // End simulation
        $finish;
    end
endmodule
