ap1([],L,L).
ap1([X|L1],L2,[X|L3]) :- ap1(L1,L2,L3).

remove1(X,[],[]).
remove1(X,[X|L1],L1).
remove1(X,[Y|L2],L4):- X \= Y,remove1(X,L2,L3),ap1([Y],L3,L4),!.