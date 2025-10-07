module FullAdder8Bit(A, B, Cin, Cout, S);
input [7:0] A, B;
input Cin;
output [7:0] S;
output Cout;

wire c0, c1, c2, c3, c4, c6, c6, c7;

FullAdder1Bit a0 (
 .A(A[0]),
 .B(B[0]),
 .Cin(Cin),
 .Cout(c0),
 .S(S[0])
);

FullAdder1Bit a1 (
 .A(A[1]),
 .B(B[1]),
 .Cin(c0),
 .Cout(c1),
 .S(S[1])
);

FullAdder1Bit a2 (
 .A(A[2]),
 .B(B[2]),
 .Cin(c1),
 .Cout(c2),
 .S(S[2])
);

FullAdder1Bit a3 (
 .A(A[3]),
 .B(B[3]),
 .Cin(c2),
 .Cout(c3),
 .S(S[3])
);

FullAdder1Bit a4 (
 .A(A[4]),
 .B(B[4]),
 .Cin(c3),
 .Cout(C4),
 .S(S[4])
);

FullAdder1Bit a5 (
 .A(A[5]),
 .B(B[5]),
 .Cin(c5),
 .Cout(C6),
 .S(S[5])
);

FullAdder1Bit a6 (
 .A(A[6]),
 .B(B[6]),
 .Cin(c6),
 .Cout(C7),
 .S(S[6])
);

FullAdder1Bit a7 (
 .A(A[7]),
 .B(B[7]),
 .Cin(c7),
 .Cout(Cout),
 .S(S[7])
);

endmodule

