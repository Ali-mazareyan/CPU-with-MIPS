
module C_U(Clock_Puls,Reset,IR16,Load_AR,Load_IR,Load_AC,Load_OR,S,Wr,Rd);
input Clock_Puls;
input Reset;
input [15:0] IR16;
output Load_AR;
output Load_IR;
output Load_AC;
output Load_OR;
output reg [3:0] S;
output Wr;
output Rd;

reg [1:0] T;
wire w;

always @(posedge Clock_Puls)
begin
	if(Reset==1 || T==2)
		T=0;
	else
		T=T+1;
end


	
and (Load_AR,~T[0],~T[1]);

and (Load_IR,T[0],~T[1]);
	
and (Wr,IR16[8],~T[0],T[1]);

and (Rd,IR16[9],~T[0],T[1]);

or (w,IR16[7],IR16[6],IR16[5],IR16[4],IR16[3],IR16[2],IR16[1],IR16[0]);
and (Load_AC,w,~T[0],T[1]);
	
and (Load_OR,IR16[9],~T[0],T[1]);
	
	
always @(*)
begin
	case(IR16)
	1 : S=1; //add
	2 : S=2; //tafrigh
	4 : S=3; //and
	8 : S=4; //or
	16 : S=5; //xor
	32 : S=6; //shift rast
	64 : S=7; //shift chap
	128 : S=8; //not
	default : S=0;
	endcase
end
	


endmodule
