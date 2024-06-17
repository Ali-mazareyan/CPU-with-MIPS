
module A_L_U(A,B,S,C);
input [15:0] A;
input [15:0] B;
input [3:0] S;
output reg [15:0] C;


always @(*)
begin
	case(S)
	0 : C=0;
	1 : C=A+B;
	2 : C=A-B;
	3 : C=A&B;
	4 : C=A|B;
	5 : C=A^B;
	6 : C=A>>B;
	7 : C=A<<B;
	8 : C=~A;
	default : C=0;
	endcase
end

endmodule
