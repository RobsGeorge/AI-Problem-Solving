reverse([],[]).
reverse([X],[X]).
reverse([H|T],L2):-reverse(T,T1),!,append(T1,[H],L2).

initialState([4,1,2,5,3]).
goalState([5,4,3,2,1]).

next([E,D,C,B,A],[E,D,C|M]):- reverse([B,A],M).
next([E,D,C,B,A],[E,D|M]):- reverse([C,B,A],M).
next([E,D,C,B,A],[E|M]):- reverse([D,C,B,A],M).
next([E,D,C,B,A],M):- reverse([E,D,C,B,A],M).

solve:-initialState(X),ans(X,Sol),write(Sol).

ans(S,Sol):- ans(S,[],Sol),!.
ans(S,_,[S]):- goalState(S).
ans(S,P,[S|T]):- next(S,S1), not(member(S1,P)), ans(S1,[S|P],T).
