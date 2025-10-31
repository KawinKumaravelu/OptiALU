module flags(
    input [31:0] a, b, result,
    input cout, bout,           // carry out / borrow out from ALU
    input [3:0] sel,            // operation selector
    output zero,
    output sign,
    output parity,
    output overflow,
    output carry
);
    // Zero flag: result is zero
    assign zero = (result == 32'b0);

    // Sign flag: MSB of result
    assign sign = result[31];

    // Parity flag: 1 if even number of 1s in result
    assign parity = ~(^result);

    // Overflow flag: depends on operation
    // sel = 0: addition, sel = 1: subtraction, else 0
    assign overflow = (sel == 4'b0000) ? 
                        ((a[31] & b[31] & ~result[31]) | (~a[31] & ~b[31] & result[31])) :
                      (sel == 4'b0001) ? 
                        ((a[31] & ~b[31] & ~result[31]) | (~a[31] & b[31] & result[31])) :
                      1'b0;

    // Carry flag: depends on operation
    assign carry = (sel == 4'b0000) ? cout :
                   (sel == 4'b0001) ? bout :
                   1'b0;

endmodule
