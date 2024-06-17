
module Cache(Clock_Puls,Reset,Adr,Wr,Rd,D_i,D_o);
input Clock_Puls;
input Reset;
input [15:0] Adr;
input Wr;
input Rd;
input [15:0] D_i;
output [15:0] D_o;
 
//reg [15:0] Cch [0:65535];
reg [15:0] Cch [0:1023];

integer i;

always @(posedge Clock_Puls)
begin
	if (Reset==1)
	begin
	//	for (i=0;i<65536;i=i+1)
		for (i=0;i<1024;i=i+1)
			Cch[i]=16'b0;	
	end
	else if (Wr==1)
		Cch[Adr]=D_i;
end

	assign D_o = (Rd==1)? Cch[Adr] : 16'b0;


endmodule
