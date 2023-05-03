common_suffix(List1, List2, Suffix, Position):-
    common_suf(List1, List2, Suffix),
    length(Suffix, Position).


common_suf(List,List,List).

common_suf([H1|T1],[H2|T2],Suffix):-
    common_suf(T1, T2, Suffix).