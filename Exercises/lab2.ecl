sumn(1, 1).

sumn(N, X):-
    N>0,
    N1 is N-1,
    sumn(N1, X1),
    X is N+X1.