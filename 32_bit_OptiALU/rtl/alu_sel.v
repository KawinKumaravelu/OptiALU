module alu_sel(
    input [31:0]a,b,
    input [3:0]opcode,
    input cin,bin,en,
    output [31:0]sum,diff,
    output reg [31:0]result,
    output cout,bout,
    output zero,sign,carry,overflow,parity
);

    // Intermediate operation wires
    wire [31:0] sum, diff, notout, andout, orout, norout, nandout, xorout, xnorout;
    wire [31:0] mul, div, eq, gr, ls, rs;

    // Enable signals (only one active at a time)
    wire en_add  = en & (opcode == 4'd0);
    wire en_sub  = en & (opcode == 4'd1);
    wire en_not  = en & (opcode == 4'd2);
    wire en_and  = en & (opcode == 4'd3);
    wire en_or   = en & (opcode == 4'd4);
    wire en_nor  = en & (opcode == 4'd5);
    wire en_nand = en & (opcode == 4'd6);
    wire en_xor  = en & (opcode == 4'd7);
    wire en_xnor = en & (opcode == 4'd8);
    wire en_mul  = en & (opcode == 4'd9);
    wire en_div  = en & (opcode == 4'd10);
    wire en_eq   = en & (opcode == 4'd11);
    wire en_gr   = en & (opcode == 4'd12);
    wire en_ls   = en & (opcode == 4'd13);
    wire en_rs   = en & (opcode == 4'd14);

    // Instantiate all operation modules
    add       u_add  (.a(a), .b(b), .cin(cin), .result(sum), .cout(cout), .en(en_add));
    sub       u_sub  (.a(a), .b(b), .bin(bin), .result(diff), .bout(bout), .en(en_sub));
    not_gate  u_not  (.a(a), .result(notout), .en(en_not));
    and_gate  u_and  (.a(a), .b(b), .result(andout), .en(en_and));
    or_gate   u_or   (.a(a), .b(b), .result(orout), .en(en_or));
    nor_gate  u_nor  (.a(a), .b(b), .result(norout), .en(en_nor));
    nand_gate u_nand (.a(a), .b(b), .result(nandout), .en(en_nand));
    xor_gate  u_xor  (.a(a), .b(b), .result(xorout), .en(en_xor));
    xnor_gate u_xnor (.a(a), .b(b), .result(xnorout), .en(en_xnor));
    b_mul     u_mul  (.a(a), .b(b), .result(mul), .en(en_mul));
    nr_div    u_div  (.a(a), .b(b), .result(div), .en(en_div));
    equal     u_eq   (.a(a), .b(b), .result(eq), .en(en_eq));
    greater   u_gr   (.a(a), .b(b), .result(gr), .en(en_gr));
    l_shift   u_ls   (.a(a), .result(ls), .en(en_ls));
    r_shift   u_rs   (.a(a), .result(rs), .en(en_rs));
    
    flags u_flags(.a(a), .b(b), .result(result), .cout(cout), .bout(bout), .opcode(opcode), .zero(zero), .sign(sign), .parity(parity), .overflow(overflow), .carry(carry));
    // Select result from the active module
    always @(*) begin
        if (en) begin
            case (opcode)
                4'd0:  result = sum;
                4'd1:  result = diff;
                4'd2:  result = notout;
                4'd3:  result = andout;
                4'd4:  result = orout;
                4'd5:  result = norout;
                4'd6:  result = nandout;
                4'd7:  result = xorout;
                4'd8:  result = xnorout;
                4'd9:  result = mul;
                4'd10: result = div;
                4'd11: result = eq;
                4'd12: result = gr;
                4'd13: result = ls;
                4'd14: result = rs;
                default: result = 32'd0;
            endcase
        end else begin
            result = 32'd0;
        end
    end



endmodule
