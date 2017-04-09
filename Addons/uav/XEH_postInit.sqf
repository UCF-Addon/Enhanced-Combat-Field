#include "script_component.h"

GMVAR(assignedTargets) = [];

[QFUNC(dumpAssigned), DFUNC(dumpAssigned)] call CBA_fnc_addEventHandler;
[QFUNC(shareAssigned), DFUNC(shareAssigned)] call CBA_fnc_addEventHandler;

GMVAR(render) = [{call DFUNC(renderAssigned);}, 0] call CBA_fnc_addPerFrameHandler;