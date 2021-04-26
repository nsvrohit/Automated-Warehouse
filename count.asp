% COUNT.ASP

% 1. Rows
nRows(NR) :- NR = #count{X: init(object(node, NID), value(at, pair(X, Y)))}.

% 2. Columns
nColumns(NC) :- NC = #count{Y: init(object(node, NID), value(at, pair(X, Y)))}.

% 3. Nodes
nNodes(NN) :- NN = #count{NID: init(object(node, NID), value(at, pair(X, Y)))}.

% 4. Picking Stations
nPickingStations(NPS) :- NPS = #count{PSID: init(object(pickingStation, PSID), value(at, pair(X, Y)))}.

% 5. Robots
nRobots(NRB) :- NRB = #count{RID: init(object(robot, RID), value(at, pair(X, Y)))}.

% 6. Shelves
nShelves(NS) :- NS = #count{SID: init(object(shelf, SID), value(at, pair(X, Y)))}.

% 7. Products
nProducts(NP) :- NP = #count{PID: init(object(product, PID), value(on, pair(Q, SID)))}.

% 8. Orders
nOrders(NO) :- NO = #count{OID: init(object(order, OID), value(pickingStation, PSID))}.