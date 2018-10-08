module Control (
   // input signals
   input wire [6:0] Opcode,
   // output control signals
   output wire Jump,
   output wire Branch,
   output wire MemRead,
   output wire MemtoReg,
   output wire [2:0] ALUOp,
   output wire MemWrite,
   output wire ALUSrc,
   output wire RegWrite,
   output wire R,
   output wire [1:0] rdsel
   );
   
   always @(*) begin
      //LUI
      if (OPcode = 7`b0110111) begin
         Jump = 0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b100;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b01;
      end

      //AUIPC
      if (OPcode = 7`b0010111) begin
         Jump = 0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b100;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b11;
      end

      //JAL
      if (OPcode = 7`b1101111) begin
         Jump = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b101;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b10;
      end

      //JALR
      if (OPcode = 7`b1100111) begin
         Jump = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b111;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 1;
         rdsel = 2`b10;
      end

      //BEQ,BNE,BLT,BGE,BLTU,BGEU
      if (OPcode = 7`b1100011) begin
         Jump = 0;
         Branch = 1;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b011;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite = 0;
         R = 0;
         rdsel = 2`b00;
      end

      //LB,LH,LW,LBU,LHU,
      if (OPcode = 7`b0000011) begin
         Jump = 0;
         Branch = 0;
         MemRead = 1;
         MemtoReg = 1;
         ALUOp = 3`b110;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b01;
      end

      //SB,SH,SW
      if (OPcode = 7`b0100011) begin
         Jump = 0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b010;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b00;
      end

      //ADDI,SLTI,SLTIU,XORI,ORI,ANDI,SLLI,SRLI,SRAI
      if (OPcode = 7`b0010011) begin
         Jump = 0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b001;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b00;
      end

      //ADD,SUB,SLL,SLT,SLTU,XOR,SRL,SRA,OR,AND
      if (OPcode = 7`b0110011) begin
         Jump = 0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         ALUOp = 3`b000;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite = 1;
         R = 0;
         rdsel = 2`b00;
      end
   end

endmodule