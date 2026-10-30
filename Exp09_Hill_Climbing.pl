% Experiment 9: Hill Climbing for numerical optimization
% Demonstration maximizes f(X) = -(X-4)^2 + 16.
% Example query: ?- hill_climb(0, BestX, BestValue).

value(X, V) :- V is -((X - 4) * (X - 4)) + 16.

hill_climb(X, BestX, BestValue) :-
    value(X, CurrentValue),
    Left is X - 1,
    Right is X + 1,
    value(Left, LeftValue),
    value(Right, RightValue),
    ( LeftValue > CurrentValue ->
        hill_climb(Left, BestX, BestValue)
    ; RightValue > CurrentValue ->
        hill_climb(Right, BestX, BestValue)
    ; BestX = X, BestValue = CurrentValue
    ).
