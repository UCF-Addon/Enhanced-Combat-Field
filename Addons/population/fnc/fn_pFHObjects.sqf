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

private _furSpawn = false;
private _parSpawn = false;

GMVAR(DOUBLE(fur,spawnTimeout)) = GMVAR(DOUBLE(fur,spawnTimeout)) + 1;
GMVAR(DOUBLE(par,spawnTimeout)) = GMVAR(DOUBLE(par,spawnTimeout)) + 1;

if (GMVAR(DOUBLE(fur,spawnTimeout)) >= GMVAR(DOUBLE(fur,triggerSpawnTimeout))) then
{
	GMVAR(DOUBLE(fur,spawnTimeout)) = 0;
	_furSpawn = true;
};

if (GMVAR(DOUBLE(par,spawnTimeout)) >= GMVAR(DOUBLE(par,triggerSpawnTimeout))) then
{
	GMVAR(DOUBLE(par,spawnTimeout)) = 0;
	_parSpawn = true;
};

private _startTime = diag_tickTime;

{
	_center = _x;

	if (_furSpawn) then
	{
		{
			if ((_x getVariable [QGMVAR(isFurnished), _false]) == _false) then
			{
				[_center, _x] spawn DFUNC(spawnFurniture);
			};
		} forEach (_center nearObjects ["House", GMVAR(DOUBLE(fur,spawnRadius))]);
	};

	if (_parSpawn) then
	{
		{
			if ((isNil {_x getVariable QGMVAR(isPark)}) || (((_x getVariable [QGMVAR(isPark), _false]) == _true) && (isNull (_x getVariable [QGMVAR(parked), objNull])))) then
			{
				_amount = count ((_x nearEntities ["Car", GMVAR(DOUBLE(par,despawnRadius))]) select { ((_x getVariable [QGMVAR(isPark), _false]) == _true) });

				// TODO: calc density and offset space to fill empty
				if (_amount > 5) exitWith {};

				[_center, _x] call DFUNC(spawnPark);
			};
		} forEach (_center nearObjects ["House", GMVAR(DOUBLE(par,spawnRadius))]);
	};
} forEach GMVAR(center);

private _stopTime = diag_tickTime;
if ((_stopTime - _startTime) > 0) then
{
	diag_log format ["Objects for Population took %1 ms", (_stopTime - _startTime)];
};