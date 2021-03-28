% state constraints

% picking station cannot be a highway
:- pickingStation(PSID, X, Y), highway(HID, X1, Y1), X=X1, Y=Y1.

% shelf cannot be on a highway
:- shelf(SID, X, Y, T), highway(HIX, X1, Y1), X=X1, Y=Y1.

% one robot cannot be on two nodes
:- 2{robot(RID, X, Y, T)}, robot(RID), T=0..t.

% two robots cannot be on the same node at a time
:- 2{robot(RID, X, Y, T): robot(RID)}, node(NID, X, Y), T=0..t.

% robots cannot swap
:- robot(RID1, X1, Y1, T), robot(RID1, X2, Y2, T+1), robot(RID2, X2, Y2, T), robot(RID2, X1, Y1, T+1), RID1!=RID2.

% one shelf cannot be on two nodes
:- 2{shelf(SID, X, Y, T)}, shelf(SID), T=0..t.

% two shelves cannot be on the same node at a time
:- 2{shelf(SID, X, Y, T): shelf(SID)}, node(NID, X, Y), T=0..t.