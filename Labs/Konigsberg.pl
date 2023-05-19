%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Connections Between Riverbanks (rb) And Islands (i) Threw Bridges
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
connect(rb1,i1,b2).
connect(rb1,i1,b3).
connect(rb1,i2,b4).
connect(i1,i2,b1).
connect(i1,rb2,b5).
connect(i1,rb2,b6).
connect(i2,rb2,b7).


%%% If a Place is connected with another, then the other is also connected with it
connection(Place1, Place2, Bridge):-
    connect(Place1, Place2, Bridge).


connection(Place1, Place2, Bridge):-
    connect(Place2, Place1, Bridge).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Walk/3 With the place I want to Start, the place I want to End and the List with
%%% the Bridges I will cross
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
walk(StartPlace, EndPlace, Bridges):-
    walking(StartPlace, EndPlace, [], Bridges).


%%% Walk/4 with the two places I want to end and the Bridges I have visited till now.
%%% The Walk succeeds if the StartingPlace is connected with the EndingPlace and the
%%% Bridge isn't in the Visited list.
walk(StartingPlace, EndingPlace, VisitedBridges, [Bridge]):-
    connection(StartingPlace, EndingPlace, Bridge),
    not(member(Bridge, VisitedBridges)).


walk(StartingPlace, EndingPlace, VisitedBridges, [Bridge|Bridges]):-
    connection(StartingPlace, NextPlace, Bridge),
    not(member(Bridge, VisitedBridges)),
    walk(NextPlace, EndingPlace, [Bridge|VisitedBridges], Bridges).