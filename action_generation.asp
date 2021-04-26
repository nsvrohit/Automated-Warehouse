% ACTION_GENERATION.ASP

% 1. Move.
move(0, 1; 0, -1; 1, 0; -1, 0).

% 2. Move Robot.
{moveRobot(RID, move(DX, DY), T): move(DX, DY)}1 :- RID=1..NRB, nRobots(NRB), T=0..t-1.

% 3. Pick Up Shelf.
{pickup(RID, SID, T): shelf(SID)}1 :- RID=1..NRB, nRobots(NRB), T=0..t-1.

% 4. Put Down Shelf.
{putdown(RID, SID, T): shelf(SID)}1 :- RID=1..NRB, nRobots(NRB), T=0..t-1.

% 5. Deliver.
{deliver(RID, OID, ship(SID, PID, DQ), T): suborder(OID, object(node, NID), procure(PID, OQ), T), product(PID, object(shelf, SID), PQ, T), DQ=1..PQ}1 :- RID=1..NRB, nRobots(NRB), T=0..t-1.