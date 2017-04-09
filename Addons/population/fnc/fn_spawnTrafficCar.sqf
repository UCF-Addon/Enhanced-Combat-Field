#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_center", [], [[]]]];

if ((count _center) != 3) exitWith {};

private _spawnData = [_center] call DFUNC(getCarSpawnData);

// Quickfix
if ((count ((_spawnData select 1) nearEntities ["Car", 30])) > 0) exitWith {};

private _grp = createGroup civilian;

private _veh = (_spawnData select 0) createVehicle (_spawnData select 1);
_veh setVariable [QGMVAR(isAmbient), _true, false];

// [_veh] call DFUNC(preventCollision);

_veh setDir (_spawnData select 2);
_veh setFuel (_spawnData select 3);

[_grp, _veh, (_spawnData select 4)] call DFUNC(inUnits);

[_center, _grp, _veh] call DFUNC(assignCarWaypoints);

// [_veh, false] call DFUNC(preventCollision);