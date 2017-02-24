`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GroupID-6 (15116067_15116068)- Utkarsh Verma & Vaibhav Garg  
// Date: October 24,2016
// and8bit.v - 8 bit AND module (inp1 AND inp2)
//////////////////////////////////////////////////////////////////////////////////
module and8bit(
    output [7:0] out,
    input [7:0] inp1,
    input [7:0] inp2
    );
and1bit out0(out[0],inp1[0],inp2[0]);
and1bit out1(out[1],inp1[1],inp2[1]);
and1bit out2(out[2],inp1[2],inp2[2]);
and1bit out3(out[3],inp1[3],inp2[3]);
and1bit out4(out[4],inp1[4],inp2[4]);
and1bit out5(out[5],inp1[5],inp2[5]);
and1bit out6(out[6],inp1[6],inp2[6]);
and1bit out7(out[7],inp1[7],inp2[7]);
endmodule

module and1bit(output x, input a,b
 );
 assign x = a&b; 
endmodule
