
module A_R(Clock_Puls,Reset,Load,A,AR);
input Clock_Puls;
input Reset;
input Load;
input [15:0] A;
output reg [15:0] AR;
   
always @(posedge Clock_Puls)
begin
	if (Reset==1)
	AR=-2;
	else if (Load==1)
	AR=A;
end

endmodule
