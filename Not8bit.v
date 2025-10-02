module Not8bit(A, B, S);
	input [7:0] A, B;
	output [15:0] S;

	not not0(S[0], A[0]);
	not not1(S[1], A[1]);
	not not2(S[2], A[2]);
	not not3(S[3], A[3]);
	not not4(S[4], A[4]);
	not not5(S[5], A[5]);
	not not6(S[6], A[6]);
	not not7(S[7], A[7]);
	
	not not0b(S[8], B[0]);
	not not1b(S[9], B[1]);
	not not2b(S[10], B[2]);
	not not3b(S[11], B[3]);
	not not4b(S[12], B[4]);
	not not5b(S[13], B[5]);
	not not6b(S[14], B[6]);
	not not7b(S[15], B[7]);
  
  
endmodule
