`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GroupID-6 (15116067_15116068)- Utkarsh Verma & Vaibhav Garg  
// Date: October 24,2016
// alu8bit.v - 8 bit ALU which performs basic arithmetic opetrations
//////////////////////////////////////////////////////////////////////////////////
module alu8bit(
    output reg [15:0] Y,
    output reg overflow,
	 output reg Cout,
    input [17:0] instr, 
	 input clock,
	 input check
    );
	 wire [7:0] addresult,andresult,xorresult;
	 wire [15:0] multresult;
	 wire carry,over;
	 adder8bit block1(addresult,carry,instr[15:8],instr[7:0],1'b0,over);
	 xor8bit block3(xorresult,instr[15:8],instr[7:0]);
	 and8bit block2(andresult,instr[15:8],instr[7:0]);
	 mult8bit block4(multresult,instr[15:8],instr[7:0],clock,check);
	 always@(posedge clock) begin
	 case(instr[17:16])
    2'b00: begin Y[7:0]= addresult;
						Cout=carry;
	              Y[15:8] =8'b00000000;
						overflow=over; end
	 2'b01: begin Y[7:0]= andresult;
					  Y[15:8] =8'b00000000;
					  overflow = 1'b0;
					  Cout = 1'b0;	end
	 2'b10: begin Y[7:0]= xorresult;
					  Y[15:8] =8'b00000000;
					  overflow = 1'b0;
					  Cout = 1'b0; end
	 2'b11: begin Y= multresult;
			  overflow = 1'b0;
			  Cout = 1'b0; end			
	endcase				  
	end
endmodule
