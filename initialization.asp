% INITIALIZATION.ASP

% 1. Locations

% 1.1. Node
node(NID) :- init(object(node, NID), value(at, pair(X, Y))).
loc(X, Y) :- init(object(node, NID), value(at, pair(X, Y))).
node(NID, loc(X, Y)) :- init(object(node, NID), value(at, pair(X, Y))).

% 1.2. Highway
highway(NID) :- init(object(highway, NID), value(at, pair(X, Y))).

% 1.3. Picking Station
pickingStation(PSID) :- init(object(pickingStation, PSID), value(at, pair(X, Y))), init(object(node, NID), value(at, pair(X, Y))).
pickingStation(PSID, NID) :- init(object(pickingStation, PSID), value(at, pair(X, Y))), init(object(node, NID), value(at, pair(X, Y))).

% 2. Moving Objects

% 2.1. Robot
robot(RID) :- init(object(robot, RID), value(at, pair(X, Y))).
robot(RID, object(node, NID), 0) :- init(object(robot, RID), value(at, pair(X, Y))), node(NID, loc(X, Y)).

% 2.2. Shelf
shelf(SID) :- init(object(shelf, SID), value(at, pair(X, Y))).
shelf(SID, object(node, NID), 0) :- init(object(shelf, SID), value(at, pair(X, Y))), node(NID, loc(X, Y)).

% 3. Product
product(PID) :- init(object(product, PID), value(on, pair(Q, SID))).
product(PID, object(shelf, SID), Q, 0) :- init(object(product, PID), value(on, pair(Q, SID))).

% 4. Order
order(OID) :- init(object(order, OID), value(pickingStation, PSID)).
suborder(OID, object(node, NID), procure(PID, Q), 0) :- init(object(order, OID), value(pickingStation, PSID)), pickingStation(PSID, NID), init(object(order, OID), value(line, pair(PID, Q))).