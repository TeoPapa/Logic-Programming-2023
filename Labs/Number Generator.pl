num_gen(N1, N2):-
    N1 =[NUM11,5,NUM13,NUM14,3],
    N2 =[NUM21,NUM22,0,NUM24,1],
    [N1, N2]#::[0..9],

    Num1 #= 10000*NUM11+5*1000+100*NUM13+10*NUM14+3,
    Num2 #= 10000*NUM21+NUM22*1000+10*NUM24+1,
    12848 #= abs(Num1 - Num2),
    labeling([NUM11,5,NUM13,NUM14,3], [NUM21,NUM22,0,NUM24,1]).
