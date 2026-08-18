module alu(
        input [3:0] a,
        input [3:0] b,
        input [2:0] op,
        output reg [3:0] answer,
        output reg carry_out
);

        always @(*) begin

                carry_out = 1'b0;

                case (op) 

                3'b000: {carry_out,answer} = a + b;
                3'b001: {carry_out,answer} = a - b;
                3'b010: answer = a & b;
                3'b011: answer = a | b;
                3'b100: answer = a ^ b;
                default: answer = 4'b0000;

                endcase
        end
endmodule
