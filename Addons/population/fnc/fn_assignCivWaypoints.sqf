#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 * 1: group <GROUP>
 * 2: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_center", [], [[]]], ["_grp", grpNull, [grpNull]], ["_unit", objNull, [objNull]]];

if ((count _center) != 3 || isNull _grp || isNull _unit) exitWith {};

// TODO: add function for better perfomance while calculate position at roads
private _houses = nearestObjects [_center, [], GMVAR(DOUBLE(civ,wpMaxRadius))];
_houses = _houses - (_house select { ((_x distance2D _unit) < GMVAR(DOUBLE(civ,wpMinRadius))) });

for "_i" from 1 to GMVAR(DOUBLE(civ,wpAmount)) do
{
	_wpData = [_grp, _unit, _i, _houses] call DFUNC(getCivilianWaypointData);

	_wpType = "MOVE";
	if (_i == GMVAR(DOUBLE(civ,wpAmount))) then
	{
		_wpType = "CYCLE";
	};

	_wp = _grp addWaypoint [(_wpData select 0), 0];
	_wp setWaypointCompletionRadius (_wpData select 1);
	_wp setWaypointType _wpType;
};