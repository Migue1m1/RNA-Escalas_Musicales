at_end(X, [], [X]).
at_end(X, [H|R], [H|L]) :- at_end(X, R, L).
next_note([H|R], L):- at_end(H, R, L).


generar_escala(_, [], _, []).
generar_escala(X, [X|R_i],
	          [H_n|R_n],
		  [H_n|Escala]) :- X1 is X + 1,
			           generar_escala(X1, R_i, R_n, Escala).
generar_escala(X, Int,
	          [_|R_n],
	           Escala) :-  X1 is X + 1,
		               generar_escala(X1, Int, R_n, Escala).

generar_escala(Notas, 'Mayor', Escala) :- generar_escala(0,
			        [0,2,4,5,7,9,11],
				Notas,
				Escala),!.
generar_escala(Notas, 'Menor', Escala) :- generar_escala(0,
			        [0,2,3,5,7,8,10],
				Notas,
				Escala).
generar_escalas(0, _, _).
generar_escalas(N, Notas, Tipo) :- generar_escala(Notas, Tipo, Escala),
				 write(Escala),nl,
	                         next_note(Notas, Notas_n),
				 N1 is N - 1,
	                         generar_escalas(N1, Notas_n, Tipo).

generar_escalas :- write('ESCALAS MAYORES:'),nl,nl,
                   generar_escalas(12,
		      ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'],
		       'Mayor'),
		   nl, write('ESCALAS MENORES:'),nl,nl,
	           generar_escalas(12,
		      ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'],
		       'Menor'),!.

generar_data :- write('ESCALAS MAYORES:'),nl,nl,
                   generar_escalas(12,
		      [-1, -0.83, -0.66, -0.49, -0.33, -0.16, 0.16, 0.33, 0.49, 0.66, 0.83, 1],
		       'Mayor'),
		   nl, write('ESCALAS MENORES:'),nl,nl,
	           generar_escalas(12,
		      [-1, -0.83, -0.66, -0.49, -0.33, -0.16, 0.16, 0.33, 0.49, 0.66, 0.83, 1],
		       'Menor'),!.
