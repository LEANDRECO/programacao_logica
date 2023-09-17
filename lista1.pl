% Soma
total([],0).
total([A|B],X) :- total(B,Z), X is Z + A.
% Comprimento.
comprimento(0,[]).
comprimento(N,[_|B]) :- comprimento(N1,B), N is N1 + 1.
% Media
media([],0).
media(A,X) :- total(A,Y), comprimento(Z,A), X is Y/Z.
% Nesimo
nesimo(1,[A|_],A).
nesimo(N,[_|B],X) :- N1 is N - 1, nesimo(N1,B,X).
% Minino
minimo([A], A).
minimo([A|B], A) :- minimo(B,C), A < C, !.
minimo([A|B], C) :- minimo(B,C), A >= C, !.
% Intervalo
intervalo(A,B,[]) :- A > B.
intervalo(A,B,[X|L]) :- X is A, intervalo((X+1),B,L). 
% Máximo divisor comum
mdc(X,X,X).
mdc(X,Y,D) :- X < Y, Y1 is Y - X, mdc(X,Y1,D).
mdc(X,Y,D) :- Y < X, mdc(Y,X,D).
% Ocorrencias
ocorrencias(_,[],0) :- !.
ocorrencias(X,[X|B],N) :- ocorrencias(X,B,N1), N is N1 + 1, !.
ocorrencias(X,[_|B],N) :- ocorrencias(X,B,N).
% Divisores
divisores(N,L) :- findall(X,(between(1,N,X), N mod X =:= 0),L).

% Concatena
ap([],L,L).
ap([X|L1],L2,[X|L3]) :- ap(L1,L2,L3).

a :- a(0).
a(X) :- X>10, !.
a(X) :- write(X),write(' '), X1 is X+1,a(X1).  

f.
b.
p:-!,f.

p:-b.

max(X,Y,M):- X>Y, M=X.
max(X,Y,M):- X=<Y, M=Y.