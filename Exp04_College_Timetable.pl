% Experiment 4: College Timetable Knowledge Base
% Example queries:
% ?- faculty_subject(Faculty, Subject).
% ?- class_on_day(monday, Subject).
% ?- classroom_for(prolog, Room).

faculty_subject(naitik, prolog).
faculty_subject(harsh, artificial_intelligence).
faculty_subject(himanshu, data_structures).

class_on_day(monday, prolog).
class_on_day(tuesday, artificial_intelligence).
class_on_day(wednesday, data_structures).
class_on_day(thursday, prolog).
class_on_day(friday, artificial_intelligence).

classroom_for(prolog, lab_1).
classroom_for(artificial_intelligence, room_204).
classroom_for(data_structures, lab_2).

timetable(Day, Subject, Room) :-
    class_on_day(Day, Subject),
    classroom_for(Subject, Room).
