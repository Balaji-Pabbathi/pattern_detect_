module test_dsp(
    input clk_i,
    input signed [26:0] a_i,
    input signed [17:0] b_i,
    output reg ones_o
);

reg signed [44:0] ab;

// Define the "pin" pattern
parameter [44:0] pd_pattern = 44'b011100100110100101100111;

always @(posedge clk_i) begin
    ab <= a_i * b_i; // Perform the multiplication

    // Pattern detect logic
    if (ab == pd_pattern) begin
        ones_o <= 1'b1; // Set ones_o if pattern detected
    end else begin
        ones_o <= 1'b0; // Reset ones_o if pattern not detected
    end
end

endmodule
