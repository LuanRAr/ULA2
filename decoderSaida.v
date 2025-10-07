module decoderSaida(
    input [7:0] S,
    output [6:0] segments
);

	 /*a = A'B'C'D'E'F'G'H + A'B'C'D'E'FG'H' + A'B'C'D'EF'GH + A'B'C'D'EFG'H

		b = A'B'C'D'E'G'H + A'B'C'D'FGH' + A'B'C'D'EGH + A'B'C'D'EFH'
		
		c = A'B'C'D'E'F'G'H + A'B'C'D'E'F'GH' + A'B'C'D'EFH' + A'B'C'D'EFG

		d = A'B'C'D'F'G'H + A'B'C'D'E'FG'H' + A'B'C'D'FGH + A'B'C'D'EF'GH'

		e = A'B'C'D'E'GH + A'B'C'D'E'FG' + A'B'C'D'EF'G'H

		f = A'B'C'D'E'F'G + A'B'C'D'E'GH + A'B'C'D'EFG'H

		g= A'B'C'D'E'F'G' + A'B'C'D'E'FGH + A'B'C'D'EFG'H'
	*/

    //Fios para as entradas invertidas (A', B', C', etc.)
    wire A_n, B_n, C_n, D_n, E_n, F_n, G_n, H_n;
    
    //Fio para o prefixo comum (A'B'C'D')
    wire prefix;

    // Fios para os produtos (termos AND) de cada segmento
    // Segmento a
    wire p1_a, p2_a, p3_a, p4_a, sum_a;
    // Segmento b
    wire p1_b, p2_b, p3_b, p4_b, sum_b;
    // Segmento c
    wire p1_c, p2_c, p3_c, p4_c, sum_c;
    // Segmento d
    wire p1_d, p2_d, p3_d, p4_d, sum_d;
    // Segmento e
    wire p1_e, p2_e, p3_e, sum_e;
    // Segmento f
    wire p1_f, p2_f, p3_f, sum_f;
    // Segmento g
    wire p1_g, p2_g, p3_g, sum_g;

    //Inversores para criar os sinais negados
    not inv_A(A_n, S[7]);
    not inv_B(B_n, S[6]);
    not inv_C(C_n, S[5]);
    not inv_D(D_n, S[4]);
    not inv_E(E_n, S[3]);
    not inv_F(F_n, S[2]);
    not inv_G(G_n, S[1]);
    not inv_H(H_n, S[0]);

    //Prefixo para os notABCD iniciais de todos 
    and and_prefix(prefix, A_n, B_n, C_n, D_n);

    //Segmento a = (E'F'G'H + E'FG'H' + EF'GH + EFG'H)
    and and_p1_a(p1_a, E_n, F_n, G_n, S[0]); // E'F'G'H
    and and_p2_a(p2_a, E_n, S[2], G_n, H_n); // E'FG'H'
    and and_p3_a(p3_a, S[3], F_n, S[1], S[0]); // EF'GH
    and and_p4_a(p4_a, S[3], S[2], G_n, S[0]); // EFG'H
    or  or_sum_a(sum_a, p1_a, p2_a, p3_a, p4_a);
    and and_final_a(segments[6], prefix, sum_a);

    // Segmento b = (E'G'H + FGH' + EGH + EFH')
    and and_p1_b(p1_b, E_n, G_n, S[0]);        // E'G'H
    and and_p2_b(p2_b, S[2], S[1], H_n);       // FGH'
    and and_p3_b(p3_b, S[3], S[1], S[0]);      // EGH
    and and_p4_b(p4_b, S[3], S[2], H_n);       // EFH'
    or  or_sum_b(sum_b, p1_b, p2_b, p3_b, p4_b);
    and and_final_b(segments[5], prefix, sum_b);

    // Segmento c = prefix & (E'F'G'H + E'F'GH' + EFH' + EFG)
    and and_p1_c(p1_c, E_n, F_n, G_n, S[0]); // E'F'G'H
    and and_p2_c(p2_c, E_n, F_n, S[1], H_n); // E'F'GH'
    and and_p3_c(p3_c, S[3], S[2], H_n);       // EFH'
    and and_p4_c(p4_c, S[3], S[2], S[1]);      // EFG
    or  or_sum_c(sum_c, p1_c, p2_c, p3_c, p4_c);
    and and_final_c(segments[4], prefix, sum_c);

    // Segmento d = prefix & (F'G'H + E'FG'H' + FGH + EF'GH')
    and and_p1_d(p1_d, F_n, G_n, S[0]);        // F'G'H
    and and_p2_d(p2_d, E_n, S[2], G_n, H_n); // E'FG'H'
    and and_p3_d(p3_d, S[2], S[1], S[0]);      // FGH
    and and_p4_d(p4_d, S[3], F_n, S[1], H_n);  // EF'GH'
    or  or_sum_d(sum_d, p1_d, p2_d, p3_d, p4_d);
    and and_final_d(segments[3], prefix, sum_d); 

    //Segmento e = prefix e (E'GH + E'FG' + EF'G'H)
    and and_p1_e(p1_e, E_n, S[1], S[0]);   // E'GH
    and and_p2_e(p2_e, E_n, S[2], G_n);   // E'FG'
    and and_p3_e(p3_e, S[3], F_n, G_n, S[0]);// EF'G'H
    or  or_sum_e(sum_e, p1_e, p2_e, p3_e);
    and and_final_e(segments[2], prefix, sum_e);
    
    //Segmento f = prefix e (E'F'G + E'GH + EFG'H)
    and and_p1_f(p1_f, E_n, F_n, S[1]);       // E'F'G
    and and_p2_f(p2_f, E_n, S[1], S[0]);      // E'GH
    and and_p3_f(p3_f, S[3], S[2], G_n, S[0]); // EFG'H
    or  or_sum_f(sum_f, p1_f, p2_f, p3_f);
    and and_final_f(segments[1], prefix, sum_f);

    //Segmento 'g' = prefix & (E'F'G' + E'FGH + EFG'H')
    and and_p1_g(p1_g, E_n, F_n, G_n);       // E'F'G'
    and and_p2_g(p2_g, E_n, S[2], S[1], S[0]); // E'FGH
    and and_p3_g(p3_g, S[3], S[2], G_n, H_n);  // EFG'H'
    or  or_sum_g(sum_g, p1_g, p2_g, p3_g);
    and and_final_g(segments[0], prefix, sum_g); 

endmodule