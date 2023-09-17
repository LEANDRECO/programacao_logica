sudoku(S) :- resolve(S), mostraSolucao(S).

resolve(S) :- 
    %resolveLinhas(S),
    %resolveColunas(S).
    resolveQuadros(S).

resolveLinhas([]) :- !.
resolveLinhas([A|B]) :- diferente(A), resolveLinhas(B).

resolveColunas(S) :- 
    transpor(S, ST),
    resolveLinhas(ST).

resolveQuadros(S) :-
    quadros(S, Q),
    resolveLinhas(Q).

todosDiferentes([]).
todosDiferentes([A|B]) :- diferente(A), todosDiferentes(B).

diferente([A, B, C, D]) :- 
    num(A), num(B), num(C), num(D), 
    A \= B, A \= C, A \= D, B \= C, B \= D, C \= D.

num(1).
num(2).
num(3).
num(4).

transpor([], []).
transpor([[]|_], []).
transpor(M, [C|CT]) :- 
    transporColuna(M, C, M1),
    transpor(M1, CT).

transporColuna([], [], []).
transporColuna([[H|T]|RT], [H|CT], [T|RestoT]) :- 
    transporColuna(RT, CT, RestoT).

quadros([], []).
quadros([R1,R2,R3,R4|R], [Q1,Q2|RQuadros]) :- 
    quadro(R1, R2, R3, R4, Q1, Q2),
    quadros(R, RQuadros).

quadro([], [], [], [], [], []).
quadro([A,B|Rs1], [C,D|Rs2], [E,F|Rs3], [G,H|Rs4], [[A,B,C,D]|QT1], [[E,F,G,H]|QT2]) :- 
    quadro(Rs1, Rs2, Rs3, Rs4, QT1, QT2).

mostraSolucao([]) :- !.
mostraSolucao([A|B]) :- 
    mostraLinha(A), nl, mostraSolucao(B).

mostraLinha([]) :- !.
mostraLinha([A|B]) :- 
    write(A), write(' '), mostraLinha(B).


