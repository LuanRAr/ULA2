module FullSubtractor8Bit(A, B, Cin, Cout, S);
input [7:0] A, B;
input Cin;
output [7:0] S;
output Cout;

wire c0, c1, c2, c3, c4, c5, c6, c7;

FullSubtractor1Bit s0 (
 .A(A[0]),
 .B(B[0]),
 .Cin(Cin),
 .Cout(c0),
 .S(S[0])
);

FullSubtractor1Bit s1 (
 .A(A[1]),
 .B(B[1]),
 .Cin(c0),
 .Cout(c1),
 .S(S[1])
);

FullSubtractor1Bit s2 (
 .A(A[2]),
 .B(B[2]),
 .Cin(c1),
 .Cout(c2),
 .S(S[2])
);

FullSubtractor1Bit s3 (
 .A(A[3]),
 .B(B[3]),
 .Cin(c2),
 .Cout(c3),
 .S(S[3])
);

FullSubtractor1Bit s4 (
 .A(A[4]),
 .B(B[4]),
 .Cin(c3),
 .Cout(c4),
 .S(S[4])
);

FullSubtractor1Bit s5 (
 .A(A[5]),
 .B(B[5]),
 .Cin(c4),
 .Cout(c5),
 .S(S[5])
);

FullSubtractor1Bit s6 (
 .A(A[6]),
 .B(B[6]),
 .Cin(c5),
 .Cout(c6),
 .S(S[6])
);

FullSubtractor1Bit s7 (
 .A(A[7]),
 .B(B[7]),
 .Cin(c6),
 .Cout(Cout),
 .S(S[7])
);

endmodule
