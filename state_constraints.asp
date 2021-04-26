% STATE_CONSTRAINTS.ASP

% 1. Picking Station cannot be a Highway.
:- pickingStation(_, NID), highway(NID).

% 2. Shelf cannot be on a Highway.
:- shelf(SID, object(node, NID), _), highway(NID).

% 3. Robot cannot be on two Nodes.
:- 2{robot(RID, object(node, NID), T): node(NID)}, robot(RID), T=0..t.

% 4. Two Robots cannot be on the same Node.
:- 2{robot(RID, object(node, NID), T): robot(RID)}, node(NID), T=0..t.

% 5. Robots cannot swap positions.
:- robot(RID1, object(node, NID1), T), robot(RID1, object(node, NID2), T+1), robot(RID2, object(node, NID2), T), robot(RID2, object(node, NID1), T+1), RID1!=RID2.

% 6. Shelf cannot be on two Nodes.
:- 2{shelf(SID, object(node, NID), T): node(NID)}, shelf(SID), T=0..t.

% 7. Two Shelves cannot be on the same Node.
:- 2{shelf(SID, object(node, NID), T): shelf(SID)}, node(NID), T=0..t.

% 8. Shelf cannot be on two Robots.
:- 2{shelf(SID, object(robot, RID), T): robot(RID)}, shelf(SID), T=0..t.

% 9. Two Shelves cannot be on the same Robot.
:- 2{shelf(SID, object(robot, RID), T): shelf(SID)}, robot(RID), T=0..t.

% 10. Shelf has to be either on Robot or on Node.
:- shelf(SID, object(robot, _), T), shelf(SID, object(node, _), T).