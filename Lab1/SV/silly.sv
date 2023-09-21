module fulladder (input  logic a, b, c, output logic y, cout);
   
  assign y = a ^ b ^ c;
  assign cout = a & b | a & c | b & c;
   
endmodule

module rca (input logic [3:0]a, [3:0]b, c, output logic [3:0]y, output logic cout);
  logic w1, w2, w3;
  fulladder fa1 (a[0], b[0], c, y[0], w1);
  fulladder fa2 (a[1], b[1], w1, y[1], w2);
  fulladder fa3 (a[2], b[2], w2, y[2], w3);
  fulladder fa4 (a[3], b[3], w3, y[3], cout);
endmodule
