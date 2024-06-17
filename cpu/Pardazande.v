
module Pardazande(Clock_Puls,Reset,AR,IR,AC,OR);
input Clock_Puls;
input Reset;
output [15:0] AR;
output [31:0] IR;
output [15:0] AC;
output [15:0] OR;

wire [15:0] ADD;
wire [31:0] H;
wire [15:0] F;
wire [15:0] CH;
wire Load_AR,Load_IR,Load_AC,Load_OR,Wr,Rd;
wire [3:0] S;

	 
Adder U1 (
    .A(16'd2), 
    .B(AR), 
    .C(ADD)
    );

A_R U2 (
    .Clock_Puls(Clock_Puls), 
    .Reset(Reset), 
    .Load(Load_AR), 
    .A(ADD), 
    .AR(AR)
    );
	 
MEM_Dastoorat U3 (
    .Reset(Reset), 
    .AR(AR), 
    .OUT(H)
    );

I_R U4 (
    .Clock_Puls(Clock_Puls), 
    .Reset(Reset), 
    .Load(Load_IR), 
    .I(H), 
    .IR(IR)
    );

AC_R U5 (
    .Clock_Puls(Clock_Puls), 
    .Reset(Reset), 
    .Load(Load_AC), 
    .A(F), 
    .AC(AC)
    );

A_L_U U6 (
    .A(AC), 
    .B(IR[15:0]), 
    .S(S), 
    .C(F)
    );

Cache U7 (
    .Clock_Puls(Clock_Puls), 
    .Reset(Reset), 
    .Adr(IR[15:0]), 
    .Wr(Wr), 
    .Rd(Rd), 
    .D_i(AC), 
    .D_o(CH)
    );

O_R U8 (
    .Clock_Puls(Clock_Puls), 
    .Reset(Reset), 
    .Load(Load_OR), 
    .O(CH), 
    .OR(OR)
    );

C_U U9 (
    .Clock_Puls(Clock_Puls), 
    .Reset(Reset), 
    .IR16(IR[31:16]), 
    .Load_AR(Load_AR), 
    .Load_IR(Load_IR), 
    .Load_AC(Load_AC), 
    .Load_OR(Load_OR), 
    .S(S), 
    .Wr(Wr), 
    .Rd(Rd)
    );


endmodule
