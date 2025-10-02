module Xor8bit(A, B, S);

input [3:0] A, B;
output [7:0] S;

xor xor0(S[0], A[0], B[0]);
xor xor1(S[1], A[1], B[1]);
xor xor2(S[2], A[2], B[2]);
xor xor3(S[3], A[3], B[3]);

xor xor4(S[4], A[4], B[4]);
xor xor5(S[5], A[5], B[5]);
xor xor6(S[6], A[6], B[6]);
xor xor7(S[7], A[7], B[7]);

endmodule
