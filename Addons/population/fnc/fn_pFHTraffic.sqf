#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [];

private _carSpawn = false;
private _helSpawn = false;

GMVAR(DOUBLE(car,spawnTimeout)) = GMVAR(DOUBLE(car,spawnTimeout)) + 1;
GMVAR(DOUBLE(hel,spawnTimeout)) = GMVAR(DOUBLE(hel,spawnTimeout)) + 1;

if (GMVAR(DOUBLE(car,spawnTimeout)) >= GMVAR(DOUBLE(car,triggerSpawnTimeout))) then
{
	GMVAR(DOUBLE(car,spawnTimeout)) = 0;
	_carSpawn = true;
};

{
	if (_carSpawn) then
	{
		_amount = count ((_x nearEntities ["Car", GMVAR(DOUBLE(car,despawnRadius))]) select { ((_x getVariable [QGMVAR(isAmbient), _false]) == _true) });

		// TODO: calc density and offset space to fill empty
		if (_amount < 4) then
		{
			[_x] call DFUNC(spawnTrafficCar);
		};
	};
} forEach GMVAR(center);