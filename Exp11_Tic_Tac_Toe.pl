% Experiment 11: Simple 3x3 Tic-Tac-Toe with minimax
% Board is a list of 9 cells: x, o, or e (empty).
% Example query: ?- best_move([x,o,x,e,o,e,e,e,x], Move, Score).
% This program evaluates moves for player 'o'; use minimax_value/4 for either side.

winning_line(B, P) :- line(I,J,K), nth1(I,B,P), nth1(J,B,P), nth1(K,B,P), P \= e.
line(1,2,3). line(4,5,6). line(7,8,9).
line(1,4,7). line(2,5,8). line(3,6,9).
line(1,5,9). line(3,5,7).

other(x, o).
other(o, x).

terminal(B, x, 1) :- winning_line(B, x), !.
terminal(B, o, -1) :- winning_line(B, o), !.
terminal(B, _, 0) :- \+ member(e, B), !.

available_move(B, I) :- nth1(I, B, e).
place(B, I, P, NewB) :- same_length(B, NewB), replace_cell(B, I, P, NewB).
replace_cell([_|T], 1, P, [P|T]).
replace_cell([H|T], I, P, [H|R]) :- I > 1, I1 is I - 1, replace_cell(T, I1, P, R).

minimax_value(B, _, Score, _) :- terminal(B, x, Score), !.
minimax_value(B, _, Score, _) :- terminal(B, o, Score), !.
minimax_value(B, _, 0, _) :- \+ member(e, B), !.
minimax_value(B, Player, Score, Move) :-
    findall(S-I, (available_move(B,I), place(B,I,Player,NB),
                   other(Player,Next), minimax_value(NB,Next,S,_)), Pairs),
    choose_score(Player, Pairs, Score-Move).

choose_score(x, Pairs, Best) :- keysort(Pairs, Sorted), last(Sorted, Best).
choose_score(o, Pairs, Best) :- keysort(Pairs, [Best|_]).

best_move(Board, Move, Score) :-
    minimax_value(Board, o, Score, Move).
