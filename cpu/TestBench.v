`timescale 1ns / 1ps

module TestBench;

	reg Clock_Puls;
	reg Reset;

	wire [15:0] AR;
	wire [31:0] IR;
	wire [15:0] AC;
	wire [15:0] OR;

	Pardazande Test (
		.Clock_Puls(Clock_Puls), 
		.Reset(Reset), 
		.AR(AR), 
		.IR(IR), 
		.AC(AC), 
		.OR(OR)
	);

	initial 
	begin
		Clock_Puls = 1;
		Reset = 1;
		#10;
      Reset = 0;  
	end
	
   always
	#5 Clock_Puls=~Clock_Puls;
   
endmodule

