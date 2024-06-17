
module O_R(Clock_Puls,Reset,Load,O,OR);
input Clock_Puls;
input Reset;
input Load;
input [15:0] O;
output reg [15:0] OR;
   
always @(posedge Clock_Puls)
begin
	if (Reset==1)
	OR=0;
	else if (Load==1)
	OR=O;
end

endmodule
