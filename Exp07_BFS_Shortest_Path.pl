% Experiment 7: Breadth-First Search (BFS) shortest path
% Example query: ?- bfs_shortest_path(a, f, Path).

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, f).
edge(e, f).

link(X, Y) :- edge(X, Y).
link(X, Y) :- edge(Y, X).

bfs_shortest_path(Start, Goal, Path) :-
    bfs([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs([[Goal|Rest]|_], Goal, [Goal|Rest]).
bfs([ [Node|Rest] |Queue], Goal, Path) :-
    findall([Next,Node|Rest],
            (link(Node, Next), \+ member(Next, [Node|Rest])),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs(UpdatedQueue, Goal, Path).
