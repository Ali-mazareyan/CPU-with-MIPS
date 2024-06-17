
module AC_R(Clock_Puls,Reset,Load,A,AC);
input Clock_Puls;
input Reset;
input Load;
input [15:0] A;
output reg [15:0] AC;
   
always @(posedge Clock_Puls)
begin
	if (Reset==1)
	AC=0;
	else if (Load==1)
	AC=A;
end

endmodule
