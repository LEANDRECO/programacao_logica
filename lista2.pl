a :- a(0).
a(X) :- X > 10, !.
a(X) :- write(X), write(' '), X1 is X+1,a(X1).

wN(0):-write(0),!.
wN(N):-write(N),N1 is N-1, wN(N1), write(N).

piramide(0) :- wN(0).
piramide(X) :- X > 0, X1 is X-1,write(' '),piramide(X1),write('\n'),wN(X), !. 

elevado(0,_,0):-!.
elevado(_,0,1):- !.
elevado(X,1,X):- !.
elevado(X,Y,Z):- Y1 is Y-1,elevado(X,Y1,Z1), Z is X * Z1.

desenhar_triangulo(N) :-
    desenhar_linhas(1, N).

desenhar_linhas(Current, N) :-
    Current > N.
desenhar_linhas(Current, N) :-
    desenhar_asteriscos(Current),
    nl,
    Next is Current + 1,
    desenhar_linhas(Next, N).

desenhar_asteriscos(N) :-
    N > 0,
    write('*'),
    Next is N - 1,
    desenhar_asteriscos(Next).
desenhar_asteriscos(0).

