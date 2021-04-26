% ACTION_CONSTRAINTS.ASP

% 1. Robot can perform only one action per time-step.
:- occurs(object(robot, RID), A1, T), occurs(object(robot, RID), A2, T), A1!=A2.

% 2. Restriction of Robot's movement.
:- robot(RID, object(node, NID), T), moveRobot(RID, move(DX, DY), T), node(NID, loc(X, Y)), X+DX<1.
:- robot(RID, object(node, NID), T), moveRobot(RID, move(DX, DY), T), node(NID, loc(X, Y)), Y+DY<1.
:- robot(RID, object(node, NID), T), moveRobot(RID, move(DX, DY), T), node(NID, loc(X, Y)), X+DX>NR, nRows(NR).
:- robot(RID, object(node, NID), T), moveRobot(RID, move(DX, DY), T), node(NID, loc(X, Y)), X+DX>NC, nColumns(NC).

% 3. Robot Picking Up a Shelf.

% 3.1. Two Robots cannot Pick Up the same Shelf.
:- 2{pickup(RID, SID, T): robot(RID)}, shelf(SID).

% 3.2. Robot cannot Pick Up a second Shelf.
:- pickup(RID, SID1, T), shelf(SID, object(robot, RID), T).

% 3.3. Robot cannot Pick Up a Shelf that in on another Robot.
:- pickup(RID1, SID, T), shelf(SID, object(robot, RID2), T).

% 3.4. Robot and Shelf must be on the same Node to enable Pick Up.
:- pickup(RID, SID, T), shelf(SID, object(node, NID), T), not robot(RID, object(node, NID), T).

% 4. Robot Putting Down a Shelf.

% 4.1. Two Robots cannot Put Down the same Shelf.
:- 2{putdown(RID, SID, T): robot(RID)}, shelf(SID).

% 4.2. Robot can Put Down a Shelf only if the Shelf is on the Robot.
:- putdown(RID, SID, T), not shelf(SID, object(robot, RID), T).

% 4.3. Shelves cannot be Put Down on Highways.
:- putdown(RID, SID, T), robot(RID, object(node, NID), T), highway(NID).

% 5. Delivery.

% 5.1. Robot can only Deliver when on a Picking Station.
:- deliver(RID, OID, ship(_, PID, _), T), suborder(OID, object(node, NID), procure(PID, _), T), not robot(RID, object(node, NID), T).

% 5.2. Robot can deliver Shelves containing the product.
:- deliver(RID, OID, ship(SID, PID, _), T), product(PID, object(shelf, SID), _, T), not shelf(SID, object(robot, RID), T).

% 5.3. Delivery Quantity cannot exceed Order requirements.
:- deliver(RID, OID, ship(SID, PID, DQ), T), suborder(OID, object(node, NID), procure(PID, OQ), T), DQ>OQ.

% 5.4. Delivery Quantity cannot exceed Product inventory.
:- deliver(RID, OID, ship(SID, PID, DQ), T), product(PID, object(shelf, SID), PQ, T), DQ>PQ.