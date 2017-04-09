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

{
	if ((count (_center nearEntities ["Man", 450])) < 20) then
	{
		if (_civSpawn) then
        {
        	[_x] call DFUNC(spawnCivilian);
        };
	};
} forEach GMVAR(center);