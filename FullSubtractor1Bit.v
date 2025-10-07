module FullSubtractor1Bit(A, B, Cin, Cout, S);
input A, B, Cin;    
output Cout, S;  

wire x1, a1, a2, a3; // Fios intermediários para cálculos lógicos
wire w_notA;         // Fio para armazenar o NOT de A

//Operação XOR para calcular A xor B
xor xor1 (x1, A, B);

//Operação XOR novamente para calcular o resultado final da subtração
xor xor2 (S, x1, Cin);

//Inverte A para usar na lógica de empréstimo
not notA (w_notA, A);

//Gera condições de empréstimo:
and and1 (a1, w_notA, B);   
and and2 (a2, w_notA, Cin);
and and3 (a3, B, Cin);      

//Combina as condições para gerar o Cout (empréstimo de saída)
or or1 (Cout, a1, a2, a3);

endmodule