#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 * 1: group <GROUP>
 * 2: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_center", [], [[]]], ["_grp", grpNull, [grpNull]], ["_veh", objNull, [objNull]]];

if ((count _center) != 3 || isNull _grp || isNull _veh) exitWith {};

// TODO: add function for better perfomance while calculate position at roads
private _centerRoads = (_center nearRoads GMVAR(DOUBLE(car,wpMaxRadius))) select { (isOnRoad _x) };
private _subRoadList = (_center nearRoads GMVAR(DOUBLE(car,wpMinRadius))) select { (isOnRoad _x) };

_centerRoads = _centerRoads - _subRoadList;

for "_i" from 1 to GMVAR(DOUBLE(car,wpAmount)) do
{
	_wpData = [_grp, _veh, _i, _centerRoads] call DFUNC(getCarWaypointData);

	_wpType = "MOVE";
	if (_i == GMVAR(DOUBLE(car,wpAmount))) then
	{
		_wpType = "CYCLE";
	};

	_wp = _grp addWaypoint [(_wpData select 0), 0];
	_wp setWaypointCompletionRadius (_wpData select 1);
	_wp setWaypointType _wpType;
};