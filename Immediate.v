module Immediate (
   input wire [2:0] ALUOp,
   input wire [31:0] inst,
   output wire [31:0] immediate_out
   );
   integer i;
   always @(*) begin
      //I-immediate
      if (ALUOp == 3`b001) begin
         for (i =11; i < 32;i++) begin
            immediate_out[i] = inst[31];
         end
         immediate_out[10:0] = {inst[30:25],inst[24:21],inst[20]};
      end
      //S-immediate
      if (ALUOp == 3`b010) begin
         for (i =11; i < 32;i++) begin
            immediate_out[i] = inst[31];
         end
         immediate_out = {inst[30:25],inst[11:8],inst[7]};
      end
      //B-immediate
      if (ALUOp == 3`b011) begin
         for (i =12; i < 32;i++) begin
            immediate_out[i] = inst[31];
         end
         immediate_out = {inst[7],inst[30:25],inst[11:8],1`b0};
      end
      //U-immediate
      if (ALUOp == 3`b100) begin
         immediate_out = {inst[31],inst[30:20],inst[19:12],12`b000000000000};
      end
      //J-immediate
      if (ALUOp == 3`b101) begin
         for (i =20; i < 32;i++) begin
            immediate_out[i] = inst[31];
         end
         immediate_out = {inst[31],inst[19:12],inst[20],inst[30:25],inst[24:21],1`b0};
      end
   end
endmodule