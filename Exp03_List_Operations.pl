% Experiment 3: List operations (append, reverse, member, length)
% Example queries:
% ?- append_lists([naitik,harsh], [himanshu], Result).
% ?- reverse_list([naitik,harsh,himanshu], R).
% ?- list_member(harsh, [naitik,harsh,himanshu]).
% ?- list_length([naitik,harsh,himanshu], N).

append_lists([], L, L).
append_lists([H|T], L, [H|R]) :- append_lists(T, L, R).

reverse_list(L, R) :- reverse_acc(L, [], R).
reverse_acc([], Acc, Acc).
reverse_acc([H|T], Acc, R) :- reverse_acc(T, [H|Acc], R).

list_member(X, [X|_]).
list_member(X, [_|T]) :- list_member(X, T).

list_length([], 0).
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.
