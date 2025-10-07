module Not8bit(
    input  [7:0] A, 
    output [7:0] S 
);

    not U0_inv (S[0], A[0]);
    not U1_inv (S[1], A[1]);
    not U2_inv (S[2], A[2]); 
    not U3_inv (S[3], A[3]); 
    not U4_inv (S[4], A[4]); 
    not U5_inv (S[5], A[5]); 
    not U6_inv (S[6], A[6]); 
    not U7_inv (S[7], A[7]); 
  
endmodule
