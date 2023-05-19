%%% List Processing %%%

%%% indicate_change/2 where it succeeds when the Change list contains the changes
%%% between the numbers of the first list (contains up, down, no_c (no change))
indicate_change([H,H|T], [no_c|Change]):-
    indicate_change([H|T], Change).

indicate_change([H1,H2|T], [up|Change]):-
    H1 < H2,
    indicate_change([H2|T], Change).

indicate_change([H1,H2|T], [down|Change]):-
    indicate_change([H2|T], Change).

indicate_change([H,H], [no_c]).

indicate_change([H1,H2], [up]):-
    H1 < H2.

indicate_change([H1,H2], [down]).



%%% Alternative indicate_change %%%

%%% TODO




%%% Roling Average %%%

%%% Checks if the N is bigger than the list and fails if it is so. If it isn't it
%%% searches the average in the whole list
rolling_avg(N, TimeSeq, Average):-
    length(TimeSeq, Len),
    N < Len,
    roll_avg(N, TimeSeq, Average).


%%% Creates a sublist of Numbers with the size of N and finds the average of them.
%%% Then it deletes the first Num and continues to find the averages
roll_avg(N, TimeSeq, [Ans|Aver]):-
    sublist([Num|Tail], TimeSeq),
    length([Num|Tail], N),
    average_num([Num|Tail], Ans),
    delete(Num, TimeSeq, NewSeq),
    roll_avg(N, NewSeq, Aver).

%%% The base case for roll_avg/3, where it returns the average of the last N numbers
roll_avg(N, TimeSeq, [Ans]):-
    length(TimeSeq, N),
    average_num(TimeSeq, Ans).


%%% Succeeds when L1 is a sublist of L2 (L2 contains L1)
sublist(L1,L2):-
    append( Ltemp, _S2, L2),
    append( _S1, L1,Ltemp).


%%% Finds the average of a List
average_num(List, Average):-
    sum_list(List, Sum),
    length(List, N),
    Average is Sum / N.


%%% The base case for sum_list/2, if there's an empty List, the Sum is 0
sum_list([], 0).

%%% Finds the Sum of all the elements of the List
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.