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

private _civSpawn = false;

GMVAR(DOUBLE(civ,spawnTimeout)) = GMVAR(DOUBLE(civ,spawnTimeout)) + 1;

if (GMVAR(DOUBLE(civ,spawnTimeout)) >= GMVAR(DOUBLE(civ,triggerSpawnTimeout))) then
{
	GMVAR(DOUBLE(civ,spawnTimeout)) = 0;
	_civSpawn = true;
};

private _startTime = diag_tickTime;

if (_civSpawn) then
{
	{
		if ((count (_x nearEntities ["Man", 450])) < 20) then
		{
			[_x] call DFUNC(spawnCivilian);
		};
	} forEach GMVAR(center);
};

private _stopTime = diag_tickTime;
if ((_stopTime - _startTime) > 0) then
{
	diag_log format ["Spawning one civilian took %1ms", (_stopTime - _startTime)];
};