#include "script_component.h"

GMVAR(center) = [];

// Spawn Timers Variables
GMVAR(DOUBLE(car,spawnTimeout)) = 0;
GMVAR(DOUBLE(civ,spawnTimeout)) = 0;
GMVAR(DOUBLE(fur,spawnTimeout)) = 0;
GMVAR(DOUBLE(hel,spawnTimeout)) = 0;
GMVAR(DOUBLE(par,spawnTimeout)) = 0;

// Timer Vars
GMVAR(DOUBLE(civ,talk)) = 0;
GMVAR(DOUBLE(driver,speed)) = 0;

// Type Array
GMVAR(DOUBLE(car,types)) = [];
GMVAR(DOUBLE(civ,types)) = [];
GMVAR(DOUBLE(hel,types)) = [];
GMVAR(furCache) = [];

[] call DFUNC(prepareUnitTypes);
[] call DFUNC(prepareCarTypes);
// [] call DFUNC(prepareObjectTypes);

if (!isMultiplayer || isServer) then
{
	if (GMVAR(behaviourpFH)) then { GMVAR(behaviourpFH) = [DFUNC(pFHBehaviour), 0, [GMVAR(civilianpFH), GMVAR(trafficpFH)]] call CBA_fnc_addPerFrameHandler; };
	if (GMVAR(civilianpFH)) then { GMVAR(civilianpFH) = [DFUNC(pFHCivilian), 0, []] call CBA_fnc_addPerFrameHandler; };
	if (GMVAR(clearuppFH)) then { GMVAR(clearuppFH) = [DFUNC(pFHClearup), 1, []] call CBA_fnc_addPerFrameHandler; };
    if (GMVAR(centerpFH)) then { GMVAR(centerpFH) = [DFUNC(pFHCenter), 3, []] call CBA_fnc_addPerFrameHandler; };
    if (GMVAR(objectpFH)) then { GMVAR(objectpFH) = [DFUNC(pFHObjects), 0, []] call CBA_fnc_addPerFrameHandler; };
    if (GMVAR(trafficpFH)) then { GMVAR(trafficpFH) = [DFUNC(pFHTraffic), 0, []] call CBA_fnc_addPerFrameHandler; };
};