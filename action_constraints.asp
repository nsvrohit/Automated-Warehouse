% action constraints

% up, down, left, and right moves
move(X1, Y1) :- X1=-1..1, Y1=-1..1, |X1|!=|Y1|.

% update robot position after move
robot(RID, X+X1, Y+Y1, T+1) :- robot(RID), robot(RID, X, Y, T), move(RID, X1, Y1, T), move(X1, Y1).

% update shelf position if being carried
shelf(SID, X+X1, Y+Y1, T+1) :- shelf(SID), shelf(SID, X, Y, T), move(RID, X1, Y1, T), transit(t, RID, SID, T), move(X1, Y1).

% robot cannot move under another shelf while carrying a shelf
:- robot(RID, X, Y, T), move(RID, X1, Y1, T), transit(RID, SID1, T), shelf(SID2, X+X1, Y+Y1, T), shelf(SID1), shelf(SID2).