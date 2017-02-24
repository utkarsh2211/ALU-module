`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// GroupID-6 (15116067_15116068)- Utkarsh Verma & Vaibhav Garg  
// Date: October 24,2016
// alu8bit_tb.v - test bench for 8 bit ALU which performs basic arithmetic opetrations
////////////////////////////////////////////////////////////////////////////////

module alu8bit_tb;

	// Inputs
	reg [17:0] instr;
	reg clock;
	reg check;

	// Outputs
	wire [15:0] Y;
	wire overflow;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	alu8bit uut (
		.Y(Y), 
		.overflow(overflow), 
		.Cout(Cout), 
		.instr(instr), 
		.clock(clock),
		.check(check)
	);

	initial begin
		clock = 0;
		check = 0;
		instr = 18'b0;

		#20;
		#20 instr = 18'b001010100010101010;
		#20 instr = 18'b010010101000101001;
		#20 instr = 18'b101110100100100010;
		#20 instr = 18'b001010100001010100;
		#20 instr = 18'b100010010100000100;
		#20 instr = 18'b011000001110001000;
		#20 instr = 18'b001110000000011001;
		#20 instr = 18'b101010000001000111;
		#20 instr = 18'b010111111100111011;
		#20 instr = 18'b001000100101010110;
		#20 instr = 18'b011101010100111100;
		#20 instr = 18'b100001000001101011;
		#20;
		instr = 18'b110000100000001000; check = 1;// final product of this multiplication will appear at t= 385ns
		#20 check=0;
		#90;
	   instr = 18'b110001000100010001; check = 1;// final product of this multiplication will appear at t= 495ns
		#20 check = 0;
		#90;
		$finish;
      end  
		always #5 clock = !clock;
      
endmodule

