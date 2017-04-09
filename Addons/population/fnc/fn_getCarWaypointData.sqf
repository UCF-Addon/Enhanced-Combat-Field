#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: group <GROUP>
 * 1: vehicle <OBJECT>
 * 2: index <SCALAR>
 * 3: center merge roads <ARRAY>
 *
 * Return Value:
 * 0: position <POS3D>
 * 1: radius <SCALAR>
 *
 * Public: No
 */

params [["_grp", grpNull], ["_veh", objNull], ["_index", 0, [0]], ["_centerRoads", [], [[]]]];

if (isNull _grp || isNull _veh) exitWith {};

private _lastPos = (getPos _veh);

if (_index > 1) then
{
	_lastPos = getWPPos [_grp, (_index - 1)];
};

// TODO: add function for better perfomance while calculate position at roads
private _roadList = (_lastPos nearRoads GMVAR(DOUBLE(car,wpMaxRadius))) select { (isOnRoad _x) };
private _subRoadList = (_lastPos nearRoads GMVAR(DOUBLE(car,wpMinRadius))) select { (isOnRoad _x) };

_roadList = _roadList - _subRoadList;
_roadList = _centerRoads - (_centerRoads - _roadList);

private _road = selectRandom _roadList;

[(getPosASL _road), 50]