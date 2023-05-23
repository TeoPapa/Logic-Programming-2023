:-use_module(library(ic)).
:-use_module(library(branch_and_bound)).

ram([2,8,8,16,2,4]).
price([30,35,20,38,44,65]).
vcpu([4,8,8,4,4,8]).


select_providers(X, Y, Price):-
    price(Prices),

    member(V1, Prices),
    member(V2, Prices),

	ic_global:alldifferent([V1, V2]),

    Price #= V1 + V2,
    minimize(labeling([V1, V2]),Price),

    element(X, Prices, V1),
    element(Y, Prices, V2).
    
