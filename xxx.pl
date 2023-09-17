merge([],[],[]) :- !.
merge([A|B],[],[A|X]) :- merge(B,[],X), !.
merge([],[C|D],[C|X]) :- merge([],D,X), !.
merge([A|B],[C|D],[A|X]) :- A =< C, merge(B,[C|D],X), !.
merge([A|B],[C|D],[C|X]) :- A > C, merge([A|B],D,X), !.

insereOrd(X,[],[X]).
insereOrd(X,[Y|Z],[X,Y|Z]):- X =< Y, !.
insereOrd(X,[Y|Z],[Y|Io]) :- X > Y, insereOrd(X,Z,Io).

parcionaPar([],[],[]).
parcionaPar(A,B,C) :- length(A,I), I1 is I / 2, trunca(A,I1,B),
    append(B,C,A).

parcionaImpar(A,B,C) :- length(A,I), I1 is (I div 2) + 1, trunca(A,I1,B),
    append(B,C,A).

par(A,B,C) :- length(A,L), (L mod 2) =:= 0, parcionaPar(A,B,C), !.
par(A,B,C) :- parcionaImpar(A,B,C), !.

palindromo(A) :- length(A,I), (I mod 2) =:= 0, I1 is I / 2, trunca(A,I1,B),
    append(B,C,A), reverse(C,K), B = K.
palindromo(A) :- length(A,I),I1 is (I div 2), trunca(A,I1,B),
    append(B,[_|C],A), reverse(C,K), B = K.
 

 metIguais(A) :- length(A,I), I1 is (I div 2), trunca(A,I1,B),
    append(B,C,A), B = C.


eleva(0,_,0).
eleva(_,0,1).
eleva(X,1,X).
eleva(X,Y,Z) :-  Y1 is Y - 1, eleva(X,Y1,X1), Z is X * X1 ,!.

wN(0):-write(0),!.
wN(N):-write(N),N1 is N-1, wN(N1),write(N).

xxx1(0) :- write(0).
xxx1(N) :- forall(between(0,N,I), (I1 is N - I, escreveEsp(I1),wN(I),nl)).

escreveEsp(X) :- forall(between(0,X,_), write(' ')).

asterisco(N) :- forall(between(1,N,_), (write('*'))).

piramide(0) :- write(''), !.
piramide(N) :- forall(between(1,N,I), (asterisco(I), nl)).


somaTodos([],0).
somaTodos([X|Y],R) :- somaTodos(Y,R1), R is X + R1.

entreLista(X,X,[X]):- !.
entreLista(X,Y,[X|Z]) :- X < Y, X1 is X + 1, entreLista(X1,Y,Z).

trunca(_,0,[]).
trunca([A|B],X,[A|Y]) :- X1 is X - 1, trunca(B,X1,Y),!.
