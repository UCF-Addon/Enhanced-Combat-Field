#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: nearest group <POS3D>
 *
 * Return Value:
 * 0: type <STRING>
 * 1: pos <POS3D>
 * 2: dir <SCALAR>
 * 3: fuel <SCALAR>
 * 4: passengers <SCALAR>
 *
 * Public: No
 */

params [["_nearestPos", [], [[]]]];

if ((count _nearestPos) != 3) exitWith {};

// TODO: add function for better perfomance while calculate position at roads
private _roadList = (_nearestPos nearRoads GMVAR(DOUBLE(car,spawnMaxRadius))) select { (isOnRoad _x) };
private _subRoadList = (_nearestPos nearRoads GMVAR(DOUBLE(car,spawnMinRadius))) select { (isOnRoad _x) };

_roadList = _roadList - _subRoadList;

private _road = selectRandom _roadList;

[([true, ID_TRAFFIC_CAR] call DFUNC(randomCarType)), (getPosASL _road), (getDir _road), (random 0.65), (floor (random 1))]