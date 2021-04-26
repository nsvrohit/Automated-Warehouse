% ACTION_EFFECTS.ASP

% 1. Moving a Robot.
robot(RID, object(node, NID2), T+1) :- robot(RID, object(node, NID1), T), node(NID1, loc(X, Y)), node(NID2, loc(X+DX, Y+DY)), moveRobot(RID, move(DX, DY), T).

% 2. Pick Up Shelf.
shelf(SID, object(robot, RID), T+1) :- shelf(SID, object(node, NID), T), robot(RID, object(node, NID), T), pickup(RID, SID, T).

% 3. Put Down Shelf.
shelf(SID, object(node, NID), T+1) :- shelf(SID, object(robot, RID), T), robot(RID, object(node, NID), T), putdown(RID, SID, T).

% 4. Deliver Product.
product(PID, object(shelf, SID), PQ-DQ, T+1) :- product(PID, object(shelf, SID), PQ, T), deliver(RID, OID, ship(SID, PID, DQ), T).
suborder(OID, object(node, NID), procure(PID, OQ-DQ), T+1) :- suborder(OID, object(node, NID), procure(PID, OQ), T), deliver(RID, OID, ship(SID, PID, DQ), T).