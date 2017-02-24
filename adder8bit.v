`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// GroupID-6 (15116067_15116068)- Utkarsh Verma & Vaibhav Garg  
// Date: October 24,2016
// adder8bit.v - 8 bit ripple carry adder (inp1 + inp2)
//////////////////////////////////////////////////////////////////////////////////
module adder8bit(
    output [7:0] sum,
    output Cout,
    input [7:0] inp1,
    input [7:0] inp2,
    input Cin,
    output overflow
    );
	 
	 wire d,e,f,g,h,i;
	 wire[7:0] tempsum;
    fulladder1bit adder0(tempsum[0],d,inp1[0],inp2[0],Cin);
	 fulladder1bit adder1(tempsum[1],e,inp1[1],inp2[1],d);
	 fulladder1bit adder2(tempsum[2],f,inp1[2],inp2[2],e);
	 fulladder1bit adder3(tempsum[3],g,inp1[3],inp2[3],f);
	 fulladder1bit adder4(tempsum[4],h,inp1[4],inp2[4],g);
	 fulladder1bit adder5(tempsum[5],i,inp1[5],inp2[5],h);
	 fulladder1bit adder6(tempsum[6],j,inp1[6],inp2[6],i);
	 fulladder1bit adder7(tempsum[7],Cout,inp1[7],inp2[7],j);
	 assign overflow = (((~inp1[7])&(~inp2[7])&tempsum[7])|(inp1[7]&inp2[7]&(~tempsum[7]))); 
	 assign sum[0] = ((overflow&(1'b0))|((~overflow)&tempsum[0]));
	 assign sum[1] = ((overflow&(1'b0))|((~overflow)&tempsum[1]));
	 assign sum[2] = ((overflow&(1'b0))|((~overflow)&tempsum[2]));
	 assign sum[3] = ((overflow&(1'b0))|((~overflow)&tempsum[3]));
	 assign sum[4] = ((overflow&(1'b0))|((~overflow)&tempsum[4]));
	 assign sum[5] = ((overflow&(1'b0))|((~overflow)&tempsum[5]));
	 assign sum[6] = ((overflow&(1'b0))|((~overflow)&tempsum[6]));
	 assign sum[7] = ((overflow&(1'b0))|((~overflow)&tempsum[7]));

endmodule

module fulladder1bit(
	 output s,
	 output carryout,
	 input a,
	 input b,
	 input carryin
	 );
	 wire temp;
	 xor1bit g1(temp,a,b);
	 xor1bit g2(s,temp,carryin);
	 assign carryout = ((a&b)|(a&carryin)|(b&carryin));
	 
endmodule	 
