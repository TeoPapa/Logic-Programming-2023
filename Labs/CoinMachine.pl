%%%%%%%%%%%%%%%%%%%%%%%%
%%% Coin Transitions
%%%%%%%%%%%%%%%%%%%%%%%%
transition(s1, 0, s1).
transition(s1, 20, s2).
transition(s1, 20, s3).
transition(s1, 50, s6).
transition(s2, 10, s3).
transition(s2, 20, s4).
transition(s3, 10, s4).
transition(s3, 20, s5).
transition(s4, 10, s5).
transition(s4, 20, s6).
transition(s5, 10, s6).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% coins_to_insert/3 with the First and Last places I wanna get. Succeeds when
%%% we get from the First Node to the Last Node and returns the coins in a List
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coins_to_insert(FirstNode, [C], LastNode):-
    transition(FirstNode, C, LastNode).


coins_to_insert(FirstNode, [C|Coins], LastNode):-
    transition(FirstNode, C, NextNode),
    coins_to_insert(NextNode, Coins, LastNode).