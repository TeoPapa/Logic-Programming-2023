%%% Replace %%%

replace(X, Y, [X|T], [Y|T]).

replace(X, Y, [H|T], [H|R]):-
    replace(X, Y, T, R).


%%% Exclude Range %%%

exclude_range(Low, High, List, NewList):-
    exclude_high(High, List, R2),
    exclude_low(Low, List, R1),
    append(R1, R2, NewList).

exclude_high(High, [High|T], T).

exclude_high(High, [H|T], R):-
    exclude_high(High, T, R).

exclude_low(Low, [Low|_], []).

exclude_low(Low, [H|T], [H|R]):-
    exclude_low(Low, T, R).