% Experiment 8: Depth-First Search (DFS)
% Example query: ?- dfs_path(a, f, Path).

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, f).

link(X, Y) :- edge(X, Y).
link(X, Y) :- edge(Y, X).

dfs_path(Start, Goal, Path) :-
    dfs_visit(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

dfs_visit(Goal, Goal, Visited, Visited).
dfs_visit(Current, Goal, Visited, Path) :-
    link(Current, Next),
    \+ member(Next, Visited),
    dfs_visit(Next, Goal, [Next|Visited], Path).
