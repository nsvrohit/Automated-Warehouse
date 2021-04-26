% DOMAIN INDEPENDENT AXIOMS.ASP

% 1. Commonsense Law of Inertia.
robot(RID, object(node, NID), T+1) :- robot(RID, object(node, NID), T), not moveRobot(RID, move(_, _), T), T+1<=t.
shelf(SID, object(node, NID), T+1) :- shelf(SID, object(node, NID), T), not pickup(_, SID, T), T+1<=t.
shelf(SID, object(robot, RID), T+1) :- shelf(SID, object(robot, RID), T), not putdown(RID, SID, T), T+1<=t.
product(PID, object(shelf, SID), Q, T+1) :- product(PID, object(shelf, SID), Q, T), not deliver(_, _, ship(SID, PID, _), T), T+1<=t.
suborder(OID, object(node, NID), procure(PID, Q), T+1) :- suborder(OID, object(node, NID), procure(PID, Q), T), product(PID, object(shelf, SID), PQ, T), not deliver(_, OID, ship(SID, PID, _), T), T+1<=t.