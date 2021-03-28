% domain independent axioms

% uniqueness of fluents
:- not 1{robot(RID, X, Y, T)}1, T=1..t.
:- not 1{transit(B, RID, SID, T): boolean(B)}1, robot(RID), shelf(SID), T=1..t.

% actions are exogeneous
{move(RID, X1, Y1, T)} :- robot(RID), move(X1, Y1), T=0..t-1.
{pickup(RID, T)} :- robot(RID), T=0..t-1.
{deliver(RID, OID, PID, Q, T)} :- robot(RID), order(OID, PSID), product(PID), procure(OID, PID, Q, 0), T=0..t-1.

% commonsense law
{robot(RID, X, Y, T)} :- robot(RID, X, Y, T-1), robot(RID), T=1..t.
{shelf(SID, X, Y, T)} :- shelf(SID, X, Y, T-1), shelf(SID), T=1..t.
{transit(B, RID, SID, T+1)} :- transit(B, RID, SID, T), robot(RID), shelf(SID), T=0..t-1.