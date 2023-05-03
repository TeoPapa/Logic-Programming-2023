:- op(500,yfx,and).
:- op(450,yfx,or).
:- op(400, fy,--).
:- op(600, xfy, ==>).
:- op(450, yfx, xor).
:- op(450, yfx, nor).
:- op(500, yfx, nand).

%% Operators Implementation %%%
X and Y:-
    X,Y.

X or _:-
    X.

_ or Y:-
    Y.

--X:-
    not(X).

X ==> Y:-
    --X or Y.

X xor Y:-
    X, --Y.

X xor Y:-
    --Y, X.


X nor Y:-
    --(X or Y).

X nand Y:-
    --(X and Y).

%%% True And False

t.

f:-
    !,fail.
 

%%% Set Diff %%%
 

set_diff(List1, List2, Result):-
    findall(X, (member(X,List1), not(member(X,List2))), Result).
 

%%% Min List %%%
 

minlist(Min, List):-
    setof(X, member(X, List), [Min|_]).
 

%%% Map F %%%
 

map_f(Operation, List, Result):-
    findall(X, (mfunction(Operation, List, X)), Result).
 

mfunction(Operation, List, R):-
    member(X, List),
    C=..[Operation, X, R],
    call(C).
 

double(Number, Result):-
    Result is 2*Number.
 

square(Number, Result):-
    Result is Number*Number.