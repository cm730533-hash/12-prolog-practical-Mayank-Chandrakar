% Experiment 12: Water Jug Problem using state-space search
% Jug capacities: 4 litres and 3 litres. Goal: obtain 2 litres in the 4-litre jug.
% State = state(AmountIn4LJug, AmountIn3LJug)
% Example query: ?- water_jug_solution(Path).

capacity(4, 3).

goal(state(2, _)).

next_state(state(X,Y), state(4,Y)) :- X < 4.            % Fill 4L jug
next_state(state(X,Y), state(X,3)) :- Y < 3.            % Fill 3L jug
next_state(state(X,Y), state(0,Y)) :- X > 0.            % Empty 4L jug
next_state(state(X,Y), state(X,0)) :- Y > 0.            % Empty 3L jug
next_state(state(X,Y), state(X1,Y1)) :-                 % Pour 4L -> 3L
    X > 0, Y < 3, Amount is min(X, 3-Y),
    X1 is X-Amount, Y1 is Y+Amount.
next_state(state(X,Y), state(X1,Y1)) :-                 % Pour 3L -> 4L
    Y > 0, X < 4, Amount is min(Y, 4-X),
    X1 is X+Amount, Y1 is Y-Amount.

water_jug_solution(Path) :-
    search([[state(0,0)]], [], RevPath),
    reverse(RevPath, Path).

search([[State|Rest]|_], _, [State|Rest]) :- goal(State), !.
search([[State|Rest]|Queue], Visited, Path) :-
    findall([Next,State|Rest],
            (next_state(State,Next),
             \+ member(Next, [State|Rest]),
             \+ member(Next, Visited)),
            NewPaths),
    append(Queue, NewPaths, NewQueue),
    search(NewQueue, [State|Visited], Path).
