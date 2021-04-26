% AUTOMATED_WAREHOUSE.ASP

#include "initialization.asp".
#include "count.asp".
#include "axioms.asp".
#include "action_generation.asp".
#include "action_effects.asp".
#include "action_constraints.asp".
#include "state_constraints.asp".
#include "output_format.asp".

% GOAL
:- not suborder(OID, object(node, _), procure(PID, 0), t), suborder(OID, object(node, _), procure(PID, _), 0). 

% OPTIMIZATION

% 1. Minimize Actions.
nActions(N) :- N = #sum{1, O, A, T: occurs(O, A, T)}.
#minimize{1, O, A, T: occurs(O, A, T)}.
#show nActions/1.

% 2. Minimize Time.
elapsedTime(N-1) :- N = #count{T: occurs(O, A, T)}.
#minimize{T: occurs(O, A, T)}.
#show elapsedTime/1.

#show occurs/3.