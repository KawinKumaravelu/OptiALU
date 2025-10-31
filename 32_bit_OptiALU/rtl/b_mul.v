module b_mul( 
    input [31:0] a, b,
    input  en,
    output reg [31:0] result
);
    reg [63:0] P;          
    integer i;
    always @(*) begin
        if (en) begin
            P = {32'b0, b, 1'b0};
            for (i = 0; i < 32; i = i + 1) begin
                case (P[1:0])
                    2'b01: P[63:32] = P[63:32] + a; 
                    2'b10: P[63:32] = P[63:32] - a; 
                    default: ; 
                endcase
                P = {P[63], P[63:1]};
            end
            result = P[63:0]; 
        end else begin
            result = 32'd0;
        end
    end
endmodule
