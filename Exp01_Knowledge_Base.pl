% Experiment 1: Student-Course Knowledge Base
% Run with SWI-Prolog: ?- [Exp01_Knowledge_Base].

student(naitik).
student(harsh).
student(himanshu).

course(prolog).
course(python).
course(java).

enrolled(naitik, prolog).
enrolled(naitik, python).
enrolled(harsh, java).
enrolled(harsh, prolog).
enrolled(himanshu, python).
enrolled(himanshu, java).

classmate_in_course(Student1, Student2, Course) :-
    enrolled(Student1, Course),
    enrolled(Student2, Course),
    Student1 \= Student2.

% Example queries:
% ?- enrolled(naitik, prolog).
% ?- classmate_in_course(naitik, harsh, prolog).
% ?- student(Who).
