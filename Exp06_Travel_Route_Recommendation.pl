% Experiment 6: Travel Route Recommendation
% Routes are represented as undirected connections.
% Example queries:
% ?- connected(durg, raipur).
% ?- route(durg, bilaspur, Path).

connected(durg, raipur).
connected(raipur, bilaspur).
connected(durg, bhilai).
connected(bhilai, raipur).
connected(raipur, jagdalpur).
connected(bilaspur, korba).

road(A, B) :- connected(A, B).
road(A, B) :- connected(B, A).

route(Start, Destination, Path) :-
    route_acc(Start, Destination, [Start], RevPath),
    reverse(RevPath, Path).

route_acc(Destination, Destination, Visited, Visited).
route_acc(Current, Destination, Visited, Path) :-
    road(Current, Next),
    \+ member(Next, Visited),
    route_acc(Next, Destination, [Next|Visited], Path).
