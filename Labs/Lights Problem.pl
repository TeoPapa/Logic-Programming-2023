:-lib(ic).
:-lib(ic_global).
:-lib(branch_and_bound).
:-lib(ic_edge_finder).

%%% The Weights available %%%
weight(10).
weight(20).
weight(30).
weight(50).
weight(60).
weight(90).
weight(100).
weight(150).
weight(250).
weight(500).


balance_lights(Weights, Total):-
    findall(X, weight(X), Weights),
    [W1,W2,W3,W4] #:: Weights,
    5*W1#= 5*W2 + 20 *W3 + 40*W4,
    ic:alldifferent([W1,W2,W3,W4]),
    labeling([W1,W2,W3,W4]),
    sumlist([W1,W2,W3,W4], Total).