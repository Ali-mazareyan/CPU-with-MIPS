
module I_R(Clock_Puls,Reset,Load,I,IR);
input Clock_Puls;
input Reset;
input Load;
input [31:0] I;
output reg [31:0] IR;
   
always @(posedge Clock_Puls)
begin
	if (Reset==1)
	IR=0;
	else if (Load==1)
	IR=I;
end

endmodule
