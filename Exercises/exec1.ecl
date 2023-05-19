%%% EXEC1 CLP 2023

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



%%% Exec 2

%%% Alternative indicate_change %%%

%%% Finds all the Changes when for every X with combinations of H1 and H2 that create the List
indicate_change_alt(List, Changes) :-
    findall(X, (append(_, [H1,H2|_], List), changes(H1, H2, X)), Changes).

%%% The changes between the numbers, if both numbers are equal returns no_c (no change)
changes(Number, Number, no_c).

%%% The changes between the numbers, if the second number is greater, returns up
changes(Number1, Number2, up):-
    Number1 < Number2.

%%% The changes between the numbers, if the second number is less, returns down
changes(Number1X, Number2, down):-
    Number1 > Number2. 


%%%% Exec3

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



%%% EXEC 4

%%% Representations of graphs mentioned in the exercise. %%%

example(1,[node(1,60,end), node(2,40,1), node(3,40,1), node(4,50,2)]). 
example(2,[node(1,3,end), node(2,2,1), node(3,1,1), node(4,4,1), node(5,5,end)]).
example(3,[node(1,100,end), node(2,100,1), node(3,100,2), node(4, 90, 1), node(5,80,2), node(6,100,3), node(7, 90, 1), node(8,100,3)]). 


%%% (a) %%%

graph_start_nodes(Graph, StartNodes):-
    findall(X, (member(node(X,_ ,_ ), Graph), not(member(node(_,_,X), Graph))), StartNodes).


%%% (b) %%%

%%% Base case for evaluate_path/5, when the next node is the end node return the Value
%%% and the current StartingNode
evaluate_path(StartingNode, Visited, Graph, [Value], [StartingNode]):-
    member(node(StartingNode, Value, end), Graph).

%%% Base case for evaluate_path/5, when the next node is a part of the Visited nodes,
%%% return the Value and the current StartingNode
evaluate_path(StartingNode, Visited, Graph, [Value], [StartingNode]):-
    member(EndNode, Visited),
    member(node(StartingNode, Value, EndNode), Graph).

%%% Traces the Graph for the Nodes and keeps the Values past, but cannot trace back to
%%% the Visited nodes
evaluate_path(StartingNode, Visited, Graph, [Value|Values], [StartingNode|NewSeq]):-
    member(node(StartingNode, Value, EndNode), Graph),
    not(member(EndNode, Visited)),
    evaluate_path(EndNode, [EndNode|Visited], Graph, Values, NewSeq).


%%% (c) %%%
max_seq(Graph, Seq, Value):-
    graph_start_nodes(Graph, Seq),
    evaluations(Seq, [], Graph, [], Value).

evaluations([StartNode|T], Visited, Graph, MaxVals, Value):-
    evaluate_path(StartingNode, Visited, Graph, Values, Sequence),
    max(Values, Max),
    evaluations(T, Sequence, Graph, [Max|MaxVals], Value).

evaluations([StartNode], Visited, Graph, MaxVals, Value):-
    evaluate_path(StartNode, Visited, Graph, Values, Seq),
    max(Values, Max),
    sum_list([Max|MaxVals], Value).

%%% Succeeds when L1 is a sublist of L2 (L2 contains L1)
sublist(L1,L2):-
    append(Ltemp, _S2, L2),
    append(_S1, L1,Ltemp).


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