module nr_div(
    input  [31:0] a,    // Dividend
    input  [31:0] b,    // Divisor
    input         en,   // Enable
    output reg [31:0] result // Quotient
);
    integer i;
    reg [32:0] A;       // 33-bit accumulator (signed)
    reg [31:0] M;       // Divisor
    reg [31:0] Q;       // Quotient (intermediate)

    always @(*) begin
        if (en) begin
            if (b == 0) begin
                result = 32'hFFFFFFFF; 
            end else begin
                A = 33'd0;
                Q = a;
                M = b;
                for (i = 0; i < 32; i = i + 1) begin
                    // Left shift {A,Q}
                    {A, Q} = {A, Q} << 1;
                    // A = A - M or A + M based on sign
                    if (A[32] == 0)
                        A = A - M;
                    else
                        A = A + M;
                    // Update Q[0]
                    if (A[32] == 0)
                        Q[0] = 1'b1;
                    else
                        Q[0] = 1'b0;
                end
                // Final correction if A negative
                if (A[32] == 1)
                    A = A + M;
                result = Q; // Quotient
            end
        end else begin
            result = 32'd0;
        end
    end
endmodule
