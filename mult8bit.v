`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GroupID-6 (15116067_15116068)- Utkarsh Verma & Vaibhav Garg  
// Date: October 24,2016
// mult8bit.v - 8 bit Multiplier module (A x B)
//////////////////////////////////////////////////////////////////////////////////
module mult8bit(
		FinalProduct, A, B, clk, check
    );
			input [7:0] A, B;
			input clk, check;
			
			reg [7:0] alpha, beta, M;
			reg beta_1;
				
			wire [7:0] sum, difference;
			
			output [15:0] FinalProduct;
			
			always @(posedge clk)
			begin
			 if (check) begin
				 alpha <= 8'b0;
				 M <= A;
				 beta <= B;
				 beta_1 <= 1'b0;
				 end
			 else begin
				 case ({beta[0], beta_1})
						2'b0_1 : {alpha, beta, beta_1} <= {sum[7], sum, beta};
						2'b1_0 : {alpha, beta, beta_1} <= {difference[7], difference, beta};
					default: {alpha, beta, beta_1} <= {alpha[7], alpha, beta};
				 endcase
				end
			end
			ALUunit adder (sum, alpha, M, 1'b0);
			ALUunit subtracter (difference, alpha, ~M, 1'b1);
			assign FinalProduct = {alpha, beta};

endmodule

		module ALUunit(out, input1, input2, cin);
	
				input [7:0] input1;
				input [7:0] input2;
				input cin;
	
				output [7:0] out;
				
				assign out = input1 + input2 + cin;
		endmodule
