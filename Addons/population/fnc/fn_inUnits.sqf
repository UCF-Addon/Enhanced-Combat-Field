#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: group <GROUP>
 * 1: vehicle <OBJECT>
 * 2: amount of passengers <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_grp", grpNull, [grpNull]], ["_veh", objNull, [objNull]], ["_amount", 0, [0]]];

if (isNull _grp) exitWith {};
if (isNull _veh) exitWith {};

private _type = [] call DFUNC(randomUnitType);

private _driver = _grp createUnit [_type, (getPos _veh), [], 0, "FORM"];
[_driver] call DFUNC(setupCivilianUnit);

_driver moveInDriver _veh;

for "_i" from 0 to _amount do
{
	_type = [] call DFUNC(randomUnitType);
	_passenger = _grp createUnit [_type, (getPos _veh), [], 0, "FORM"];
	[_passenger] call DFUNC(setupCivilianUnit);

	_passenger moveInCargo _veh;
};