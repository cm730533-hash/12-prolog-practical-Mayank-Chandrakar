% Experiment 2: Arithmetic, Factorial and Fibonacci
% Example queries:
% ?- arithmetic_demo(7, 3).
% ?- factorial(5, F).
% ?- fibonacci(7, F).

arithmetic_demo(A, B) :-
    Sum is A + B,
    Difference is A - B,
    Product is A * B,
    ( B =\= 0 -> Division is A / B ; Division = 'undefined (division by zero)' ),
    format('Sum = ~w~nDifference = ~w~nProduct = ~w~nDivision = ~w~n',
           [Sum, Difference, Product, Division]).

factorial(0, 1).
factorial(N, F) :-
    integer(N), N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    integer(N), N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.
