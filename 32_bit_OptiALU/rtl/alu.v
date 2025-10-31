module alu(
    input [31:0]a,b,
    input [3:0]opcode,
    input cin,bin,en,
    output [31:0]sum,diff,
    output reg [31:0]result,
    output cout,bout,
    output zero,sign,carry,overflow,parity
);
    wire [31:0]andout,orout,notout,norout,nandout,xorout,xnorout,sum,diff,mul,div,eq,gr,ls,rs ;

    add       a1(.a(a),.b(b),.cin(cin),.result(sum),.cout(cout),.en(en));
    sub       a2(.a(a),.b(b),.bin(bin),.result(diff),.bout(bout),.en(en));
    not_gate  a3(.a(a),.result(notout),.en(en));
    and_gate  a4(.a(a),.b(b),.result(andout),.en(en));
    or_gate   a5(.a(a),.b(b),.result(orout),.en(en));
    nor_gate  a6(.a(a),.b(b),.result(norout),.en(en));
    nand_gate a7(.a(a),.b(b),.result(nandout),.en(en));
    xor_gate  a8(.a(a),.b(b),.result(xorout),.en(en));
    xnor_gate a9(.a(a),.b(b),.result(xnorout),.en(en));
    b_mul     a10(.a(a),.b(b),.result(mul),.en(en));
    nr_div    q11(.a(a),.b(b),.result(div),.en(en));
    equal     q12(.a(a),.b(b),.result(eq),.en(en));
    greater   q13(.a(a),.b(b),.result(gr),.en(en));
    l_shift   q14(.a(a),.result(ls),.en(en));
    r_shift   q15(.a(a),.result(rs),.en(en));
    
    flags u_flags(.a(a), .b(b), .result(result), .cout(cout), .bout(bout), .opcode(opcode), .zero(zero), .sign(sign), .parity(parity), .overflow(overflow), .carry(carry));


    always@(*) begin
        if (en) begin
            case(opcode)
                4'd0    : result = sum;
                4'd1    : result = diff;
                4'd2    : result = notout;
                4'd3    : result = andout;
                4'd4    : result = orout;
                4'd5    : result = norout;
                4'd6    : result = nandout;
                4'd7    : result = xorout;
                4'd8    : result = xnorout;
                4'd9    : result = mul;
                4'd10    : result = div;
                4'd11    : result = eq;
                4'd12    : result = gr;
                4'd13    : result = ls;
                4'd14    : result = rs;
                default : result = 32'b0;  
            endcase
        end else begin
            result = 32'b0;
        end
    end
endmodule