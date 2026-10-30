% Experiment 5: Student Performance Analysis
% Grade rules: 80+ topper, 50-79 average/pass, below 50 failed.
% Example queries:
% ?- performance(naitik, 88, Category).
% ?- performance(harsh, 67, Category).
% ?- performance(himanshu, 42, Category).

performance(Name, Marks, topper) :-
    student_marks(Name, Marks), Marks >= 80.
performance(Name, Marks, average_performer) :-
    student_marks(Name, Marks), Marks >= 50, Marks < 80.
performance(Name, Marks, failed) :-
    student_marks(Name, Marks), Marks < 50.

student_marks(naitik, 88).
student_marks(harsh, 67).
student_marks(himanshu, 42).

show_performance(Name) :-
    performance(Name, Marks, Category),
    format('~w scored ~w marks: ~w~n', [Name, Marks, Category]).
