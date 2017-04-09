#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: center <POS3D>
 * 1: house <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_center", [], [[]]], ["_house", objNull, [objNull]]];

if ((count _center) != 3 || isNull _house) exitWith {};

if (isNil {_house getVariable QGMVAR(isPark)}) then
{
	_rand = round (random GMVAR(DOUBLE(par,spawnPercenage)));
	_house setVariable [QGMVAR(isPark), _rand, false];

	if (_rand < 1) exitWith {};
};

private _spawnData = [_house] call DFUNC(getParkSpawnData);
if (count _spawnData < 1) exitWith {};

private _veh = (_spawnData select 0) createVehicle (_spawnData select 1);

_veh setVariable [QGMVAR(isPark), _true, false];
_house setVariable [QGMVAR(parked), _veh, false];

_veh setDir (_spawnData select 2);
_veh setFuel (_spawnData select 3);

_veh setVehicleLock "LOCKED";