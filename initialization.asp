% sort and object declaration

boolean(t;f).

% locations

node(NID, X, Y) :- init(object(node, NID), value(at, pair(X, Y))).
highway(HID, X, Y) :- init(object(highway, HID), value(at, pair(X, Y))).
pickingStation(PSID, X, Y) :- init(object(pickingStation, PSID), value(at, pair(X, Y))).

% moving objects

robot(RID) :- init(object(robot, RID), value(at, pair(X, Y))).
robot(RID, X, Y, 0) :- init(object(robot, RID), value(at, pair(X, Y))).

shelf(SID) :- init(object(shelf, SID), value(at, pair(X, Y))).
shelf(SID, X, Y, 0) :- init(object(shelf, SID), value(at, pair(X, Y))).

% products

product(PID) :- init(object(product, PID), value(on, pair(Q, SID))).
product(PID, Q, SID, 0) :- init(object(product, PID), value(on, pair(Q, SID))).

% orders

order(OID, PSID) :- init(object(order, OID), value(pickingStation, PSID)).
procure(OID, PID, Q, 0) :- init(object(order, OID), value(line, pair(PID, Q))).

% robot is carrying a shelf
transit(f, RID, SID, 0) :- robot(RID), shelf(SID).