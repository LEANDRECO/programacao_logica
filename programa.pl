pai(adao,cain).
pai(adao,abel).
pai(adao,seth).
pai(seth,enos).
avo_parterno(X,Y) :- pai(X,Z), pai(Z,Y).
irmao(X,Y) :- pai(Z,X), pai(Z,Y), X \= Y.
tio(X,Y) :- irmao(X,Z), pai(Z,Y).
antecessor(X,Y) :- pai(X,Y).
antecessor(X,Y) :- mae(X,Y).
antecessor(X,Y) :- pai(X,Z), pai(Z,Y).
antecessor(X,Y) :- mae(X,Z), pai(Z,Y).
tem_filho(X) :- pai(X,_).