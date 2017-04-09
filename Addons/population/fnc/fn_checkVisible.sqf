#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_obj", objNull]];

if (isNull _obj) exitWith {};

if (_obj isKindOf "Car") exitWith
{
	_outOfRange = true;

	// TODO: check for visibility of player units to obj
	{
		if ((_obj distance _x) < GMVAR(DOUBLE(car,despawnRadius))) then
		{
			_outOfRange = false;
		};
	} forEach (allUnits - entities "HeadlessClient_F") select { (isPlayer _x && alive _x) };

	!_outOfRange
};

false