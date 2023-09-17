mae(ana,eva).
mae(eva,noe).
mae(bia,rai).
mae(bia,clo).
mae(bia,ary).
mae(lia,gal).
pai(ivo,eva).
pai(gil,rai).
pai(gil,clo).
pai(gil,ary).
pai(rai,noe).
pai(ary,gal).
homem(ivo).
homem(gil).
homem(rai).
homem(ary).
homem(noe).
mulher(ana).
mulher(bia).
mulher(eva).
mulher(clo).
mulher(lia).
mulher(gal).
gerou(X,Y) :- pai(X,Y).
gerou(X,Y) :- mae(X,Y).
filho(X,Y) :- pai(Y,X), homem(X).
filho(X,Y) :- mae(Y,X), homem(X).
filha(X,Y) :- pai(Y,X), mulher(X).
filha(X,Y) :- mae(Y,X), mulher(X).
irmao(X,Y) :- pai(Z,X), pai(Z,Y), X \= Y.
tio(X,Y) :- irmao(X,Z), pai(Z,Y), homem(X).
tia(X,Y) :- irmao(X,Z), pai(Z,Y), mulher(X).
primo(X,Y) :- tio(Z,Y), pai(Z,X), homem(X).
primo(X,Y) :- tio(Z,Y), mae(Z,X), homem(X).
prima(X,Y) :- tio(Z,Y), pai(Z,X), mulher(X).
prima(X,Y) :- tio(Z,Y), mae(Z,X), mulher(X).
avo(X,Y) :- pai(X,Z), pai(Z,Y).
avo(X,Y) :- pai(X,Z), mae(Z,Y).
ava(X,Y) :- mae(X,Z), pai(Z,Y).
ava(X,Y) :- mae(X,Z), mae(Z,Y).
feliz(X) :- filho(_,X).
feliz(X) :- filha(_,X).
casal(X,Y) :- filho(_,X), filho(_,Y), X \= Y.
casal(X,Y) :- filha(_,X), filha(_,Y), X \= Y.