% OUTPUT_FORMAT.ASP

occurs(object(robot, RID), move(DX,DY), T) :- moveRobot(RID, move(DX, DY), T).
occurs(object(robot, RID), pickup, T) :- pickup(RID, _, T).
occurs(object(robot, RID), putdown, T) :- putdown(RID, _, T).
occurs(object(robot, RID), deliver(OID, PID, DQ), T) :- deliver(RID, OID, ship(SID, PID, DQ), T).