`timescale 1ns / 1ps
module tb ();

   logic    [3:0]a;
   logic 	[3:0]b;
   logic 	c;
   logic 	[3:0]y;
   logic  cout;
   logic        clk;   
   
  // instantiate device under test
   rca dut (a, b, c, y, cout);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

integer handle3;
integer desc3;
integer i;
integer sum_correct;
integer sum;

initial
	begin
		handle3 = $fopen("rca.out");
		desc3 = handle3;
		#1900 $finish;
	end

initial
	begin
		for (i=0; i < 180; i=i+1)
			begin
			@(posedge clk)
				begin
					a = $random;
					b = $random;
					c = $random;
				end
					@(negedge clk)
						begin
							sum_correct = a + b + c;
							sum = ((16 * cout) + y);
							$fdisplay(desc3, "a = %d b = %d c= %d y= %d cout= %d sum_correct = %d, sum = %d, valid result = %b", a, b, c, y, cout, sum_correct, sum, sum==sum_correct);
						end
			end // @(negedge clk)
	end


   initial
     begin
	 end

   
endmodule
